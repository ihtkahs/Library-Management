package com.model;

import java.sql.*;

public class UserDAO {
	
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	String fname="";
	int userid = 0;
	
	public UserDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "Shakthi2004#");
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public String authenticate(String uname, String pass) {
		String sql = "select userid,fname from user where uname = ? and password = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, uname);
			pst.setString(2, pass);
			rs = pst.executeQuery();
			if(rs.next()) {
				userid = rs.getInt(1);
				fname = rs.getString(2);
			} else {
				return "error";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userid+"/"+fname;
	}
	
	public boolean checkUser(String uname) {
		String sql = "select uname from user where uname=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, uname);
			rs = pst.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean checkEmail(String mail) {
		String sql = "select uname, email from user where mail=?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(2, mail);
			rs = pst.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void saveUser(User user) {
		String sql = "insert into user(fname, uname, password, mail) values(?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getFname());
			pst.setString(2, user.getUname());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getMail());
			
			int result = pst.executeUpdate();
			
			if(result > 0) {
				System.out.println("Data Stored Successfully");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet listUser() {
		return rs;
	}
}
