package com.book.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.Account;
import com.book.account.AccountDAO;
@WebServlet("/Logout_controller")
public class Logout_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	AccountDAO.getAdao().logout(request);
	request.setAttribute("loginPage", "jsp/lhg/login.jsp");
	request.setAttribute("contentPage", "jsp/bb.jsp");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
