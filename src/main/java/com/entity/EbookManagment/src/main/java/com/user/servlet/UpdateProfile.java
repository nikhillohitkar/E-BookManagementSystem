package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.userDAOimpl;
import com.DB.DBConnect;
import com.entity.user;

@WebServlet("/update_profile")
public class UpdateProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            // Validation
            if (name == null || name.isEmpty() || phone == null || phone.isEmpty() || email == null || email.isEmpty()) {
                session.setAttribute("errorMsg", "All fields are required.");
                resp.sendRedirect("EditProfile.jsp");
                return;
            }

            user us = new user();
            us.setId(id);
            us.setName(name);
            us.setNumber(phone);
            us.setEmail(email);

            userDAOimpl dao = new userDAOimpl(DBConnect.getConn());

            if (dao.checkPassword(id, password)) {
                if (dao.updateProfile(us)) {
                    session.setAttribute("succMsg", "Profile Updated Successfully!");
                } else {
                    session.setAttribute("errorMsg", "Something went wrong on the server.");
                }
            } else {
                session.setAttribute("errorMsg", "Your password is incorrect.");
            }

            resp.sendRedirect("EditProfile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMsg", "Server error occurred: " + e.getMessage());
            resp.sendRedirect("EditProfile.jsp");
        }
    }
}
