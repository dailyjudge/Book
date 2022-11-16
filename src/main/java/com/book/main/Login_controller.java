package com.book.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;
@WebServlet("/Login_controller")
public class Login_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setAttribute("loginPage", "jsp/lhg/login_input.jsp");
	request.setAttribute("contentPage", "jsp/bb.jsp");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	AccountDAO.getAdao().login(request);
	AccountDAO.getAdao().loginCheck(request);
	request.setAttribute("contentPage", "jsp/bb.jsp");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
