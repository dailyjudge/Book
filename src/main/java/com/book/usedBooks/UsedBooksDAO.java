package com.book.usedBooks;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.book.account.Account;
import com.book.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UsedBooksDAO {

	public static void showContent(HttpServletRequest request) {
		// 해당 게시글 보여주기
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from usedbooks_board where u_no = ?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			int target_no = Integer.parseInt(request.getParameter("no"));
			
			System.out.println("타겟!!!!" + target_no);
			pstmt.setInt(1, target_no);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				int no = rs.getInt("u_no");
				String author = rs.getString("u_author");
				String title = rs.getString("u_title");
				String content = rs.getString("u_content");
				String img = rs.getString("u_img");
				int price = rs.getInt("u_price");
				Date date = rs.getDate("u_date");
				
				BoardBean b = new BoardBean(no, author, title, content, img, price, date);
				
				request.setAttribute("target", b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}

	public static void deleteBoard(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete usedbooks_board where u_no = ?";
		int target_no = Integer.parseInt(request.getParameter("no"));
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, target_no);
			
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("완료!");
			}	
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static void regBoard(HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("board_img");
		MultipartRequest mr;
		System.out.println(path);
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			
			System.out.println(path);
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String img = mr.getFilesystemName("file");
			int price = Integer.parseInt(mr.getParameter("price"));
			
			
			// id, 제목, 내용, 이미지, 가격 
			String sql = "insert into usedbooks_board values (usedbooks_board_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			
			HttpSession hs = request.getSession();
			Account a = (Account) hs.getAttribute("accountInfo");
			
			String id = "";
			
			if(a != null) {
				id = a.getB_id();
				con = DBManager.connect();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				pstmt.setString(2, title);
				pstmt.setString(3, content);
				pstmt.setString(4, img);
				pstmt.setInt(5, price);
				
				if(pstmt.executeUpdate() == 1) {
					System.out.println("등록 완료!!");
				}
			} else {
				System.out.println("로그인되지 않은 상태.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void updateBoard(HttpServletRequest request) {
		// no, title, content, price
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int price = Integer.parseInt(request.getParameter("price"));
		
		// DB에 가서 수정
		
		String sql = "update usedbooks_board set u_title = ?, u_content = ?, u_price = ?, u_date = sysdate where u_no = ?";
		
		
		try {
			con = DBManager.connect();
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, price);
			pstmt.setInt(4, no);
			
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("수정 완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}
	

}
