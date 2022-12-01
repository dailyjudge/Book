# Git - Semi_Project


### 소개
책을 좋아하는 사람들을 위해 만든 간이 서점 사이트이다. 그동안 배운 CRUD와 Open API 활용,  Oracle DB를 통해 제작하였다.

### 주요 기능
1. 인터파크의 API를 활용하여 베스트셀러를 보여주는 게시판
2. 카카오의 REST API를 활용하여 서적 검색을 할 수 있는 게시판
3. Oracle DB와 연결하여 게시글을 작성하고, 읽고, 수정하고 삭제 할 수 있는 CRUD기반 게시판
4. 카카오의 지도 API를 활용하여 현재 위치 주변의 서점을 보여주고 지도에 표시


### 개발환경
MVC 패턴 모델2로 개발하였고, WAS는 Apache Tomcat 9.0버전으로 개발하였다.
IDE는 Eclipse와 소스 코드 편집기 VScode를 사용했다.
DB 는 Oracle database 21c  Oracle_11 환경에서 개발하였다.
그동안 배운 JSP와 JSTL, JS를 활용하여 CRUD게시판을 만들고 Open API를 적극 활용하였다.

### 기술스택
<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"><img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
<svg role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Sourcetree</title><path d="M11.999 0C6.756 0 2.474 4.245 2.474 9.525c0 4.21 2.769 7.792 6.572 9.047v4.764c0 .37.295.664.664.664h4.506a.661.661 0 0 0 .664-.664v-4.764c.025-.008.049-.019.074-.027v.064c3.694-1.22 6.412-4.634 6.565-8.687.005-.124.007-.25.007-.375v-.022c0-.152-.006-.304-.013-.455C21.275 4.037 17.125 0 11.999 0Zm0 6.352a3.214 3.214 0 0 1 2.664 5.005v.002A3.218 3.218 0 0 1 12 12.775a3.212 3.212 0 0 1 0-6.424z"/></svg>
### ERD
<img src="https://user-images.githubusercontent.com/108406531/205044225-6990d46e-47ed-40d8-9b39-e9c03df3e87f.png" 
width="800px" height="600px">


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

