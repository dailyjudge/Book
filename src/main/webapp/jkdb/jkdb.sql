------ 게시글 번호, 등록한 사람, 제목, 내용, 사진, 금액
-- u_no, nunber(3) primary key 

drop table usedbooks_board;
create table usedbooks_board(
	u_no number(5) not null primary key,
	u_user varchar2(20 char) not null,
	u_title varchar2(30 char) not null,
	u_content varchar2(100 char) not null,
	u_img varchar2(300 char) not null,
	u_price number(5) not null,
	u_date date not null
);

drop sequence usedbooks_board_seq;
create sequence usedbooks_board_seq;

delete usedbooks_board where u_no=1;
insert into usedbooks_board values (usedbooks_board_seq.nextval,'형규','세상 마지막 기차역','싸게 팔아요','사진',5000,sysdate );

select * from usedbooks_board;

