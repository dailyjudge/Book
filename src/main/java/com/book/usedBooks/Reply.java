package com.book.usedBooks;

public class Reply {
	
	String id;
	int boardNo;
	int commentNo;
	int replyNo;
	String content;
	String date;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Reply(String id, int boardNo, int commentNo, int replyNo, String content, String date) {
		super();
		this.id = id;
		this.boardNo = boardNo;
		this.commentNo = commentNo;
		this.replyNo = replyNo;
		this.content = content;
		this.date = date;
	}
	
	
}
