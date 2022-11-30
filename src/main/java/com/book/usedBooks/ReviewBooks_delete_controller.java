package com.book.usedBooks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;
import com.book.main.Account_register_controller;

@WebServlet("/ReviewBooks_delete_controller")
public class ReviewBooks_delete_controller extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AccountDAO.getAdao().loginCheck(request);
		ReviewDAO.deleteReview(request);
		ReviewDAO.getALLReviews(request);
		AccountDAO.getAdao().getAllContents(request);
		request.setAttribute("contentPage", "./jsp/jk/usedbooks.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
