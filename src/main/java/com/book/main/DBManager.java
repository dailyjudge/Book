package com.book.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {
public static Connection connect() throws SQLException {
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
<<<<<<< HEAD
	return DriverManager.getConnection(url, "c##hg", "hg");
=======


	return DriverManager.getConnection(url, "c##kye", "kye");


>>>>>>> 596f905ce69c6187e5a6d3267b2496c41cfa6df6
}
// db.close(con,pstmt,rs)
public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
	try {
		if (rs != null) {			
			rs.close();
		}
		pstmt.close();
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

}
