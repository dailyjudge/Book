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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountDAO.getAdao().loginCheck(request);
		request.setAttribute("contentPage", "jsp/lhg/login_input.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountDAO.getAdao().login(request);
		AccountDAO.getAdao().loginCheck(request);
		SlideShow.post(request);
		request.setAttribute("contentPage", "jsp/kmj&jmk/slideImg.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

			
}
