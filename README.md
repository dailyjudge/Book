#  📗 BooKs

### 소개
책을 좋아하는 사람들을 위해 만든 간이 서점 사이트이다. 서적에 관련된 정보를 제공하고, 신간 도서 / 베스트 셀러 등의 정보를 사용자의 선호도에 맞춰 보여준다.그동안 배운 CRUD와 Open API 활용,  Oracle DB를 통해 제작하였다.

### 주요 기능
1. 인터파크 베스트셀러 API를 이용하여 국내/외 베스트셀러와 개인 맞춤 서적 추천 베스트 셀러 정보 및 구매 링크 제공 
2. slick.js 슬라이더와 인터파크 신간도서 API를 이용한 신간 도서 정보 제공
3. 카카오 검색 REST API를 활용하여 서적 검색 기능 제공
4. 중고 서적 게시판, 리뷰 게시판과 댓글, 대댓글 기능 제공
5. 카카오 지도 API와 HTML Geolocation API를 이용하여 현재 위치에서의 지도 정보를 제공하고, 서울 열린데이터 광장에서 제공하는 서울 서점 데이터셋을 이용하여, 현재 위치 기준으로 가장 가까운 서점을 리스트 형태로 출력 및 마커 표시 기능 제공


### 기술스택
<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"><img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">

<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"><img src="https://img.shields.io/badge/sourcetree-blue?style=for-the-badge&logo=sourcetree&logoColor=white">
<img src="https://img.shields.io/badge/discord-purple?style=for-the-badge&logo=discord&logoColor=white">
<img src="https://img.shields.io/badge/eclipse-brown?style=for-the-badge&logo=eclipse&logoColor=white">
<img src="https://img.shields.io/badge/vscode-skyblue?style=for-the-badge&logo=vscode&logoColor=white">
<img src="https://img.shields.io/badge/discord-purple?style=for-the-badge&logo=discord&logoColor=white">
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

