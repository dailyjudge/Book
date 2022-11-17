package com.book.account;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.book.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AccountDAO {

	private static final AccountDAO ADAO = new AccountDAO();

	private AccountDAO() {
	}

	public static AccountDAO getAdao() {
		return ADAO;
	}

	public void regAccount(HttpServletRequest request) throws IOException {

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

			if (pstmt.executeUpdate() == 1) {
				request.setAttribute("r", "회원 가입 성공");
			} else {
				request.setAttribute("r", "회원 가입 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public void loginCheck(HttpServletRequest request) {

		HttpSession hs = request.getSession();
		Account a = (Account) hs.getAttribute("accountInfo");
		if (a == null) {
			request.setAttribute("loginPage", "jsp/lhg/login.jsp");
		} else {
			request.setAttribute("loginPage", "jsp/lhg/loginOk.jsp");
		}
		
	}

	public void login(HttpServletRequest request) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userID = request.getParameter("id");
		String userPW = request.getParameter("pw");
		try {
			con = DBManager.connect();
			String sql = "select *from book where b_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (userPW.equals(rs.getString("b_pw"))) {
					request.setAttribute("r", "로그인 성공");

					Account a = new Account();
					a.setB_id(rs.getString("b_id"));
					a.setB_name(rs.getString("b_name"));
					a.setB_email(rs.getString("b_email"));
					a.setB_pw(rs.getString("b_pw"));
					String likes = rs.getString("b_likes");
					likes = likes.replace("!", "&nbsp;");
					a.setB_likes(likes);
					a.setB_pic(rs.getString("b_pic"));

					request.setAttribute("account", a);

					HttpSession hs = request.getSession();
					hs.setAttribute("accountInfo", a);
					hs.setMaxInactiveInterval(60);

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
		hs.setAttribute("accountInfo", null);
	}

	public void updateAccount(HttpServletRequest request) throws IOException {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update book set b_name=?,b_email=?,b_pw=?,b_likes=?,b_pic=? where b_id=?";
		String path = request.getSession().getServletContext().getRealPath("fileFolder");
		MultipartRequest mr;
		mr = new MultipartRequest(request, path, 30 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

		Account a = (Account) request.getSession().getAttribute("accountInfo");
		String id = mr.getParameter("id");
		String name = mr.getParameter("name");
		String email = mr.getParameter("email");
		String pw = mr.getParameter("pw");
		String check[] = mr.getParameterValues("chk");
		String oldChk = mr.getParameter("textcheck");
		String textcheck = new String();
		if (check != null) {
			for (int i = 0; i < check.length; i++) {
				for (String s : check) {
					textcheck += "!";
				}
				textcheck += check[i] + " ";
			}
		} else {
			textcheck = oldChk;
		}

		String oldfile = mr.getParameter("file");
		String newfile = mr.getFilesystemName("file");
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, pw);
			pstmt.setString(4, textcheck);
			
			if (newfile == null) {				
				pstmt.setString(5, oldfile);
			} else {
				pstmt.setString(5, newfile);
			}
			pstmt.setString(6, id);
			
			if (pstmt.executeUpdate()==1) {
				request.setAttribute("r", "수정 완료");
				request.setAttribute("id", a.getB_id());
				request.setAttribute("pw", a.getB_pw());
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
		}else {
			return 0;
		}
		
	}
}
