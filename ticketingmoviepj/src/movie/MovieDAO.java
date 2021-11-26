package movie;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;




public class MovieDAO {

	private Context init;
	private DataSource ds;
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	
	private static MovieDAO instance = new MovieDAO();

	public static MovieDAO getInstance() {
		return instance;
	}

	public MovieDAO() {
			try {
				init = (Context)new InitialContext();
				ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
			}
			catch(NamingException e) {
				System.out.println("네이밍에러~~!!" + e.getMessage());
			}
	
	}
	public MovieDTO movieSelectOne(String id) {
		String sql = "select * from movie where id =" + id;
		
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
			System.out.println("sql문 :" + sql);
			while(rs.next()){
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getInt("id"));
				dto.setTitle(rs.getString("title"));
				dto.setOpenMovie(rs.getDate("openMovie"));
				dto.setDirector(rs.getString("director"));
				dto.setActor(rs.getString("actor"));
				dto.setGenre(rs.getString("genre"));
				dto.setAge(rs.getString("title"));
				dto.setCountry(rs.getString("country"));
				dto.setRunningtime(rs.getString("runningtime"));
				dto.setContent(rs.getString("content"));
				dto.setImg(rs.getString("img"));
				
				return dto;
				
			}
		} catch (SQLException e) {
			System.out.println("SQL 예외" + e.getMessage());
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
	
	public ArrayList<MovieDTO> movieselectall(){
		ArrayList<MovieDTO> movielist = new ArrayList<MovieDTO>();
		
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery("select * from movie");
			
			
			
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getInt("id"));
				dto.setTitle(rs.getString("title"));
				dto.setOpenMovie(rs.getDate("openMovie"));
				dto.setDirector(rs.getString("director"));
				dto.setActor(rs.getString("actor"));
				dto.setGenre(rs.getString("genre"));
				dto.setAge(rs.getString("title"));
				dto.setCountry(rs.getString("country"));
				dto.setRunningtime(rs.getString("runningtime"));
				dto.setContent(rs.getString("content"));
				dto.setImg(rs.getString("img"));
				
				movielist.add(dto);
			}
		
			return movielist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("SQL 예외 :" + e.getMessage());
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
	
