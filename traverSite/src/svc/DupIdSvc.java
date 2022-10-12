package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class DupIdSvc {
	public int chkDupId(String uid) {
		int result = 0;
		Connection conn = getConnection();
		DupIdDao dupIdDao = DupIdDao.getInstance();
		dupIdDao.setConnection(conn);
		result = dupIdDao.chkDupId(uid);
		close(conn);

		return result;
	}
}
