package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class AdminPlaceListSvc {

    public ArrayList<PlaceInfo> getAdminPlaceList(String where, int cpage, int psize) {
        ArrayList<PlaceInfo> placeInfo = new ArrayList<PlaceInfo>();
        Connection conn = getConnection();
        AdminPlaceListDao adminPlaceListDao = AdminPlaceListDao.getInstance();
        adminPlaceListDao.setConnection(conn);
        
        placeInfo = adminPlaceListDao.getAdminPlaceList(where, cpage, psize);
        close(conn);
        
        return placeInfo;
    }

    public int getPlaceListCount(String where) {
        int rcnt = 0;
        Connection conn = getConnection();
        AdminPlaceListDao adminPlaceListDao = AdminPlaceListDao.getInstance();
        adminPlaceListDao.setConnection(conn);

        rcnt = adminPlaceListDao.getPlaceListCount(where);
        close(conn);

        return rcnt;
    }
}
