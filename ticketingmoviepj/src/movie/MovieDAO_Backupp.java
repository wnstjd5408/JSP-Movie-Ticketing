package movie;

import java.sql.*;
import java.util.ArrayList;




public class MovieDAO_Backupp {

	
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	
	String driver ="org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/java_movie";
	
	
	String user ="root";
	String password = "1234";
	
	private static MovieDAO instance = new MovieDAO();

	public static MovieDAO getInstance() {
		return instance;
	}

	public MovieDAO_Backupp() {
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url,user,password);
			} catch (ClassNotFoundException e) {
				System.out.println("클래스를 찾을 수 없습니다.");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("SQL 접속 예외");
				e.printStackTrace();
			}
	
	}
	public MovieDTO movieSelectOne(String id) {
		String sql = "select * from movie where id =" + id;
		
		
		try {
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
			System.out.println("sql문" + sql);
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
	
