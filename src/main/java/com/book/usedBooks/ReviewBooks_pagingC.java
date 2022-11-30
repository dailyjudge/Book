package com.book.usedBooks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;

@WebServlet("/ReviewBooks_pagingC")
public class ReviewBooks_pagingC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int p = Integer.parseInt(request.getParameter("p2"));
		ReviewDAO.getALLReviews(request);
		ReviewDAO.paging(p, request);
		
		AccountDAO.getAdao().loginCheck(request);
		request.setAttribute("contentPage", "./jsp/jk/usedbooks.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
