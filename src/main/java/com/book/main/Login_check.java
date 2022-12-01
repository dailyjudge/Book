package com.book.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.book.account.AccountDAO;
@WebServlet("/Login_check")
public class Login_check extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login_check controller");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		PrintWriter out = response.getWriter();

		int pwCheck = AccountDAO.getAdao().checkPw(userId, userPw);
		
		if (pwCheck == 0) {
			System.out.println("비밀번호가 맞지 않습니다.");
		}
			
		
		out.write(pwCheck + "");
		}
	}

