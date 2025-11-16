package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.user;
import com.entity.BookDrls;
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        try {
            int bid = Integer.parseInt(req.getParameter("bid"));  // book id
            HttpSession session = req.getSession();
            user u = (user) session.getAttribute("userobj");      // current logged user

            if (u == null) {
                session.setAttribute("failedMsg", "Please login first!");
                resp.sendRedirect("login.jsp");
                return;
            }

            BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
            BookDrls b=dao.getBookById(bid);

            Cart c = new Cart();
            c.setBid(bid);
            c.setUserid(u.getId());                   // make sure setter is setUid not setUserid
            c.setBookName(b.getBookName());
            c.setAuthor(b.getAuthor());
            c.setPrice((double) b.getPrice());              // directly set
            c.setTotalPrice((double) b.getPrice());         // here totalPrice = price (later can add quantity)

            CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
            boolean f = dao2.addCart(c);

            if (f) {
                session.setAttribute("succMsg", "Book Added to Cart Successfully.");
            } else {
                session.setAttribute("failedMsg", "Something went wrong, try again!");
            }
            resp.sendRedirect("all_new_book.jsp");   // redirect back to book page

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
