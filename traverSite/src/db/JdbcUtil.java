package db;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class JdbcUtil {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Context initCtx = new InitialContext(); 
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQLDB");
			conn = ds.getConnection();
			conn.setAutoCommit(false); 
		} catch(Exception e) {
			System.out.println("DB 연결 실패!!!!!!!!!!!");
			e.printStackTrace();
		}
		return conn;
	}
	public static void close(Connection conn) {
		try { conn.close(); } catch(Exception e) { e.printStackTrace(); }
	}
	public static void close(Statement stmt) {	
		try { stmt.close(); } catch(Exception e) { e.printStackTrace(); }
	}
	public static void close(ResultSet rs) {	
		try { rs.close(); } catch(Exception e) { e.printStackTrace(); }
	}
	public static void commit(Connection conn) {
		try {
			conn.commit();
			System.out.println("쿼리 성공");
		} catch(Exception e) { e.printStackTrace(); }
	}
	public static void rollback(Connection conn) {
		try {
			conn.rollback();
			System.out.println("쿼리 실패");
		} catch(Exception e) { e.printStackTrace(); }
	}
}
