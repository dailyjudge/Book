package com.book.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {

	public static Connection connect() throws SQLException {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		return DriverManager.getConnection(url,"c##jk","jk");
	}
	
	
								//db.close(con,pstmt,rs);
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		
		try {
			if(rs != null) {
				rs.close();				
			}			
			if(pstmt != null) {
				pstmt.close();
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
}
