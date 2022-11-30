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


	return DriverManager.getConnection(url, "c##mk", "mk");
>>>>>>> 62ed849702a29d1f14846f15fca463f57fcf9334


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
