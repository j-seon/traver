package dao;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import vo.*;

public class LoginDao {
	private static LoginDao loginDao; 
	private Connection conn;
	private LoginDao() {}
	
	public static LoginDao getInstance() {
		if (loginDao == null) 	loginDao = new LoginDao();
		
		return loginDao;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public MemberInfo getLoginMember(String uid, String pwd) {
		Statement stmt = null;	
		ResultSet rs = null; 		
		MemberInfo loginInfo = null;	
		
		try {
			String sql = "select * from t_member_info where mi_status = 'a' and mi_id = '" + uid + "' and mi_pw = '" + pwd + "' ";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {	
				loginInfo = new MemberInfo();
				loginInfo.setMi_id(uid);
				loginInfo.setMi_nickname(rs.getString("mi_nickname"));
				loginInfo.setMi_pw(pwd);
				loginInfo.setMi_mbti(rs.getString("mi_mbti"));
				loginInfo.setMi_name(rs.getString("mi_name"));
				loginInfo.setMi_mail(rs.getString("mi_mail"));
				loginInfo.setMi_birth(rs.getString("mi_birth"));
				loginInfo.setMi_join(rs.getString("mi_join"));
				loginInfo.setMi_last(rs.getString("mi_last"));
				loginInfo.setMi_status(rs.getString("mi_status"));
			} 
			
		} catch(Exception e) {
			System.out.println("LoginDao 클래스의 getLoginMember() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs); close(stmt);
		}
		
		return loginInfo;
	}

}
