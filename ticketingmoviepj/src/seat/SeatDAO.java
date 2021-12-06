package seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SeatDAO {

	
	private Context init;
	private DataSource ds;
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	
	
	public SeatDAO() {
		try {
			init = (Context)new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		}
		catch(NamingException e) {
			System.out.println("네이미에러~~!!");
		}	
		
	}
	
	public ArrayList<SeatDTO> seatSelectAll(String id){
		ArrayList<SeatDTO> seatList = new ArrayList<SeatDTO>();
		String sql = "select * from seat where timeId = '" +id + "'";
		System.out.println("SQL구문  :" + sql);
		try {
			conn = ds.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				SeatDTO dto = new SeatDTO();
				System.out.println(rs.getInt("seatNum"));
				dto.setSeatNum(rs.getInt("seatNum"));
				dto.setSeatCheck(rs.getBoolean("seatCheck"));
				dto.setSeatLine(rs.getInt("seatLine"));
				dto.setTimeId(rs.getString("timeId"));
				seatList.add(dto);
			}
			return seatList;
		} catch (SQLException e) {
			System.out.println("SQL구문 에러~!!");
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) 		rs.close();
				if(psmt != null)	psmt.close();
				if(conn != null)	conn.close();
			}catch(Exception e) {
				System.out.println("종료에러" + e.getMessage());
			}
			
		}
		return null;	
	}
	
	
}
