package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
        	HttpSession session= req.getSession();
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String pincode = req.getParameter("pincode");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String paymentType = req.getParameter("payment");

            String fullAdd = address + ", " + landmark + ", " + pincode;

           

            CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
            List<Cart> blist = dao.getBookByUser( id);
           if(blist.isEmpty()) {
        	   session.setAttribute("failedMsg","Plese Add the Item");
        	   resp.sendRedirect("cart.jsp");
        	   
        	   
           }else {
            BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
            
            
            ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
            Random r= new Random();
            for (Cart c : blist) {
            	Book_Order order = new Book_Order();
                order.setOrderId("Book_ORD-00"+ r.nextInt(1000));
                order.setUserName(name);
                order.setEmail(email);
                order.setPhno(phno);
                order.setFulladd(fullAdd);
                order.setBookName(c.getBookName());
                order.setAuthor(c.getAuthor());
                order.setPrice(String.valueOf(c.getPrice()));
                order.setPaymentType(paymentType);

                orderList.add(order);
               
            }
            if ("noselect".equals(paymentType)) {
            	session.setAttribute("failedMsg","Plese Choose Pyment Method");
                resp.sendRedirect("cart.jsp");
               
            }else {
            	boolean f= dao2.saveOrder(orderList);
            	if(f) {
            		resp.sendRedirect("order_success.jsp");
            	}
            	else {
            		System.out.println("Order failed");
            		
            	}
            	
            }}
           
           
        } catch(Exception e) {
        	e.printStackTrace();
        }
        
    }    }    
