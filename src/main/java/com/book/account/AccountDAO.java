package com.book.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.main.DBManager;
import com.book.main.SlideShow;
import com.book.usedBooks.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AccountDAO {

	private static final AccountDAO ADAO = new AccountDAO();

	private AccountDAO() {
	}

	public static AccountDAO getAdao() {
		return ADAO;
	}

	public void regAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("등록 함수!!");

		Connection con = null;
		PreparedStatement pstmt = null;

		String sql = "insert into Account values(?,?,?,?,?,?)";
		String path = request.getSession().getServletContext().getRealPath("fileFolder");

		MultipartRequest mr;
		mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

		String id = mr.getParameter("id");
		String name = mr.getParameter("name");
		String email = mr.getParameter("email");
		String pw = mr.getParameter("pw");
		String likes[] = mr.getParameterValues("chk");

		String textcheck = new String();

		System.out.println("값 받기 완료");
		if (likes != null) {
			for (int i = 0; i < likes.length; i++) {
				textcheck += likes[i] + " ";
			}
			System.out.println(textcheck);
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

			if (pstmt.executeUpdate() == 1) {
			} else {
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public boolean loginCheck(HttpServletRequest request) {

		HttpSession hs = request.getSession();
		Account a = (Account) hs.getAttribute("accountInfo");

		if (a == null) {
			request.setAttribute("checkNull", "1");
			request.setAttribute("loginPage", "jsp/lhg/login.jsp");
			return false;
		} else {
			request.setAttribute("checkNull", "0");
			request.setAttribute("loginPage", "jsp/lhg/loginOk.jsp");
			return true;
		}

	}

	public void login(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userID = request.getParameter("id");
		String userPW = request.getParameter("pw");
		String id2 = (String) request.getAttribute("id2");
		String pw2 = (String) request.getAttribute("pw2");

		if (id2 != null) {
			userID = id2;
			userPW = pw2;
		}

		try {
			con = DBManager.connect();
			String sql = "select *from Account where b_id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			if (rs.next()) {
				if (userPW.equals(rs.getString("b_pw"))) {
					request.setAttribute("r", "로그인 성공");

					Account a = new Account();
					a.setB_id(rs.getString("b_id"));
					a.setB_name(rs.getString("b_name"));
					a.setB_email(rs.getString("b_email"));
					a.setB_pw(rs.getString("b_pw"));
					String likes = rs.getString("b_likes");
					//likes = likes.replace("!", "&nbsp;");
					a.setB_likes(likes);
					a.setB_pic(rs.getString("b_pic"));

					request.setAttribute("account", a);

					HttpSession hs = request.getSession();
					hs.setAttribute("accountInfo", a);
					ArrayList<String> cids = new ArrayList<String>();
					String[] arr = rs.getString("b_likes").split(" ");
					// 101 102 103 104
					
					String like = "";
					for (String ll : arr) {
						like += ll + " ";
						like.replace("101", "소설");
						like.replace("102", "시/에세이");
						like.replace("104", "사회과학");
						like.replace("105", "역사와 문화");
						like.replace("115", "국어/외국어");
						like.replace("118", "자기계발");
						like.replace("119", "인문");
						like.replace("120", "종교/역학");
						like.replace("128", "여행");
					}
					
					for (int i = 0; i < arr.length; i++) {
						System.out.println(arr[i]);
						cids.add(arr[i]);
					}

					hs.setAttribute("cid", cids);

					hs.setMaxInactiveInterval(60 * 100);

				} else {
					request.setAttribute("r", "비밀번호 오류");
				}
			} else {
				request.setAttribute("r", "존재하지 않는 회원");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public void logout(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.invalidate();
	}

	public void updateAccount(HttpServletRequest request) throws IOException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update Account set b_name=?,b_email=?,b_pw=?,b_likes=?,b_pic=? where b_id=?";
		String path = request.getSession().getServletContext().getRealPath("fileFolder");
		MultipartRequest mr;
		mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

		Account a = (Account) request.getSession().getAttribute("accountInfo");
		String id = mr.getParameter("id");
		String name = mr.getParameter("name");
		String email = mr.getParameter("email");
		String pw = mr.getParameter("pw");
		String oldpw = mr.getParameter("oldpw");
		String check[] = mr.getParameterValues("chk");
		String textcheck = new String();
		if (check != null) {
			for (int i = 0; i < check.length; i++) {
				textcheck += check[i] + " ";
			}
		} else {
			textcheck = "관심사 없음";
		}

		String oldfile = mr.getParameter("oldfile");
		String newfile = mr.getFilesystemName("file");
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			if (pw == null || pw.isEmpty()) {
				pstmt.setString(3, oldpw);
			} else {
				pstmt.setString(3, pw);
			}
			pstmt.setString(4, textcheck);

			if (newfile == null) {
				pstmt.setString(5, oldfile);
			} else {
				pstmt.setString(5, newfile);
			}
			pstmt.setString(6, id);

			if (pstmt.executeUpdate() == 1) {
				request.setAttribute("r", "수정 완료");
				request.setAttribute("id2", a.getB_id());
				request.setAttribute("pw2", a.getB_pw());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public int updateCheck(HttpServletRequest request) {
		Account a = (Account) request.getSession().getAttribute("accountInfo");

		if (a != null) {
			return 1;
		} else {
			return 0;
		}
	}

	public int checkId(String id) {
		String sql = "select * from Account where b_id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int idCheck = 0;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next() || id.equals("")) {
				idCheck = 0;
			} else {
				idCheck = 1; // 존재하지 않는 경우, 생성 가능
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return idCheck;
	}

	public void getAllContents(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from usedbooks_board order by u_date desc";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			BoardBean b = null;
			ArrayList<BoardBean> boards = new ArrayList<>();

			while (rs.next()) {
				int no = rs.getInt("u_no");
				String author = rs.getString("u_author");
				String title = rs.getString("u_title");
				String content = rs.getString("u_content");
				String img = rs.getString("u_img");
				int price = rs.getInt("u_price");
				Date date = rs.getDate("u_date");

				// 보내주기
				// 객체 + 배열
				b = new BoardBean(no, author, title, content, img, price, date);

				boards.add(b);
			}

			request.setAttribute("boards", boards);

		} catch (Exception e) {

		}

	}

	public void findId(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String sql = "select * from Account where b_name=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("b_id");
				request.setAttribute("id", id);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public void findPw(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String id = request.getParameter("id");
		String sql = "select * from Account where b_id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String pw = rs.getString("b_pw");
				request.setAttribute("pw", pw);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public void deleteAccount(HttpServletRequest request) {
		// 계정 삭제
		
		String id = request.getParameter("id");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete account Account where b_id = ?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("삭제 완료");
				
				// 로그인한 세션 삭제
				HttpSession hs = request.getSession();
				hs.removeAttribute("accountInfo");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

}
