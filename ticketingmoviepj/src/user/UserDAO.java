package user;

import java.sql.*;


public class UserDAO {

	
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	
	private String driver ="org.mariadb.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/java_movie";
	
	
	private String user ="root";
	private String password = "1234";
	
	
	public UserDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("클래스를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("SQL 접속 예외");
			e.printStackTrace();
		}
	
		
	}
	
	public UserDTO userSelectOne(UserDTO login) {
		String sql = "select * from user where userid = '%s' and password ='%s'";
		
		sql = String.format(sql, login.getUserid(), login.getPassword());
		
		System.out.println("SQL 구분 :" + sql);
		
		
		
		
		try {
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
		if(register.getUserid() == null) return 0;
		
		String sql = "insert into user"
				+ "values('%s, %s, %s, %s, %s)";
		
		
		sql = String.format(sql, register.getUserid(),register.getPassword(), register.getUsername(),
				Integer.toString(register.getAge()),register.getPhoneNum());
		
		
		System.out.println("sql 구문" + sql);
		
		try {
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
	
	
	
}
