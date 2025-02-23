package com.model;

public class User {
	
	private int userid;
	private String fname;
	private String mail;
	private String uname;
	private String password;
	
	public User(String fname, String mail, String uname, String password) {
		this.fname = fname;
		this.mail = mail;
		this.uname = uname;
		this.password = password;
	}

	public User(String uname, String password) {
		this.uname = uname;
		this.password = password;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
