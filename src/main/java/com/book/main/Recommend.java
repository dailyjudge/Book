package com.book.main;

public class Recommend {
	private String title;
	private String urlImg;
	private String author;
	private String link;
	
	
	public Recommend() {
		// TODO Auto-generated constructor stub
	}


	public Recommend(String title, String urlImg, String author, String link) {
		super();
		this.title = title;
		this.urlImg = urlImg;
		this.author = author;
		this.link = link;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getUrlImg() {
		return urlImg;
	}


	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}

	
	
}
