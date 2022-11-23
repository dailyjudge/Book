package com.book.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.account.AccountDAO;
@WebServlet("/Info_check")
public class Info_check extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("EUC-KR");
					
		String userName = request.getParameter("userName");

		PrintWriter out = response.getWriter();

		int nameCheck = AccountDAO.getAdao().checkName(userName);

		if (nameCheck == 0) {
			System.out.println("우리 회원 맞습니다.");
		} else if (nameCheck == 1) {
			System.out.println("우리 회원 아닙니다.");
		}
				
		out.write(nameCheck + "");
		}
	
	}

