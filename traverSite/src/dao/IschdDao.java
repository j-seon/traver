package dao;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import vo.*;

public class IschdDao {
    private static IschdDao ischdDao; 
    private Connection conn;
    private IschdDao() {}
    
    public static IschdDao getInstance() {
        if (ischdDao == null)    ischdDao = new IschdDao();
        return ischdDao;
    }
    
    public void setConnection(Connection conn) {
        this.conn = conn;
    }
    
    public ArrayList<GoodInfo> getIschdList(String where, String orderBy) {
    // ���������� ����� ���Ͽ� ArrayList<GoodInfo>�� �����ϴ� �޼ҵ�
        Statement stmt = null;
        ResultSet rs = null;    
        ArrayList<GoodInfo> goodList = new ArrayList<GoodInfo>();
        // ������������ ������ ��� ��ü
        GoodInfo gi = null;
        // goodList�� ������ �ϳ���  �������� ������ ���� �ν��Ͻ�
        
        try {   
            stmt = conn.createStatement();
            String sql = "select * from t_schedule_zzim a, t_good_info b "
            + where + orderBy;
            //System.out.println(sql);
            rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                gi = new GoodInfo();    // �ϳ��� ���������� ������ �ν��Ͻ� ����
                gi.setGi_id(rs.getString("gi_id"));
                gi.setGi_dnum(rs.getInt("gi_dnum"));
                gi.setGi_date(rs.getString("gi_date"));
                gi.setGi_name(rs.getString("gi_name"));
                gi.setGi_img(rs.getString("gi_img"));
                goodList.add(gi);
                // ������ ���鼭 rs�� ����ִ� �������� �������� goodList�� ���� 
            }
            
        } catch(Exception e) {
            System.out.println("IschdDao Ŭ������ getIschdList() �޼ҵ� ����");
            e.printStackTrace();
        } finally {
            close(rs); close(stmt);
        }
        
        return goodList;
    }

    public GoodInfo getIschdDetail(String miid, String giid) {
    // �޾ƿ�(������) �������̵� �ش��ϴ� �������� ������ �������� GoodInfo�� �ν��Ͻ��� �����Ͽ� �����ϴ� �޼ҵ�
        Statement stmt = null;
        ResultSet rs = null;
        GoodInfo gi = null;
        
        try {
            String sql = "select * from t_good_info a, t_schedule_zzim b where b.mi_id = '" + miid + "' "
            + " and a.gi_id = b.gi_id and a.gi_id = '" + giid + "' ";
            
            stmt = conn.createStatement();
            //System.out.println(sql);
            rs = stmt.executeQuery(sql);
            if (rs.next()) { 
                gi = new GoodInfo();
                gi.setMi_id(miid);
                gi.setGi_id(giid);
                gi.setGi_nickname(rs.getString("gi_nickname"));
                gi.setGi_name(rs.getString("gi_name"));
                gi.setGi_dnum(rs.getInt("gi_dnum"));
                gi.setGoodDayList(getGoodDayList(giid)); // �� ���������� ���� ���� ����� ArrayList�� �޾ƿ� gi�� ����
            }
            
        } catch(Exception e) {
            System.out.println("IschdDao Ŭ������ getIschdDetail() �޼ҵ� ����");
            e.printStackTrace();
        } finally {
            close(rs); close(stmt);
        }
    
        return gi;
    }

    public ArrayList<GoodDay> getGoodDayList(String giid) {
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<GoodDay> goodDayList = new ArrayList<GoodDay>();
        GoodDay gd = null;
        
        try {
            String sql = "select * from t_good_day a, t_schedule_zzim b where a.gi_id = b.gi_id and a.gi_id = '" + giid + "' ";
            
            stmt = conn.createStatement();
           // System.out.println(sql);
            
            rs = stmt.executeQuery(sql);
            while (rs.next()) {   // �ϳ��� ���������� �ش��ϴ� ���������� ����ִ� rs
                gd = new GoodDay();
                gd.setGi_id(giid);
                gd.setGd_name(rs.getString("gd_name"));
                gd.setPi_id(rs.getInt("pi_id"));
                gd.setGd_dnum(rs.getInt("gd_dnum"));
                goodDayList.add(gd);
            }
            
        } catch(Exception e) {
            System.out.println("IschdDao Ŭ������ getGoodDayList() �޼ҵ� ����");
            e.printStackTrace();
        } finally {
            close(rs); close(stmt);
        }
    
        return goodDayList;
    }

}