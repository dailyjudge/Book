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

	private AccountDAO a = AccountDAO.getAdao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	a.getAdao().login(request);
	request.setAttribute("contentPage", "jsp/lhg/login.jsp");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	a.getAdao().login(request);
	request.setAttribute("contentPage", "jsp/bb.jsp");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
