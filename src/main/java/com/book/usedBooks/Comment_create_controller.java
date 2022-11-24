package com.book.usedBooks;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/Comment_create_controller")
public class Comment_create_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JSONObject obj = CommentDAO.regComment(request);
		
		System.out.println("obj :" + obj);
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		
		out.print(obj);	
		
		
	}

}
