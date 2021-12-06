package time;

import java.sql.Time;
import java.util.Date;

public class TimeDTO {
	private String timeId;
	private Date date;
	private Time time;
	private int id;
	private String rid;
	public String getTimeId() {
		return timeId;
	}
	
	
	public void setTimeId(String timeId) {
		this.timeId = timeId;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	
	
	
	
	
	
}
