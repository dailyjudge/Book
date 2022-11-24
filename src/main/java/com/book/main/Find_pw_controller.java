package com.book.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;

@WebServlet("/Find_pw_controller")
public class Find_pw_controller extends HttpServlet {
	private AccountDAO a = AccountDAO.getAdao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("loginPage", "jsp/lhg/login.jsp");
		request.setAttribute("contentPage", "jsp/lhg/findPw.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		a.findPw(request,response);
		request.setAttribute("loginPage", "jsp/lhg/login.jsp");
		request.setAttribute("contentPage", "jsp/lhg/pwInfo.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

}
