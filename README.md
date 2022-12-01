# Git - Semi_Project
### 소개
책을 좋아하는 사람들을 위해 만든 간이 서점 사이트이다. 그동안 배운 CRUD와 Open API 활용,  Oracle DB를 통해 제작하였다.

### 주요 기능
1. 인터파크의 API를 활용하여 베스트셀러를 보여주는 게시판
2. 카카오의 REST API를 활용하여 서적 검색을 할 수 있는 게시판
3. Oracle DB와 연결하여 게시글을 작성하고, 읽고, 수정하고 삭제 할 수 있는 CRUD기반 게시판
4. 카카오의 지도 API를 활용하여 현재 위치 주변의 서점을 보여주고 지도에 표시

### DB Table
#### 회원 관련 Table
##### 1. Account(예시)
회원의 정보를 담는 DB

b_id(아이디)|b_name(이름)|b_email(이메일)|b_pw(패스워드)|b_likes(관심 장르)|b_pic
---|---|---|---|---|---|
example1|김씨|aasds@naver.com|Test1234|104 105|aa.jpg|
example2|정씨|qoqosds@naver.com|Test1234|104 118|bb.jpg|

#### 중고서적 게시판 관련 Table
##### 1. usedbooks_board(예시)
중고서적을 판매하기 위한 CRUD게시판 DB

u_no(pk)|u_author(작성자)|u_title(제목)|u_content(내용)|u_img(이미지파일 이름)|u_price(가격)|u_date(작성 날짜)|
---|---|---|---|---|---|---|
1|김씨|제목1|내용1|aa.jpg|1200|2022-11-24 16:46:40.0|
2|정씨|제목2|내용2|bb.jpg|11000|2022-11-25 11:42:24.0|

##### 2. comment_table(예시)
중고서적 게시판의 댓글 DB

c_no(pk)|c_author(작성자)|c_boardNo(fk)|c_content(내용)|c_date(작성 날짜)|
---|---|---|---|---|
1|example2|1|안사요|2022-11-25 11:42:24.0|
2|example1|1|맘에드네요|2022-11-26 16:46:40.0|

##### 3. replyofComment(예시)
댓글의 답장(대댓글) db
r_no(pk)|r_author(작성자)|r_boardNo(fk)|r_content(내용)|r_date(작성 날짜)|
---|---|---|---|---|
1|test|22|테스트3|2022-11-25 11:42:24.0|

#### 후기 게시판 관련 Table
##### 1. review_board(예시)
rv_no(pk)|rv_author(작성자)|rv_title(제목)|rv_content(내용)|rv_img(이미지파일 이름)|u_date(작성 날짜)|
---|---|---|---|---|---|
1|김씨|제목1|내용이흥미로움|aa.jpg|2022-11-24 16:46:40.0|
2|정씨|제목2|내용이별로임|bb.jpg|2022-11-25 11:42:24.0|

### ERD
<img src="https://user-images.githubusercontent.com/108406531/205044225-6990d46e-47ed-40d8-9b39-e9c03df3e87f.png" 
width="800px" height="600px">


