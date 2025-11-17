package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BookDAOimpl;
import com.DB.DBConnect;

@WebServlet("/deleteBook")
public class DeleteBookServlet extends HttpServlet {

    /**
	 * 
	 */
	

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        try {
            // ✅ Get book id from request
            int id = Integer.parseInt(req.getParameter("id"));

            // ✅ Call DAO
            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
            boolean f = dao.deleteBook(id);

            // ✅ Handle result
            if (f) {
                req.getSession().setAttribute("succMsg", "Book deleted successfully!");
                resp.sendRedirect("admin/all_books.jsp?id=" + id);

            } else {
                req.getSession().setAttribute("errorMsg", "Failed to delete book. Try again!");
                resp.sendRedirect("admin/all_books.jsp?id=" + id);
            }

            // ✅ Redirect to all_books.jsp
           

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "Error: " + e.getMessage());
            resp.sendRedirect("admin/all_books.jsp");
        }
    }
}
