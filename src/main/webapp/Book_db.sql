create table book(
b_id varchar2(20 char) primary key,
b_name varchar2(20 char) not null,
b_email varchar2(30 char) not null,
b_pw varchar2(20 char) not null,
b_likes varchar2(100 char) not null,
b_pic varchar2(500 char) not null
);

insert into book values('test','test','test@gmail.com','1111','detective','master.jpg');

drop table book cascade constraint purge;

select *from book;