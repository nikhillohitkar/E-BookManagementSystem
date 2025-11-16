package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDrls;

@WebServlet("/edit_books")
@MultipartConfig
public class EditBooksServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        try {
            // ✅ Get form data
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bookname");
            String author = req.getParameter("author");
            Float price = (float) Double.parseDouble(req.getParameter("price"));
            
            String status = req.getParameter("status");

            // ✅ Handle file (optional)
            Part part = req.getPart("photo");
            String fileName = part != null ? part.getSubmittedFileName() : null;

            // ✅ Create book object
            BookDrls b = new BookDrls();
            b.setBookId(id);
            b.setBookName(bookName);
            b.setAuthor(author);
            b.setPrice((float) price);
           
            b.setStatus(status);
            if (fileName != null && !fileName.isEmpty()) {
                b.setPhoto(fileName);
                // 👉 save uploaded file into "book" folder if required
                // String path = getServletContext().getRealPath("") + "book";
                // part.write(path + File.separator + fileName);
            }

            // ✅ Call DAO
            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
            boolean f = dao.updateBook(b);

            // ✅ Redirect with message
            if (f) {
                req.setAttribute("succMsg", "Book updated successfully!");
                resp.sendRedirect("admin/all_books.jsp?id=" + id);
            } else {
                req.setAttribute("errorMsg", "Something went wrong. Try again!");
                resp.sendRedirect("admin/edit_books.jsp?id=" + id);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "Error: " + e.getMessage());
            resp.sendRedirect("admin/edit_books.jsp");
        }
    }
}
