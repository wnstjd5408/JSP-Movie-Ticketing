package comment;

import java.sql.Connection;
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

public class CommentDAO {

	
	
	private Context init;
	private DataSource ds;
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	private static CommentDAO instance = new CommentDAO();
	
	public static CommentDAO getInstance() {
		return instance;
	}
	
	public CommentDAO() {
		try {
			init = (Context)new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		}
		catch(NamingException e) {
			System.out.println("네이미에러~~!!");
		}	
		
	}
	
//	public CommentDTO commentSelectOne(String commentIDX) {
//		
//		String sql = "select * from comment where commentIDX = " + commentIDX;
//		System.err.println("SQL 구문 :" + sql);
//		
//		
//		
//		try {
//			conn = ds.getConnection();
//			state = conn.createStatement();
//			rs = state.executeQuery(sql);
//			
//			while(rs.next()) {
//				CommentDTO comment = new CommentDTO();
//				comment.setCommentIDX(rs.getInt("commentIDX"));
//				comment.setTitle(rs.getNString("title"));
//				comment.setWriter(rs.getString("writer"));
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
//				comment.setCreationDate(sdf.format(rs.getTimestamp("creationDate")));
//				System.out.println(sdf.format(rs.getTimestamp("creationDate")));
//				return comment;
//			}
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		finally {
//			try {
//				if(rs != null) 		rs.close();
//				if(state != null)	state.close();
//				if(conn != null)	conn.close();
//			}catch(Exception e) {
//				
//			}
//		}
//		return null;
//				
//	}
	
	
	public ArrayList<CommentDTO> commentSelectAll(String movieID){		
		String sql = "select commentIDX, score, writer, creationDate from comment where id =" + movieID;
	
		System.out.println("SQL구문 : " + sql);
		
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			ArrayList<CommentDTO> commentList = new ArrayList<CommentDTO>();
			
			while(rs.next()) {
				CommentDTO comment = new CommentDTO();
				comment.setCommentIDX(rs.getInt("commentIDX"));
				comment.setScore(rs.getFloat(2));
				comment.setWriter(rs.getString("writer"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
				comment.setCreationDate(sdf.format(rs.getTimestamp("creationDate")));
				System.out.println(sdf.format(rs.getTimestamp("creationDate")));
				commentList.add(comment);
			}
			return commentList;
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
