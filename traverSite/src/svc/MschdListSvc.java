package svc;

import static db.JdbcUtil.*;
import java.util.*; 
import java.sql.*;
import dao.*;
import vo.*;

public class MschdListSvc {
    public ArrayList<ScheduleInfo> getMschdList(String where) {
        ArrayList<ScheduleInfo> scheduleList = new ArrayList<ScheduleInfo>();
        Connection conn = getConnection();
        MschdListDao mschdListDao = MschdListDao.getInstance();
        mschdListDao.setConnection(conn);
        
        scheduleList = mschdListDao.getMschdList(where);
        close(conn);
        
        return scheduleList;
        
    }
}
