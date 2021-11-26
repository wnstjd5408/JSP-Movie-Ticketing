package theater;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import movie.MovieDAO;
import room.RoomDTO;

public class TheaterDAO {

	
	private Context init;
	private DataSource ds;
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	
	private static TheaterDAO instance = new TheaterDAO();

	public static TheaterDAO getInstance() {
		return instance;
	}
	
	
	
	public TheaterDAO() {
		try {
			init = (Context)new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		}
		catch(NamingException e) {
			System.out.println("네이미에러~~!!");
		}
	}
	

	public ArrayList<TheaterDTO> theaterselectall(){
		ArrayList<TheaterDTO> theaterlist = new ArrayList<TheaterDTO>();
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery("select * from theater");
			
			
			while(rs.next()) {
				TheaterDTO dto = new TheaterDTO();
				dto.setTid(rs.getString("tid"));
				dto.setTlocation(rs.getString("tlocation"));
				dto.setTname(rs.getString("tname"));
				
				theaterlist.add(dto);
			}
			return theaterlist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
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
