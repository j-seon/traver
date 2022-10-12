package dao;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import vo.*;

public class AdminPlaceProcDelDao {
    private static AdminPlaceProcDelDao adminPlaceProcDelDao;
    private Connection conn;
    private AdminPlaceProcDelDao() {}

    public static AdminPlaceProcDelDao getInstance() {
        if (adminPlaceProcDelDao == null)    adminPlaceProcDelDao = new AdminPlaceProcDelDao();
        return adminPlaceProcDelDao;
    }

    public void setConnection(Connection conn) {
        this.conn = conn;
    }

    public int adminPlaceProcDel(String where) {
        Statement stmt = null;
        int result = 0;
        
        try {
            stmt = conn.createStatement();
            String sql = "update t_place_info set pi_name = '없는 장소입니다.', " + 
                " pi_isview = 'n' " + where + " ";
            result = stmt.executeUpdate(sql);
            
        } catch(Exception e) {
            System.out.println("AdminPlaceProcDelDao 클래스의 adminPlaceProcDel() 메소드 오류");
            e.printStackTrace();
        } finally {
            close(stmt);
        }
        
        return result;
    }
}
