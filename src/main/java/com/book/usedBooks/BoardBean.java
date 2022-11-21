package com.book.usedBooks;

import java.util.Date;

public class BoardBean {
	private int no;
	private String author;
	private String title;
	private String content;
	private String img;
	private int price;
	Date date;
	
	public BoardBean() {
		// TODO Auto-generated constructor stub
	}

	public BoardBean(int no, String author, String title, String content, String img, int price, Date date) {
		super();
		this.no = no;
		this.author = author;
		this.title = title;
		this.content = content;
		this.img = img;
		this.price = price;
		this.date = date;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
