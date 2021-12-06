package time;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import theater.TheaterDAO;

public class TimeDAO {
	private Context init;
	private DataSource ds;
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	

	public TimeDAO() {
		// TODO Auto-generated constructor stub
		try {
			init = (Context)new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
			System.out.println("연결");
		}
		catch(NamingException e) {
			System.out.println("네이미에러~~!!");
		}
	}
	public ArrayList<TimeDTO> calendarSelectAll(String movieid, String roomId, String date){
		ArrayList<TimeDTO> timeList = new ArrayList<TimeDTO>();
		String selectday = "2021-12-" + date;
		String sql = "select * from time where id =" + movieid +  " and rid ='" + roomId+"' and date= '" +selectday + "'";
		System.out.println("SQL 구문 : " + sql);
		
		try {
			conn = ds.getConnection();
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				TimeDTO dto = new TimeDTO();
				dto.setTimeId(rs.getString("timeId"));
				dto.setDate(rs.getDate("date"));
				System.out.println(rs.getDate("date"));
				dto.setTime(rs.getTime("time"));
				dto.setId(rs.getInt(4));
				dto.setRid(rs.getNString(5));
				
				timeList.add(dto);
			}
			return timeList;
		}catch(SQLException e) {
			System.out.println("SQL구문 에러 ~~!!");
		}
		finally {
			try {
				if(rs != null) 		rs.close();
				if(psmt != null)	psmt.close();
				if(conn != null)	conn.close();
			}catch(Exception e) {
				
			}
		
		}
		
		return null;
	}
	
	
	public ArrayList<TimeDTO> roomSelectAll(String id, String rid){
		Date today = new Date();
	    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		
		ArrayList<TimeDTO> timeList = new ArrayList<TimeDTO>();
		String sql = "select * from time where id =" + id +  " and rid ='" + rid+"' and date= '" + date.format(today) + "'";
		System.out.println(sql);

		try{
			conn = ds.getConnection();
			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, Integer.parseInt(id));
//			psmt.setString(2, rid);
//			
			rs = psmt.executeQuery();
			while(rs.next()) {
				TimeDTO dto = new TimeDTO();
				dto.setTimeId(rs.getString("timeId"));
				dto.setDate(rs.getDate("date"));
				System.out.println(rs.getDate("date"));
				dto.setTime(rs.getTime("time"));
				dto.setId(rs.getInt(4));
				dto.setRid(rs.getNString(5));
				
				timeList.add(dto);
			}
			return timeList;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) 		rs.close();
				if(psmt != null)	psmt.close();
				if(conn != null)	conn.close();
			}catch(Exception e) {
				
			}
		
		}
		
		return null;
	}
	
	
	
}
