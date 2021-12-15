package ticketing;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import movie.MovieDTO;

public class TicketingDAO {


	private Context init;
	private DataSource ds;
	private Connection conn;
	private Statement state;
	private ResultSet rs;
	
	public TicketingDAO() {
		try {
			init = (Context)new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		}
		catch(NamingException e) {
			System.out.println("네이미에러~~!!");
		}
		
	}
	public ArrayList<TicketingDTO> selectTicketOne(String id) {
		ArrayList<TicketingDTO> ticketList = new ArrayList<TicketingDTO>();
		String sql = "select ticketingId,room.rname , seat.seatLine, date, time, title, age "
				+ "from ticketing, seat, time, movie, room where room.rid = time.rid and "
				+ "ticketing.seatNum=seat.seatNum and seat.timeId=time.timeId and time.id=movie.id "
				+ "and  userId = '" + id +"'"; 
				
		
		System.out.println(sql);
		System.out.println("sql문 :" + sql);
		try {
			conn = ds.getConnection();
			state = conn.createStatement();
			rs = state.executeQuery(sql);
			
		
			while(rs.next()){
				TicketingDTO ticket = new TicketingDTO();
				ticket.setTicketingId(rs.getInt("ticketingId"));
				ticket.setRname(rs.getNString("rname"));
				ticket.setSeatLine(rs.getInt("seatLine"));
				ticket.setDate(rs.getDate("date"));
				ticket.setTime(rs.getTime("time"));
				ticket.setTitle(rs.getNString("title"));
				ticket.setAge(rs.getNString("age"));
				
				ticketList.add(ticket);
				
			}
			return ticketList;
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
	
	
	public int insertTicket(TicketingDTO ticket) {
		String sql = "insert into ticketing(ticketingDate, seatNum, userId) values(DEFAULT, %s, '%s')";
		System.out.println(ticket.getSeatNum());
		System.out.println(ticket.getUserId());
		sql = String.format(sql, ticket.getSeatNum(), ticket.getUserId());
		
		System.out.println("SQL 구분 : "  + sql);
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
	
}
