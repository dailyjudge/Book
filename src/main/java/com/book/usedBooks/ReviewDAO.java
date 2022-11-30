package com.book.usedBooks;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.book.account.Account;
import com.book.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import oracle.jdbc.proxy.annotation.Pre;

public class ReviewDAO {

	
	private static ArrayList<Review> reviews;

	
	
	
	public static void getALLReviews(HttpServletRequest request) {

		// review_board 디비에서 모든 정보를 가져오기
//		rv_no number(5) primary key,
//		rv_author varchar2(20 char) not null,
//		rv_title varchar2(20 char)not null,
//		rv_content varchar2(300 char)not null,
//		rv_img varchar2(200 char)not null,
//		rv_date date not null

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from review_board";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// Array 배열 : 고정 길이
			// 가변 배열 => ArrayList

			Review r = null;
			reviews = new ArrayList<Review>();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

			while (rs.next()) {
				int rv_no = rs.getInt("rv_no");
				String rv_author = rs.getString("rv_author");
				String rv_title = rs.getString("rv_title");
				String rv_content = rs.getString("rv_content");
				String rv_img = rs.getString("rv_img");
				Date date = rs.getTimestamp("rv_date");

				String rv_date = sdf.format(date);

				r = new Review(rv_no, rv_author, rv_title, rv_content, rv_img, rv_date);

				reviews.add(r);
			}

			request.setAttribute("reviews", reviews);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void getReview(HttpServletRequest request) {
		// 가져오기.

		int no = Integer.parseInt(request.getParameter("no"));

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from review_board where rv_no = ?";

		try {

			// 1. DB에 연결
			con = DBManager.connect();
			// 2. 쿼리문 준비(+ 세팅 및 실행)
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);

			// 3. 실행 결과 반환
			rs = pstmt.executeQuery();

			Review r = null;

			if (rs.next()) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

				int rv_no = rs.getInt("rv_no");
				String rv_author = rs.getString("rv_author");
				String rv_title = rs.getString("rv_title");
				String rv_content = rs.getString("rv_content");
				String rv_img = rs.getString("rv_img");
				Date date = rs.getTimestamp("rv_date");

				String rv_date = sdf.format(date);

				r = new Review(rv_no, rv_author, rv_title, rv_content, rv_img, rv_date);
			}

			request.setAttribute("review", r);
			System.out.println("조회 완료!!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void createReview(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		HttpSession hs = request.getSession();
		Account a = (Account) hs.getAttribute("accountInfo");

		String rv_author = a.getB_id();
		System.out.println("111");
		String sql = "insert into review_board values(review_board_seq.nextval, ? , ? , ? ,? ,sysdate)";

		MultipartRequest mr;
		try {
			String path = request.getSession().getServletContext().getRealPath("review_img");
			System.out.println(path);
			mr = new MultipartRequest(request, path, 1024 * 1024 * 30, "utf-8", new DefaultFileRenamePolicy());

			String rv_title = mr.getParameter("title");
			String rv_content = mr.getParameter("content");
			String rv_img = mr.getFilesystemName("file");

			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, rv_author);
			pstmt.setString(2, rv_title);
			pstmt.setString(3, rv_content);
			pstmt.setString(4, rv_img);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("리뷰 등록 완료!!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}

	}

	public static void getCreatedReview(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from review_board order by rv_date desc";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

				int rv_no = rs.getInt("rv_no");
				String rv_author = rs.getString("rv_author");
				String rv_title = rs.getString("rv_title");
				String rv_content = rs.getString("rv_content");
				String rv_img = rs.getString("rv_img");
				Date date = rs.getTimestamp("rv_date");

				String rv_date = sdf.format(date);

				Review r = new Review(rv_no, rv_author, rv_title, rv_content, rv_img, rv_date);

				request.setAttribute("review", r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static void deleteReview(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from review_board where rv_no=?";
		int rv_no = Integer.parseInt(request.getParameter("no"));

		try {

			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rv_no);

			if (pstmt.executeUpdate() == 1) {
				System.out.println("삭제완료!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}

	}

	public static void updateReview(HttpServletRequest request) {

		int rv_no = Integer.parseInt(request.getParameter("no"));
		String rv_title = request.getParameter("title");
		String rv_content = request.getParameter("content");
		String sql = "update REVIEW_BOARD set rv_title = ? , rv_content = ? where rv_no = ?";

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, rv_title);
			pstmt.setString(2, rv_content);
			pstmt.setInt(3, rv_no);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("수정완료");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}

	}

	public static void paging(int page, HttpServletRequest request) {
		request.setAttribute("curPageNo2", page);
		
		int cnt = 4;
		int total = reviews.size();
		System.out.println(total);
		
		int pageCount = (int) Math.ceil(((double)total/cnt));
		
		request.setAttribute("pageCount2", pageCount);
		
		int start = total - (cnt *(page - 1));
		int end = (page == pageCount) ? -1 : start - (cnt +1);
		
		ArrayList<Review> items = new ArrayList<Review>();
		for(int i=start-1; i> end; i--) {
			items.add(reviews.get(i));
		}
		
		request.setAttribute("reviews", items);
		
	}
	
	
	
	
}
