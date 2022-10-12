package dao;

import static db.JdbcUtil.*;
import java.sql.*;

import vo.MemberInfo;

public class DupIdDao {
	private static DupIdDao dupIdDao;
	private Connection conn;
	private DupIdDao() {}
	
	public static DupIdDao getInstance() {
		if (dupIdDao == null)	dupIdDao = new DupIdDao();
		return dupIdDao;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	public int chkDupId(String uid) {
	// 회원 가입시 사용자가 사용할 아이디의 중복 여부를 리턴하는 메소드
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			String sql = "select count(*) from t_member_info where mi_id = '" + uid + "'";
			System.out.println(sql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			result = rs.getInt(1);

		} catch(Exception e) {
			System.out.println("DupIdDao 클래스의 chkDupId() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return result;
	}
}
