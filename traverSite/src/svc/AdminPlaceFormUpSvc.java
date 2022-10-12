package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class AdminPlaceFormUpSvc {
    public PlaceInfo getAdminPlaceInfo(String where) {
        PlaceInfo placeInfo = null;
        Connection conn = getConnection();
        AdminPlaceProcUpDao adminPlaceProcUpDao = AdminPlaceProcUpDao.getInstance();
        adminPlaceProcUpDao.setConnection(conn);

        placeInfo = adminPlaceProcUpDao.getAdminPlaceInfo(where);
        close(conn);
        
        return placeInfo;
    }
}
