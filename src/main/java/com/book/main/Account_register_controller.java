package com.book.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;

@WebServlet("/Account_register_controller")
public class Account_register_controller extends HttpServlet {

	private AccountDAO a = AccountDAO.getAdao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("loginPage", "jsp/lhg/login.jsp");
		request.setAttribute("contentPage", "jsp/lhg/reg.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		a.regAccount(request, response);
		request.setAttribute("loginPage", "jsp/lhg/login.jsp");
		request.setAttribute("contentPage", "jsp/kmj&jmk/slideImg.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
