package room;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import theater.TheaterDTO;

public class RoomDAO {
	private Context init;
	private DataSource ds;
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	private static RoomDAO instance = new RoomDAO();
	
	
	public static RoomDAO getInstance() {
		return instance;
	}
	
	public RoomDAO() {
		try {
			init = (Context)new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		}
		catch(NamingException e) {
			System.out.println("네이미에러~~!!");
		}
	}
	
	
	public ArrayList<RoomDTO> roomselectall(String name){
		
		ArrayList<RoomDTO> roomlist = new ArrayList<RoomDTO>();
		
		String sql = "select * from room where tid IN(select tid from theater where tname='%s'";
		sql = String.format(sql, name);
		
		try {
			conn =ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
			while(rs.next()) {
				RoomDTO dto = new RoomDTO();
				dto.setRid(rs.getString("rid"));
				dto.setRname(rs.getString("rname"));
				dto.setTseats(rs.getInt("tseats"));
				dto.setTid(rs.getString("tid"));
				
				roomlist.add(dto);
				
				
			}
			return roomlist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) 		rs.close();
				if(state != null)	state.close();
				if(conn != null)	conn.close();
			}catch(Exception e) {
				
			}
		
		}
		return null;
	}
}
