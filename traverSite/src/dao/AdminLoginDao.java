package dao;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import vo.*;

public class AdminLoginDao {
	// 로그인에 관련된 쿼리 작업을 처리하는 클래스
		private static AdminLoginDao adminLoginDao; // 생성된 LoginDao의 인스턴스르 저장할 멤버
		private Connection conn;
		private AdminLoginDao() {}
		// 기본 생성자를 private으로 선언하여 외부에서 함부로 인스턴스를 생성하지 못하게 막는다.
		
		public static AdminLoginDao getInstance() {
		// AdminLoginDao클래스의 인스턴스를 생성해주는 메소드로 인스턴스가 존재할 경우 기존의 인스턴스를 리턴
		// AdminLoginDao클래스의 인스턴스를 하나만 생성하여 사용하게 하는 싱글톤 방식
			if (adminLoginDao == null) {
				adminLoginDao = new AdminLoginDao();
				// 이미 생성된 AdminLoginDao클래스의 인스턴스가 없으면 새롭게 AdminLoginDao클래스의 인스턴스를 생성
			}
			return adminLoginDao;
		}
		public void setConnection(Connection conn) {
		// 현 Dao클래스에서 사용할 커넥션 객체를 받아와서 생성해주는 메소드
			this.conn = conn;
		}

		public AdminInfo getAdminLogin(String id, String pw) {
			Statement stmt = null; // 로그인 처리를 위한 쿼리를 DB로 보낼 Statement 선언
			ResultSet rs = null; // 로그인 처리를 위한 쿼리의 실행 결과를 받을 ResultSet 선언
			AdminInfo adminInfo = null; // rs에 담아온 결과를 저장할 MemberInfo형 인스턴스 선언
			
			try {
				String sql = "select * from t_admin_info where ai_isuse = 'y' " + 
						" and ai_id = '" + id + "' and ai_pw = '" + pw + "' ";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {	// rs에 데이터가 있으면(로그인이 성공했을 경우)
					adminInfo = new AdminInfo();	// 어드민 정보를 저장할 인스턴스 생성
					adminInfo.setAi_id(id);
					adminInfo.setAi_pw(pw);
					adminInfo.setAi_name(rs.getString("ai_name"));
					adminInfo.setAi_isuse(rs.getString("ai_isuse"));
					// rs가 비었으면 else 없이 adminInfo 인스턴스에  null이 있는 상태로 리턴한다.
				}
			} catch (Exception e) {
				System.out.println("AdminLoginDao클래스의 getAdminLogin() 메소드 오류");
				e.printStackTrace();
			} finally {
				close(rs);
				close(stmt);
			}
			
			return adminInfo;
		}
		
}
