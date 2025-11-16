package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.entity.BookDrls;
import com.entity.Cart;
import com.sun.tools.javac.util.*;
import com.DB.DBConnect;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String sql = "INSERT INTO cart(bid, uid, bookName, author, price, total_price) VALUES(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUserid());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	 public List <Cart>getBookByUser(int userId) {
		// TODO Auto-generated method stub
		List<Cart> list=new ArrayList<Cart>();
		double totalPrice=0.00;
		Cart c=null;
		try {
			 String sql="select * from cart where uid=?";
			 PreparedStatement ps= conn.prepareStatement(sql);
			 ps.setInt(1,userId);
			 ResultSet rs=ps.executeQuery();
			 while( rs.next()) {
				 c=new Cart();
				 c.setCid(rs.getInt(1));
				 c.setBid(rs.getInt(2));
				 c.setUserid(rs.getInt(3));
				 c.setBookName(rs.getString(4));
				 c.setAuthor(rs.getString(5));
				 c.setPrice(rs.getDouble(6));
				 
				  totalPrice=totalPrice+rs.getDouble(7);
				  c.setTotalPrice(totalPrice);
				  
	list.add(c);
			 }
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}

	@Override
	public boolean deleteBook(int bid,int uid,int cid) {
	    boolean f = false;
	    String sql = "DELETE FROM cart WHERE bid=? AND uid=? AND cid=?";

	    
	    try {
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, bid);
	        ps.setInt(2, uid);
	        ps.setInt(3, cid);
	        
	        int i = ps.executeUpdate(); // Execute the deletion
	        if (i > 0) {
	            f = true; // deletion was successful
	        }
	        
	        ps.close(); // close the statement
	    } catch (SQLException e) {
	        e.printStackTrace(); // print the error if something goes wrong
	    }
	    
	    return f; // return true if deleted, false otherwise
	}
}



