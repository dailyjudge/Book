package com.book.usedBooks;

import java.util.Date;

public class Review {
	private int rv_no;
	private String rv_author;
	private String rv_title;
	private String rv_content;
	private String rv_img;
	private String rv_date;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int rv_no, String rv_author, String rv_title, String rv_content, String rv_img, String rv_date) {
		super();
		this.rv_no = rv_no;
		this.rv_author = rv_author;
		this.rv_title = rv_title;
		this.rv_content = rv_content;
		this.rv_img = rv_img;
		this.rv_date = rv_date;
	}

	public int getRv_no() {
		return rv_no;
	}

	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}

	public String getRv_author() {
		return rv_author;
	}

	public void setRv_author(String rv_author) {
		this.rv_author = rv_author;
	}

	public String getRv_title() {
		return rv_title;
	}

	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public String getRv_img() {
		return rv_img;
	}

	public void setRv_img(String rv_img) {
		this.rv_img = rv_img;
	}

	public String getRv_date() {
		return rv_date;
	}

	public void setRv_date(String rv_date) {
		this.rv_date = rv_date;
	}

	
	
}
