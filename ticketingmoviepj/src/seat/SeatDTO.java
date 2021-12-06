package seat;

public class SeatDTO {
	private int seatNum;
	private boolean seatCheck;
	private int seatLine;
	private String timeId;
	
	
	public int getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}
	public boolean isSeatCheck() {
		return seatCheck;
	}
	public void setSeatCheck(boolean seatCheck) {
		this.seatCheck = seatCheck;
	}
	public int getSeatLine() {
		return seatLine;
	}
	public void setSeatLine(int seatLine) {
		this.seatLine = seatLine;
	}
	public String getTimeId() {
		return timeId;
	}
	public void setTimeId(String timeId) {
		this.timeId = timeId;
	}
	
	
	
}
