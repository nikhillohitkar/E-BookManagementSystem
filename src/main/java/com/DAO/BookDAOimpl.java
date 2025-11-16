package com.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDrls;

public class BookDAOimpl implements BookDAO {

	private Connection conn;

	public BookDAOimpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDrls b) {
		boolean f = false;
		try {
			// ✅ use correct table and column names
			String sql = "INSERT INTO book_drls(bookname, author, price, categories, status, photo, email) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setFloat(3, b.getPrice());
			ps.setString(4, b.getCategories());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// ✅ Fetch all books from DB
	@Override
	public List<BookDrls> getAllBooks() {
		List<BookDrls> list = new ArrayList<>();
		try {
			String sql = "SELECT * FROM book_drls";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BookDrls b = new BookDrls();
				b.setBookId(rs.getInt("bookid")); // assuming you have bookid as PK
				b.setBookName(rs.getString("bookname"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getFloat("price"));
				b.setCategories(rs.getString("categories"));
				b.setStatus(rs.getString("status"));
				b.setPhoto(rs.getString("photo"));
				b.setEmail(rs.getString("email"));

				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public BookDrls getBookById(int id) {
		BookDrls b = null;
		try {
			String sql = "select * from book_drls where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				b = new BookDrls();
				b.setBookId(rs.getInt("bookid")); // assuming you have bookid as PK
				b.setBookName(rs.getString("bookname"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getFloat("price"));
				b.setCategories(rs.getString("categories"));
				b.setStatus(rs.getString("status"));
				b.setPhoto(rs.getString("photo"));
				b.setEmail(rs.getString("email"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public boolean updateBook(BookDrls b) {
		boolean f = false;
		try {
			String sql = "UPDATE book_drls SET bookname=?, author=?, price=?, status=? WHERE bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());

			ps.setString(4, b.getStatus());

			ps.setInt(5, b.getBookId());

			int i = ps.executeUpdate();
			if (i == 1)
				f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteBook(int id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM book_drls WHERE bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<BookDrls> getNewBook() {
		List<BookDrls> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM book_drls WHERE categories=? AND status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int count = 0; // counter to limit 4 results

			while (rs.next() && count < 4) {
				BookDrls b = new BookDrls();
				b.setBookId(rs.getInt("bookid"));
				b.setBookName(rs.getString("bookname"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getFloat("price"));
				b.setCategories(rs.getString("categories"));
				b.setStatus(rs.getString("status"));
				b.setPhoto(rs.getString("photo"));

				list.add(b);
				count++; // increase counter
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDrls> getRecentBook() {
		// TODO Auto-generated method stub
		List<BookDrls> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM book_drls WHERE  status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int count = 0; // counter to limit 4 results

			while (rs.next() && count < 4) {
				BookDrls b = new BookDrls();
				b.setBookId(rs.getInt("bookid"));
				b.setBookName(rs.getString("bookname"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getFloat("price"));
				b.setCategories(rs.getString("categories"));
				b.setStatus(rs.getString("status"));
				b.setPhoto(rs.getString("photo"));

				list.add(b);
				count++; // increase counter
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDrls> getOldBook() {
		List<BookDrls> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM book_drls WHERE categories=? AND status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int count = 0; // counter to limit 4 results

			while (rs.next() && count < 4) {
				BookDrls b = new BookDrls();
				b.setBookId(rs.getInt("bookid"));
				b.setBookName(rs.getString("bookname"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getFloat("price"));
				b.setCategories(rs.getString("categories"));
				b.setStatus(rs.getString("status"));
				b.setPhoto(rs.getString("photo"));

				list.add(b);
				count++; // increase counter
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDrls> getAllNewBook() {
		List<BookDrls> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM book_drls WHERE categories=? AND status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int count = 0; // counter to limit 4 results

			while (rs.next()) {
				BookDrls b = new BookDrls();
				b.setBookId(rs.getInt("bookid"));
				b.setBookName(rs.getString("bookname"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getFloat("price"));
				b.setCategories(rs.getString("categories"));
				b.setStatus(rs.getString("status"));
				b.setPhoto(rs.getString("photo"));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDrls> getAllRecentBook() {
		List<BookDrls> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM book_drls WHERE  status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			// counter to limit 4 results

			while (rs.next()) {
				BookDrls b = new BookDrls();
				b.setBookId(rs.getInt("bookid"));
				b.setBookName(rs.getString("bookname"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getFloat("price"));
				b.setCategories(rs.getString("categories"));
				b.setStatus(rs.getString("status"));
				b.setPhoto(rs.getString("photo"));

				list.add(b);
				// increase counter
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDrls> getAllOldBook() {
		List<BookDrls> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM book_drls WHERE categories=? AND status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BookDrls b = new BookDrls();
				b.setBookId(rs.getInt("bookid"));
				b.setBookName(rs.getString("bookname"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getFloat("price"));
				b.setCategories(rs.getString("categories"));
				b.setStatus(rs.getString("status"));
				b.setPhoto(rs.getString("photo"));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDrls> getBookByOld(String email, String cate) {
		// TODO Auto-generated method stub
		List<BookDrls> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM book_drls WHERE categories=? AND email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BookDrls b = new BookDrls();
				b.setBookId(rs.getInt("bookid"));
				b.setBookName(rs.getString("bookname"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getFloat("price"));
				b.setCategories(rs.getString("categories"));
				b.setStatus(rs.getString("status"));
				b.setPhoto(rs.getString("photo"));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cat, int id) {
		boolean f = false;
		try {
			String sql = "DELETE  FROM book_drls WHERE categories=? AND email=? AND bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
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
	public List<BookDrls> getBookBySerch(String ch) {
		
		List<BookDrls> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM book_drls WHERE bookname like ? or author like ? or categories like ? AND status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BookDrls b = new BookDrls();
				b.setBookId(rs.getInt("bookid"));
				b.setBookName(rs.getString("bookname"));
				b.setAuthor(rs.getString("author"));
				b.setPrice(rs.getFloat("price"));
				b.setCategories(rs.getString("categories"));
				b.setStatus(rs.getString("status"));
				b.setPhoto(rs.getString("photo"));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

}