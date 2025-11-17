package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.user;

public class userDAOimpl {

	private Connection conn;

	public userDAOimpl(Connection conn) {
		this.conn = conn;
	}

	// ✅ Register new user
	public boolean userRegister(user us) {
		boolean f = false;
		try {
			String sql = "INSERT INTO student_table(name, phone, email, password) VALUES (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, us.getName());
			ps.setString(2, us.getNumber());
			ps.setString(3, us.getEmail());
			ps.setString(4, us.getPassword());

			System.out.println("DEBUG (Register): " + ps);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
				System.out.println("✅ User registered successfully!");
			} else {
				System.out.println("❌ Registration failed!");
			}

		} catch (Exception e) {
			System.out.println("ERROR in userRegister: " + e.getMessage());
			e.printStackTrace();
		}
		return f;
	}

	// ✅ Login user
	public user login(String email, String password) {
		user us = null;
		try {
			String sql = "SELECT * FROM student_table WHERE email=? AND password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			System.out.println("DEBUG (Login): " + ps);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				us = new user();
				us.setId(rs.getInt("id"));
				us.setName(rs.getString("name"));
				us.setNumber(rs.getString("phone"));
				us.setEmail(rs.getString("email"));
				us.setPassword(rs.getString("password"));
			} else {
				System.out.println("❌ Login failed: No matching user");
			}

		} catch (Exception e) {
			System.out.println("ERROR in login: " + e.getMessage());
			e.printStackTrace();
		}
		return us;
	}

	// Check password by email
	public boolean checkPassword(int id, String ps) {
		boolean f = false;
		try {
			String sql = "SELECT * FROM student.student_table WHERE id=? AND password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// Update profile by email
	public boolean updateProfile(user us) {
		boolean f = false;
		try {
			String sql = "UPDATE student_table set name=?, phone=?,email=? WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getNumber());
			ps.setString(3, us.getEmail());
			ps.setInt(4, us.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean checkUser(String email) {
	    boolean exists = false;
	    String sql = "SELECT * FROM student_table WHERE email = ?";

	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, email);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                exists = true; // User already exists
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return exists;
	}


}
