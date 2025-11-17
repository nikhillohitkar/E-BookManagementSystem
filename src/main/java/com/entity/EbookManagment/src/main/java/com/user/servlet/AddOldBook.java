package com.user.servlet;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDrls;
import com.entity.user;
import com.mysql.cj.Session;

@WebServlet("/add_old_book")
@MultipartConfig // For file upload
public class AddOldBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
        	 HttpSession session = req.getSession();
             user u = (user) session.getAttribute("userobj");
            // ✅ Get form data
            String bookname = req.getParameter("bookname");
            String author = req.getParameter("author");
            float price = Float.parseFloat(req.getParameter("price"));
            String  categories="Old";
            String status = "Active";

            // ✅ File upload
            Part part = req.getPart("photo");
            String photo = part.getSubmittedFileName();
            String email = u.getEmail();
            // ✅ For now email is admin (you can take from session later)
                // ✅ Create Book object
            BookDrls b = new BookDrls(bookname, author, price, categories, status, photo, email);

            // ✅ Save in DB
            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
            boolean f = dao.addBooks(b);

           

            if (f) {
                // ✅ Save uploaded file in server folder
                String path = getServletContext().getRealPath("") + "book";
                File file = new File(path);
                if (!file.exists()) {
                    file.mkdir(); // create folder if not exists
                }

                part.write(path + File.separator + photo);
                System.out.print(path);
                session.setAttribute("succMsg", "Book Added Successfully");
                resp.sendRedirect("sell_book.jsp");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on server");
                resp.sendRedirect("sell_book.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failedMsg", "Server Error: " + e.getMessage());
            resp.sendRedirect("sell_book.jsp");
        }
    }
}
