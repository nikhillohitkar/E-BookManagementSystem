package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get current session (don't create new one if not exists)
            HttpSession session = request.getSession(false);

            if (session != null) {
                // Remove user object
                session.removeAttribute("userobj");

                // Add success message
                session.setAttribute("succMsg", "Logout Successfully");

                // Redirect to login page
                response.sendRedirect("login.jsp");
            } else {
                // If no session, just redirect
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // optional: create an error page
        }
    }
}
