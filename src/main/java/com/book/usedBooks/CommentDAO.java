package com.book.usedBooks;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.book.main.DBManager;

public class CommentDAO {

	public static void showAllComment(HttpServletRequest request) {
		// 고유 번호, 작성자, 게시글 번호, 댓글 내용, 작성 시각
		
		int board_num = Integer.parseInt(request.getParameter("no"));
		
		// comment_table
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		String sql = "select c_no, c_author, c_boardNo, c_date, b_pic, c_content from book, usedbooks_board, comment_table where b_id = u_author and u_no = c_boardNo and c_boardNo = ?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, board_num);
			
			
			rs = pstmt.executeQuery(); 
			
			// 댓글 고유 number, 작성자, 게시글 번호, 작성일, 이미지
			
			ArrayList<Comment> comments = new ArrayList<>();
			Comment c = null;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			
			while(rs.next()) {
				int comment_number = rs.getInt("c_no");
				String author_id = rs.getString("c_author");
				int board_number = rs.getInt("c_boardNo");
				String comment_content = rs.getString("c_content");
				Date date = rs.getTimestamp("c_date");
				String img_url = rs.getString("b_pic");
				
				String formatted_date = sdf.format(date);
				
				comments.add(new Comment(comment_number, author_id, board_number, comment_content, formatted_date, img_url));
				
			}
			
			request.setAttribute("comments", comments);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	
		
	}

}
