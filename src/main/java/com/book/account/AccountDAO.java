package com.book.account;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AccountDAO {

	public static void regAccount(HttpServletRequest request) throws IOException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into book values(?,?,?,?,?,?)";
		
		String path = request.getSession().getServletContext().getRealPath("fileFolder");
		MultipartRequest mr;
		mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		
		String id = mr.getParameter("id");
		String name = mr.getParameter("name");
		String email = mr.getParameter("email");
		String pw = mr.getParameter("pw");
		String likes[] = mr.getParameterValues("chk");
		String textcheck = new String();

		if (likes != null) {
			for (int i = 0; i < likes.length; i++) {
				textcheck += likes[i] + " ";
			}
		} else {
			textcheck = "관심사 없음";
		}
		
		String pic = mr.getFilesystemName("file");
	
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, pw);
			pstmt.setString(5, textcheck);
			pstmt.setString(6, pic);
			pstmt.executeUpdate();
			request.setAttribute("r", "회원 가입 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
		
	}

}
