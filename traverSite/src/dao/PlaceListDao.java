package dao;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import vo.*;
	
public class PlaceListDao {
	private static PlaceListDao placeListDao;
	private Connection conn;
	private PlaceListDao() {}
	
	public static PlaceListDao getInstance() {
		if (placeListDao == null)	placeListDao = new PlaceListDao();
		return placeListDao;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	public ArrayList<PlaceInfo> getPlaceList(String where) {
		Statement stmt = null;
	    ResultSet rs = null;
	    ArrayList<PlaceInfo> placeList = new ArrayList<PlaceInfo>(); // 게시글들을 저장할 목록 객체
	    PlaceInfo pi = null;   // freeList에 저장할 하나의 게시글 정보를 담을 인스턴스
	    
	    try {
	         stmt = conn.createStatement();
	         String sql = "select * from t_place_info " + where;
	            // 목록 보여주는 쿼리
	         rs = stmt.executeQuery(sql);
	         while (rs.next()) {
	        	pi = new PlaceInfo();
	        	pi.setPi_id(rs.getString("pi_id"));
	        	pi.setPi_name(rs.getString("pi_name"));
	        	pi.setPi_phone(rs.getString("pi_phone"));
	        	pi.setPi_link(rs.getString("pi_link"));
	        	pi.setPi_coords(rs.getString("pi_coords"));
	        	pi.setPi_addr1(rs.getString("pi_addr1"));
	        	pi.setPi_addr2(rs.getString("pi_addr2"));
	        	pi.setPi_zip(rs.getString("pi_zip"));
	        	pi.setPi_img1(rs.getString("pi_img1"));
	        	pi.setPi_img2(rs.getString("pi_img2"));
	        	pi.setPi_img3(rs.getString("pi_img3"));
	        	pi.setPi_img4(rs.getString("pi_img4"));
	        	pi.setPi_img5(rs.getString("pi_img5"));
	        	pi.setPi_desc(rs.getString("pi_desc"));
	        	pi.setPi_review(rs.getInt("pi_review"));
	        	pi.setPi_ctgr(rs.getString("pi_ctgr"));
	        	pi.setPi_date(rs.getString("pi_date"));
	            placeList.add(pi);
	            // 루프를 돌면서 rs에 들어있는 게시글 정보들을 freeList에 저장
	         }
	    } catch (Exception e) {
	         System.out.println("PlaceListDao 클래스의 getPlaceList() 메소드 오류");
	         e.printStackTrace();
	      } finally {
	         close(rs);
	         close(stmt);
	      }
		
		return placeList;
	}
}
