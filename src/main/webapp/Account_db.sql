create table Account(
b_id varchar2(20 char) primary key,
b_name varchar2(20 char) not null,
b_email varchar2(30 char) not null,
b_pw varchar2(20 char) not null,
b_likes varchar2(100 char) not null,
b_pic varchar2(500 char) not null
);

insert into Account values('test','test','test@gmail.com','1111','detective','master.jpg');
insert into Account values('mkmkmk','민규','mkmkmk@gmail.com','Dlagudrb1!','detective','master.jpg');
drop table Account cascade constraint purge;

select *from Account;