package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class AdminLoginSvc {
	public AdminInfo getAdminLogin(String id, String pw) {
		Connection conn = getConnection();
		AdminLoginDao adminLoginDao = AdminLoginDao.getInstance();
		adminLoginDao.setConnection(conn);
		
		AdminInfo adminInfo = adminLoginDao.getAdminLogin(id, pw);
		close(conn);
		
		return adminInfo;
	}
}
