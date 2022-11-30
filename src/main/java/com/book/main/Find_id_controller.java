package com.book.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;
@WebServlet("/Find_id_controller")
public class Find_id_controller extends HttpServlet {
	
	private AccountDAO a = AccountDAO.getAdao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		a.loginCheck(request);
		request.setAttribute("contentPage", "jsp/lhg/findId.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		a.findId(request, response);
		a.loginCheck(request);
		request.setAttribute("contentPage", "jsp/lhg/idInfo.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
}
