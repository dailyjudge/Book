package com.book.book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;

@WebServlet("/Book_bestSeller_controller")
public class Book_bestSeller_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AccountDAO.getAdao().loginCheck(request);
        if(request.getAttribute("checkNull").equals("1")||AccountDAO.getAdao().checkCids(request)) {
        	request.setAttribute("contentPage", "jsp/kmj&jmk/book_bestSeller_notLogin.jsp");
        }else {
        	request.setAttribute("contentPage", "jsp/kmj&jmk/book_bestSeller.jsp");
        }
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
