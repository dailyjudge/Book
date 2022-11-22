package com.book.usedBooks;


public class Comment {
	// 댓글 고유 number, 작성자, 게시글 번호, 댓글 내용, 작성일, 이미지
	int comment_number;
	String author_id;
	int board_number;
	String comment_content;
	String date;
	String image;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	
	public Comment(int comment_number, String author_id, int board_number, String comment_content, String date,
			String image) {
		super();
		this.comment_number = comment_number;
		this.author_id = author_id;
		this.board_number = board_number;
		this.comment_content = comment_content;
		this.date = date;
		this.image = image;
	}
	public int getComment_number() {
		return comment_number;
	}
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}
	public String getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
