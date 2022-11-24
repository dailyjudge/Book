package com.book.usedBooks;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/Comment_getAll_controller")
public class Comment_getAll_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("넘어옴");
		// 모든 데이터를 가져와서 뿌려주는 역할 수행
		ArrayList<Comment> data = CommentDAO.showAllComment(request);
		
		System.out.println("넘어옴3");
		
		PrintWriter out = response.getWriter();
		System.out.println("넘어옴4");
		
		//JSONObject jo = new JSONObject();
		//jo.put("dataa", data);
		out.print(CommentDAO.arrayToJson(data));
		response.setContentType("application/json;charset=utf-8");
		
		System.out.println("넘어옴6");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
