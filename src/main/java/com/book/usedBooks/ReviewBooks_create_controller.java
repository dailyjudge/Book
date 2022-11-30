package com.book.usedBooks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;

@WebServlet("/ReviewBooks_create_controller")
public class ReviewBooks_create_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("후기 게시판 입성");
		AccountDAO.getAdao().loginCheck(request);

		request.setAttribute("contentPage", "./jsp/kye/reviews_create.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("후기 게시글 생성");
		AccountDAO.getAdao().loginCheck(request);

		ReviewDAO.createReview(request);
		ReviewDAO.getCreatedReview(request);

		request.setAttribute("contentPage", "./jsp/kye/reviews_detail.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

}
