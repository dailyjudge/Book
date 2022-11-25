package com.book.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Account_delete_controller")
public class Account_delete_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 회원 탈퇴 기능을 수행하는 일
		AccountDAO.getAdao().deleteAccount(request);
		
		AccountDAO.getAdao().loginCheck(request);
		
		request.setAttribute("contentPage", "jsp/kmj&jmk/slideImg.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
