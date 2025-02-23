package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.model.User;
import com.model.UserDAO;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterCont")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = request.getParameter("fname");
		String mail = request.getParameter("mail");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String rpass = request.getParameter("rpass");
		String status = request.getParameter("status");
		
		UserDAO ud = new UserDAO();
		
		if(ud.checkUser(uname)) {
			request.setAttribute("error","Username already exists");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
			return;
		}
		
		if(ud.checkEmail(mail)) {
			request.setAttribute("error","Already an user, Login");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
			return;
		}
		
		if(!pass.equals(rpass)) {
			request.setAttribute("error", "Retype the password correctly");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
			return;
		}
		
		if(status == null) {
			request.setAttribute("error", "Agree to the Terms & Conditions");
			request.getRequestDispatcher("Register.jsp").forward(request, response);
			return;
		}
		
		User user = new User(fname, mail, uname, pass);
		ud.saveUser(user);
		request.setAttribute("message", "Registered successfully, Login");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
		return;
	}

}
