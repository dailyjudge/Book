create table book(
	b_id varchar2(20 char) primary key,
	b_name varchar2(20 char) not null,
	b_email varchar2(30 char) not null,
	b_pw varchar2(20 char) not null,
	b_likes varchar2(100 char) not null,
	b_pic varchar2(500 char) not null
);

insert into book values('ye','ye','ye@gmail.com','1111','detective','master.jpg');
drop table book cascade constraint purge;

select * from book;

create table usedbooks_board (
	u_no number(5) primary key,
	u_author varchar2(20 char) not null,
	u_title varchar2(30 char) not null,
	u_content varchar2(300 char) not null,
	u_img varchar2(300 char) not null,
	u_price number(5) not null,
	u_date date not null
);

create sequence usedbooks_board_seq;

insert into usedbooks_board values(usedbooks_board_seq.nextval, '민규', '제목', '내용', 'img', '20000', sysdate);
insert into usedbooks_board values(usedbooks_board_seq.nextval, '권', '제목2', '내용2', 'img2', '30000', sysdate);

select * from usedbooks_board order by u_date;

select * from usedbooks_board;


delete USEDBOOKS_BOARD;