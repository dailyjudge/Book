package com.book.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;
@WebServlet("/Id_check")
public class Id_check extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("EUC-KR");
					
		String userId = request.getParameter("userId");

		PrintWriter out = response.getWriter();

		int idCheck = AccountDAO.getAdao().checkId(userId);

		if (idCheck == 0) {
			System.out.println("이미 존재하는 아이디입니다.");
		} else if (idCheck == 1) {
			System.out.println("사용 가능한 아이디입니다.");
		}
				
		out.write(idCheck + "");
		}
	}

