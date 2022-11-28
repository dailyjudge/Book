package com.book.usedBooks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;

@WebServlet("/UsedBooks_main_controller")
public class UsedBooks_main_controller extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AccountDAO.getAdao().getAllContents(request);

		AccountDAO.getAdao().loginCheck(request);
		request.setAttribute("contentPage", "./jsp/jk/usedbooks.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
