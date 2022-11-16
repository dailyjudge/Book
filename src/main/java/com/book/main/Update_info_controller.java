package com.book.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;

@WebServlet("/Update_info_controller")
public class Update_info_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			AccountDAO.getAdao().loginCheck(request);
			request.setAttribute("contentPage", "jsp/lhg/Update_info.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			AccountDAO.getAdao().updateAccount(request);
			AccountDAO.getAdao().loginCheck(request);
			request.setAttribute("contentPage", "jsp/lhg/User_info.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
