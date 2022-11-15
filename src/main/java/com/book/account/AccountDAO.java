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

	public boolean loginCheck(HttpServletRequest request) {
		
		HttpSession hs = request.getSession();
		Account a = (Account) hs.getAttribute("accountInfo");
		if (a == null) {
			request.setAttribute("contentPage", "jsp/lhg/login.jsp");
			return false;
		} else {
			request.setAttribute("contentPage", "jsp/lhg/loginOk.jsp");
			return true;
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
					request.setAttribute("r", "로그인 성공!");
					
					Account a = new Account();
					a.setB_id(rs.getString("b_id"));
					a.setB_name(rs.getString("b_name"));
					a.setB_email(rs.getString("b_email"));
					a.setB_pw(rs.getString("b_pw"));
					a.setB_likes(rs.getString("b_likes"));
					a.setB_pic(rs.getString("b_pic"));

					request.setAttribute("account", a);

					HttpSession hs = request.getSession();
					hs.setAttribute("accountInfo", a);
					hs.setMaxInactiveInterval(10);

				} else {
					request.setAttribute("r", "비밀번호 오류!");
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

	public void updateAccount(HttpServletRequest request) {
		
	}
}
