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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            userDAOimpl dao = new userDAOimpl(DBConnect.getConn());
            HttpSession session = req.getSession();

            String email = req.getParameter("email").trim();
            String password = req.getParameter("password").trim();

            // ✅ Admin login
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                user us = new user();
                us.setEmail(email);
                us.setName("Admin");
                session.setAttribute("userobj", us);
                resp.sendRedirect(req.getContextPath() + "/admin/Home.jsp");


            } else {
                // ✅ Normal user login
                user us = dao.login(email, password);
                if (us != null) {
                    session.setAttribute("userobj", us);
                    resp.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("failMsg", "Email & Password Invalid");
                    resp.sendRedirect("login.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
