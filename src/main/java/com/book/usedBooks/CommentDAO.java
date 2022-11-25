package com.book.usedBooks;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.book.account.Account;
import com.book.main.DBManager;

public class CommentDAO {

	public static ArrayList<Comment> showAllComment(HttpServletRequest request) {
		// 고유 번호, 작성자, 게시글 번호, 댓글 내용, 작성 시각

		int board_num = Integer.parseInt(request.getParameter("no"));

		// comment_table

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select c_no, c_author, c_boardNo, c_date, b_pic, c_content from account, usedbooks_board, comment_table where b_id = u_author and u_no = c_boardNo and c_boardNo = ? order by c_date desc";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, board_num);

			rs = pstmt.executeQuery();

			// 댓글 고유 number, 작성자, 게시글 번호, 작성일, 이미지

			ArrayList<Comment> comments = new ArrayList<>();
			Comment c = null;

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

			while (rs.next()) {
				int comment_number = rs.getInt("c_no");
				String author_id = rs.getString("c_author");
				int board_number = rs.getInt("c_boardNo");
				String comment_content = rs.getString("c_content");
				Date date = rs.getTimestamp("c_date");
				String img_url = rs.getString("b_pic");

				String formatted_date = sdf.format(date);

				comments.add(
						new Comment(comment_number, author_id, board_number, comment_content, formatted_date, img_url));

			}

			for (Comment cc : comments) {
				System.out.println(cc);
			}
			request.setAttribute("comments", comments);

			return comments;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return null;

	}

	public static JSONObject regComment(HttpServletRequest request) {
		// insert into comment_table values(comment_table_seq.nextval, 'test', 102, '테스트
		// 1번', sysdate);
		System.out.println("들어옴!!");
		// 등록하는 일 수행
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 등록 계정 확인
		HttpSession hs = request.getSession();

		Account a = (Account) hs.getAttribute("accountInfo");

		String user_id = a.getB_id();
		int board_num = Integer.parseInt(request.getParameter("no"));
		String comment_content = request.getParameter("content");

		String sql = "insert into comment_table values(comment_table_seq.nextval, ?, ?, ?, sysdate)";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, user_id);
			pstmt.setInt(2, board_num);
			pstmt.setString(3, comment_content);

			if (pstmt.executeUpdate() == 1) {

				// 댓글 고유 number 가져오기
				sql = "select c_no, c_date from comment_table order by c_date desc";

				pstmt = con.prepareStatement(sql);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					JSONObject obj = new JSONObject();

					obj.put("comment_number", rs.getString("c_no"));
					obj.put("author_id", user_id);
					obj.put("board_number", board_num);
					obj.put("comment_content", comment_content);

					Date date = rs.getTimestamp("c_date");

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

					String formatted_date = sdf.format(date);
					obj.put("date", formatted_date);
					obj.put("image", a.getB_pic());

					return obj;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
		return null;

	}

	public static JSONArray arrayToJson(ArrayList<Comment> data) {

		// comment_number
		// author_id
		// board_number
		// comment_content
		// date
		// image
		JSONObject sobj = new JSONObject();

		JSONArray jArray = new JSONArray();
		for (int i = 0; i < data.size(); i++) {

			JSONObject obj = new JSONObject();
			obj.put("comment_number", data.get(i).getComment_number());
			obj.put("author_id", data.get(i).getAuthor_id());
			obj.put("board_number", data.get(i).getBoard_number());
			obj.put("comment_content", data.get(i).getComment_content());
			obj.put("date", data.get(i).getDate());
			obj.put("image", data.get(i).getImage());
			jArray.add(i, obj);

		}
		return jArray;

	}

	public static void delComment(HttpServletRequest request) {
		// 댓글 삭제하는 일 수행
		// comment_table
		int comment_number = Integer.parseInt(request.getParameter("no"));
		System.out.println("타겟 댓글 숫자 : " + comment_number);

		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "delete comment_table where c_no = ?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, comment_number);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("삭제 완료");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}

	}

	public static void updateComment(HttpServletRequest request) {
		// 댓글 수정

		int no = Integer.parseInt(request.getParameter("no"));
		String content = request.getParameter("content");

		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "update comment_table set c_content = ? where c_no = ?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, content);
			pstmt.setInt(2, no);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("댓글 수정 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static JSONArray getAllReplyOfComment(HttpServletRequest request) {
		// 댓글에 해당하는 번호를 받아 대댓글 뽑기

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int no = Integer.parseInt(request.getParameter("no"));

		System.out.println("컨트롤러 넘버 :  " + no);
		
		String sql = "select b_pic, r_author, u_no, r_commentNo, r_no, r_content, r_date from account, usedbooks_board, comment_table, replyOfComment where b_id = u_author and u_no = c_boardNo and c_no = r_commentNo and c_no = ? order by r_date desc";

		try {

			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

			JSONArray jArray = new JSONArray();
			
			HttpSession hs = request.getSession();
			Account user = (Account) hs.getAttribute("accountInfo");
			
			String login_id = "";
			
			if(user == null) {
				login_id = "null";
			} else {
				login_id = user.getB_id();
			}
			
			while (rs.next()) {
				String img = rs.getString("b_pic");
				String id = rs.getString("r_author");
				int boardNo = rs.getInt("u_no");
				int commentNo = rs.getInt("r_commentNo");
				int replyNo = rs.getInt("r_no");
				String content = rs.getString("r_content");
				Date date = rs.getTimestamp("r_date");

				String formattedDate = sdf.format(date);

				JSONObject obj = new JSONObject();
				
				System.out.println("id : " + id);
				obj.put("id", id);
				obj.put("boardNo", boardNo);
				obj.put("commentNo", commentNo);
				obj.put("replyNo", replyNo);
				obj.put("content", content);
				obj.put("date", formattedDate);
				obj.put("img", img);
				obj.put("loginId", login_id);
				jArray.add(obj);
			}

			return jArray;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return null;
	}

	public static JSONObject regReply(HttpServletRequest request) {
//		replyOfComment
//				r_no number(5) primary key,
//				r_author varchar(20 char) not null,
//				r_commentNo number(5) not null,
//				r_content varchar2(150 char) not null,
//				r_date date not null
			
		int r_commentNo = Integer.parseInt(request.getParameter("no"));
		String r_content = request.getParameter("content");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "insert into replyOfComment values(replyOfComment_seq.nextval, ?, ?, ?, sysdate)";
		// 1: user_id
		// 2: commentNo
		// 3: content
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			HttpSession hs = request.getSession();
			Account a = (Account) hs.getAttribute("accountInfo");
			
			String r_author = a.getB_id();
			
			pstmt.setString(1, r_author);
			pstmt.setInt(2, r_commentNo);
			pstmt.setString(3, r_content);
			
			// 여기에 필요한 정보
			// 고유 넘버, author 아이디, 이미지, 제목, 내용
			JSONObject obj = new JSONObject();
			if(pstmt.executeUpdate() == 1) {
				System.out.println("댓글 추가 완료");
				
				sql = "select b_pic, b_id, u_no, r_commentNo, r_no, r_content, r_date from account, usedbooks_board, comment_table, replyOfComment where b_id = u_author and u_no = c_boardNo and c_no = r_commentNo and c_no = ? order by r_date desc";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, r_commentNo);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				int replyNo = rs.getInt("r_no");
				String img = rs.getString("b_pic");
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				
				Date date = rs.getTimestamp("r_date");

				String formattedDate = sdf.format(date);
				
				
				obj.put("replyNo", replyNo);
				obj.put("img", img);
				obj.put("author", r_author);
				obj.put("commentNo", r_commentNo);
				obj.put("content", r_content);
				obj.put("date", formattedDate);
			}
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
		return null;
	}

	public static void delReply(HttpServletRequest request) {
		// 대댓글을 삭제하는 일
		// 대댓글 번호 입력 받음
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete replyOfComment where r_no = ?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("삭제 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

}
