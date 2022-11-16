package com.book.account;

public class Account {
private String b_id;
private String b_name;
private String b_email;
private String b_pw;
private String b_likes;
private String b_pic;

public Account() {
}

public Account(String b_id, String b_name, String b_email, String b_pw, String b_likes, String b_pic) {
	super();
	this.b_id = b_id;
	this.b_name = b_name;
	this.b_email = b_email;
	this.b_pw = b_pw;
	this.b_likes = b_likes;
	this.b_pic = b_pic;
}

public String getB_id() {
	return b_id;
}
public void setB_id(String b_id) {
	this.b_id = b_id;
}
public String getB_name() {
	return b_name;
}
public void setB_name(String b_name) {
	this.b_name = b_name;
}
public String getB_email() {
	return b_email;
}
public void setB_email(String b_email) {
	this.b_email = b_email;
}
public String getB_pw() {
	return b_pw;
}
public void setB_pw(String b_pw) {
	this.b_pw = b_pw;
}
public String getB_likes() {
	return b_likes;
}
public void setB_likes(String b_likes) {
	this.b_likes = b_likes;
}
public String getB_pic() {
	return b_pic;
}
public void setB_pic(String b_pic) {
	this.b_pic = b_pic;
}

}
