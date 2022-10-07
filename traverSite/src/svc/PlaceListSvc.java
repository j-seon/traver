package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class PlaceListSvc {
	public ArrayList<PlaceInfo> getPlaceList(String where) {
		ArrayList<PlaceInfo>  placeList = new ArrayList<PlaceInfo>();
		Connection conn = getConnection();
		PlaceListDao placeListDao = PlaceListDao.getInstance();
		placeListDao.setConnection(conn);
		
		placeList = placeListDao.getPlaceList(where);
		close(conn);
		
		return placeList;
	}

}
