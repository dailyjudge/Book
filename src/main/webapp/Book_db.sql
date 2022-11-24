create table book(
	b_id varchar2(20 char) primary key,
	b_name varchar2(20 char) not null,
	b_email varchar2(30 char) not null,
	b_pw varchar2(20 char) not null,
	b_likes varchar2(100 char) not null,
	b_pic varchar2(500 char) not null
);

insert into book values('ye','ye','ye@gmail.com','1111','detective','master.jpg');
insert into book values('test','name','email','1111','detective','master.jpg');
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

drop table usedbooks_board

delete USEDBOOKS_BOARD;

-- 고유키(넘버), 작성자, 게시글 번호, 댓글 내용, 등록 시간
create table comment_table (
	c_no number(5) primary key,
	c_author varchar2(20 char) not null,
	c_boardNo number(5) not null,
	c_content varchar2(150 char) not null,
	c_date date not null
);

create sequence comment_table_seq;

insert into comment_table values(comment_table_seq.nextval, 'test', 102, '테스트 1번', sysdate);
insert into comment_table values(comment_table_seq.nextval, 'test', 102, '테스트 2번', sysdate);

select * from comment_table
select * from account

select c_no, c_author, c_boardNo, c_date, b_pic from account, usedbooks_board, comment_table
where b_id = u_author and u_no = c_boardNo and c_boardNo = 102
