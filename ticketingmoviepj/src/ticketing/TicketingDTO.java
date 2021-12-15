package ticketing;

import java.sql.Time;
import java.util.Date;

public class TicketingDTO {


	
	private int ticketingId;
	private int seatNum;
	private int seatLine;
	private String rname;
	private Date date;
	private Time time;
	private String title;
	private String age;
	private String userId;
	
	
	
	public int getTicketingId() {
		return ticketingId;
	}
	public void setTicketingId(int ticketingId) {
		this.ticketingId = ticketingId;
	}
	public int getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}
	public int getSeatLine() {
		return seatLine;
	}
	public void setSeatLine(int seatLine) {
		this.seatLine = seatLine;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	



	
	
	
	
	
	
}
