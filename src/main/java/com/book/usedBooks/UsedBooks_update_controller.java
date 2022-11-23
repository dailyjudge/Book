package com.book.usedBooks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;

/**
 * Servlet implementation class UsedBooks_update_controller
 */
@WebServlet("/UsedBooks_update_controller")
public class UsedBooks_update_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("title") == null) {
			request.setAttribute("contentPage", "./jsp/jk/usedbooks_update.jsp");
		}  else {
			// 수정 하는 일
			UsedBooksDAO.updateBoard(request);
			
			request.setAttribute("contentPage", "./jsp/jk/usedbooks_detail.jsp");
		}
		
		AccountDAO.getAdao().loginCheck(request);
		UsedBooksDAO.showContent(request);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
