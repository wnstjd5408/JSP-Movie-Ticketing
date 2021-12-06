package comment;

public class CommentDTO {

	private int commentIDX;
	private Float score;
	private String writer;
	private String comment;
	private String creationDate;
	private String id;
	

	public Float getScore() {
		return score;
	}
	public void setScore(Float score) {
		this.score = score;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCommentIDX() {
		return commentIDX;
	}
	
	
	public void setCommentIDX(int commentIDX) {
		this.commentIDX = commentIDX;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	
	
	
	
}
