package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class AdminPlaceProcDelSvc {
    public int adminPlaceProcDel(String where) {
        int result = 0;
        Connection conn = getConnection();
        AdminPlaceProcDelDao adminPlaceProcDelDao = AdminPlaceProcDelDao.getInstance();
        adminPlaceProcDelDao.setConnection(conn);

        result = adminPlaceProcDelDao.adminPlaceProcDel(where);
        if (result >= 1) {
            commit(conn);   // 여러 상품 삭제시에는 result가 1이상일 수 있음
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }
}
