package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.userDAOimpl;
import com.DB.DBConnect;
import com.entity.user;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            System.out.println("Form Data: " + name + " " + phone + " " + email);

            user us = new user();
            us.setName(name);
            us.setNumber(phone);
            us.setEmail(email);
            us.setPassword(password);

            HttpSession session = req.getSession();

            userDAOimpl dao = new userDAOimpl(DBConnect.getConn());

            // Check if user already exists
            boolean userExists = dao.checkUser(email);

            if (userExists) {
                session.setAttribute("succMsg", "User Already Exists!");
                resp.sendRedirect("register.jsp");
            } else {
                boolean registered = dao.userRegister(us);
                if (registered) {
                    session.setAttribute("succMsg", "Registration Successful!");
                    resp.sendRedirect("login.jsp");
                } else {
                    session.setAttribute("succMsg", "Registration Failed!");
                    resp.sendRedirect("register.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
