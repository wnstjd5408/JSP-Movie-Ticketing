package user;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class UserDAO {

	
	private Context init;
	private DataSource ds;
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	
	public UserDAO() {
		try {
			init = (Context)new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		}
		catch(NamingException e) {
			System.out.println("네이미에러~~!!");
		}
		
	}
	public UserDTO userInfo(String id) {
		String sql = "select * from user where userid = '%s'";
		sql =String.format(sql, id);
		
		System.out.println("SQL 구분 : "  + sql);
		
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUserid(rs.getString("userid"));
				dto.setPassword(rs.getString("password"));
				dto.setUsername(rs.getString("username"));
				dto.setAge(rs.getInt("age"));
				dto.setPhoneNum(rs.getString("phoneNum"));
				
				return dto;
			}
			
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
	public UserDTO userSelectOne(UserDTO login) {
		String sql = "select * from user where userid = '%s' and password ='%s'";
		
		sql = String.format(sql, login.getUserid(), login.getPassword());
		
		System.out.println("SQL 구분 :" + sql);
		
		
		
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
			
			while(rs.next()){
				
				UserDTO dto = new UserDTO();
				dto.setUserid(rs.getString("userid"));
				dto.setPassword(rs.getString("password"));
				dto.setUsername(rs.getString("username"));
				dto.setAge(rs.getInt("age"));
				dto.setPhoneNum(rs.getString("phoneNum"));
				
				return dto;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("SQL 예외 발생");
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
	
	public int insertUser(UserDTO register) {
		if(register.getUserid() == null) { 
			System.out.println("아이디 값이 없습니다");
			return 0;
		}
		
		String sql = "insert into user "
				+ "values('%s', '%s', '%s', %d, '%s')";
		
		
		sql = String.format(sql, register.getUserid(),register.getPassword(), register.getUsername(),
				register.getAge(),register.getPhoneNum());
		
		
		System.out.println("sql 구문" + sql);
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			int row = state.executeUpdate(sql);
			
			
			return row;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("SQL문 에러~~!!!");
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)		rs.close();
				if(state != null)	state.close();
				if(conn != null)	conn.close();
				
			}catch(Exception e) {
				 
				
			}
		}
		return 0;
		
	}
	public int idCheck(UserDTO userid) {
		int rst = 0;
		String sql = "select * from user where userid = '%s'";
		sql = String.format(sql, userid.getUserid());
		
		
		System.out.println("아이디 확인" + sql);
		
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
			if(rs.next()) rst = 1;
			
			
		} catch (SQLException e) {
			System.out.println("아이디 찾기 SQL문 에러~~!!!");
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) 		rs.close();
				if(state != null)	state.close();
				if(conn != null)	conn.close();
			}catch(Exception e) {
				
			}
		}
		
		return rst;
	}
	
	
}
