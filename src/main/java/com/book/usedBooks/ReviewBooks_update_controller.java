package com.book.usedBooks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;
import com.book.main.Account_register_controller;

@WebServlet("/ReviewBooks_update_controller")
public class ReviewBooks_update_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("title") == null) {
			request.setAttribute("contentPage", "./jsp/kye/reviews_update.jsp");

		} else {
			ReviewDAO.updateReview(request);
			request.setAttribute("contentPage", "./jsp/kye/reviews_detail.jsp");
		}

			AccountDAO.getAdao().loginCheck(request);
			ReviewDAO.getReview(request);

		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
