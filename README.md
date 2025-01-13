# 🐘ZooMainPage

## 📋  소개
>- 동물원 소개 및 동물원 티켓 예매 프로그램

## ⏲️ 소요시간
>- 40시간

### 🛠 개발 환경
>- __개발언어__
>     - __Java__ 21
>         + __JDK__ 21
>         + __Eclipse IDE__
>- __데이터베이스__
>     - __Oracle__ 21c Express Edition
>         + __SQL Developer__ 24.3.0

### 🧰핵심 기능
>- 홈페이지 소개 및 __로그인__, __회원가입__ 기능, __로그인 세션__ 에 따른 별도의 __기능 제공__
>   - __로그인__ 및 __회원가입__
>       - __아이디 중복체크__ 및 __패턴__ 적용
>       - __우편찾기__ 기능 추가 및 선택 시 __해당 목록 추가__
>  
>   - __게시판__
>       - __게시판 목록__, __수정__, __삭제__, __답글__ 및 __세션미 적용__ 시 __사용 불가__ 기능
>       - __수정__ ,__삭제__ 기능을 위한 별도의 게시물 __비밀번호 세션__ 적용 및 __확인 기능__
>         
>   - __티켓 예매__
>       - __티켓예매__ 시 티켓 __자세히 보기__ 및 선택, __장바구니__ 추가 기능 
>       - __로그인 세션__ 미 적용 시 접근 __불가능__
>
><br>
>
>- __MVC__ 아키텍처를 통한 코드 __구조화__

## 💠 ERD
>![](https://github.com/munjungbae/ZooMainPage/blob/main/webuser_zoo.png)

## 🎥 소개 동영상
>https://www.youtube.com/watch?v=odbPmIotR98


### 📝 주요 기능
- 테이블 생성
```
--학생테이블
CREATE table STUDENT(
 ID VARCHAR2(12) NOT NULL,
 PASS VARCHAR2(12) NOT NULL,
 NAME VARCHAR2(10) NOT NULL,
 PHONE1 VARCHAR2(3) NOT NULL,
 PHONE2 VARCHAR2(4) NOT NULL,
 PHONE3 VARCHAR2(4) NOT NULL,
 EMAIL VARCHAR2(30) NOT NULL,
 ZIPCODE VARCHAR2(7) NOT NULL,
 ADDRESS1 VARCHAR2(120) NOT NULL,
 ADDRESS2 VARCHAR2(50) NOT NULL
);
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_PK PRIMARY KEY(ID);

--집코드 테이블
create table zipcode (
 seq NUMBER(10) not null,
 zipcode VARCHAR2(50),
 sido VARCHAR2(50),
 gugun VARCHAR2(50),
 dong VARCHAR2(50),
 bunji VARCHAR2(50)
);
ALTER TABLE zipcode ADD CONSTRAINT PK_ZIPCODE PRIMARY KEY(seq);

--게시판 테이블
CREATE TABLE BOARD (
"NUM" NUMBER(7,0),
WRITER VARCHAR2(12) NOT NULL ENABLE,
EMAIL VARCHAR2(30) NOT NULL ENABLE,
SUBJECT VARCHAR2(50) NOT NULL ENABLE,
PASS VARCHAR2(10) NOT NULL ENABLE,
READCOUNT NUMBER(5,0) DEFAULT 0,
"REF" NUMBER(5,0) DEFAULT 0,
STEP NUMBER(3,0) DEFAULT 0,
"DEPTH" NUMBER(3,0) DEFAULT 0,
REGDATE TIMESTAMP (6) DEFAULT SYSDATE,
"CONTENT" VARCHAR2(4000) NOT NULL ENABLE,
IP VARCHAR2(20) NOT NULL ENABLE
 );
ALTER TABLE BOARD ADD CONSTRAINT BOARD_PK PRIMARY KEY (NUM) ENABLE;

--장바구니 테이블
CREATE TABLE basket (
"ID" VARCHAR2(12) NOT NULL,
"NAME" VARCHAR2(10) NOT NULL,
EMAIL VARCHAR2(30) NOT NULL,
"DATE" TIMESTAMP(6) DEFAULT SYSDATE,
TITLE VARCHAR2(50) NOT NULL,
PRICE NUMBER(10) NOT NULL,
"COUNT" NUMBER (10) NOT NULL
);
alter table basket add constraint basket_id_fk  foreign key(id) references student (id);
```
- 로그인 및 회원가입 체크 및 세션 적용
```
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
StudentDAO sdao = new StudentDAO();
StudentVO svo = new StudentVO();
svo.setId(id);
svo.setPass(pass);
int check = sdao.selectLoginCheck(svo);
%>
<%
if (id == null) {
%>
<script>
	alert("아이디를 입력 해 주세요");
	history.go(-1);
</script>
<%
} else {
if (check == 1) {//로그인 성공
	StudentVO vo = sdao.selectOneDB(svo);
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	session.setAttribute("name", vo.getName());
	session.setAttribute("email", vo.getEmail());
%>
<script>
	sendID()
</script>
<%
} else if (check == 0) {//아이디는 있는데 비밀번호 오류
%>
<script>
	alert("비밀번호가 일치하지 않습니다.");
	history.go(-1);
</script>
<%
} else {//아이디 자체가 존재하지 않는 경우
%>
<script>
	alert("아이디가 존재하지 않습니다");
	history.go(-1);
</script>
<%
}
}
%>
```
- 게시판 작성
```
	<form method="post" name="writeForm" action="writeCheck.jsp">
					<input type="hidden" name="num" value="<%=num%>"> <input
						type="hidden" name="ref" value="<%=ref%>"> <input
						type="hidden" name="step" value="<%=step%>"> <input
						type="hidden" name="depth" value="<%=depth%>">
					<div class="name_mail">
						<table>
							<tr>
								<!-- 작성자 -->
								<td><input type="text" name="writer" class="writer"
									value="<%=name%>" readonly="readonly" /></td>
							</tr>
						</table>
						<table>
							<tr>
								<!-- 비밀번호 -->
								<td><input type="password" name="pass" class="pass"
									placeholder="비밀번호" /></td>
							</tr>
							<tr>
						</table>
					</div>
					<table>
						<tr>
							<td>
								<%
								if (request.getParameter("num") == null) {
								%> <!-- 제목 --> <input type="text" name="subject" class="subject"
								placeholder="제목을 입력 해 주세요" /> <%
 } else {
 %> <input type="text" name="subject" value="[답변]" /> <%
 }
 %>
							</td>
						</tr>
					</table>
					<table>
						<!-- 내용 -->
						<tr>
							<td><textarea name="content" class="text_area" rows="20"
									cols="105" placeholder="내용을 입력 해 주세요"></textarea></td>
						</tr>
					</table>
					<div class="table5">
						<table>
							<tr>
								<td><input type="submit" class="submit" value="작성하기" /> <input
									type="reset" class="reset" value="다시작성" /> <input
									type="button" value="목록" class="list"
									onClick="window.location='list.jsp'"></td>
							</tr>
						</table>
					</div>
				</form>
```
- 페이징 기법
```
int banner_num = (int) Math.floor(Math.random() * (4 - 1 + 1) + 1);
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
String name = (String) session.getAttribute("name");
%>
<%
request.setCharacterEncoding("UTF-8");
int pageSize = 10;
String pageNum = request.getParameter("pageNum");
if (pageNum == null) {
	pageNum = "1";
}

int currentPage = Integer.parseInt(pageNum);
int start = (currentPage - 1) * pageSize + 1;
int end = (currentPage) * pageSize;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

int number = 0;
ArrayList<BoardVO> boardList = null;
BoardDAO bdao = BoardDAO.getInstance();
int count = bdao.selectCounteDB();
if (count > 0) {
	boardList = bdao.selectStartEndDB(start, end);
}
number = count - (currentPage - 1) * pageSize;
```
- 우편 찾기 및 적용
```
function zipCheck() {
	var left = Math.ceil((window.screen.width - 750) / 2);
	var top = Math.ceil((window.screen.height - 650) / 2);
	url = "zipCheck.jsp?check=y";
	window.open(url, "post", 'width=' + 450 + ',height=' + 350 + ',left=' + left + ',top=' + top + 'directories=no,status=yes,scrollbars=yes,menubar=no');
}

function dongCheck() {
	let value = document.zipForm.dong.value;
	if (value === "") {
		alert("동 이름을 입력해 주세요.");
		document.zipForm.dong.focus();
		return;
	}
	document.zipForm.submit();
}

function sendAddress(zipcode, sido, gugun, dong, bunji) {
	var address = sido + " " + gugun + " " + dong + " " + bunji;
	opener.document.register.zipcode.value = zipcode;
	opener.document.register.address1.value = address;
	self.close();
}

```
- 장바구니 확인
```
<div class=write_content>
			<h4 class="title">예매정보 확인</h4>
			<div class="registerBody">
				<form method="post" action="./login/modifyCheck.jsp" name="register">
					<div class="register">
						<table>
							<thead class="table_head">
								<th width='150px'>예약자</th>
								<th width=150px'>아이디</th>
								<th width='300px'>제목</th>
								<th width='200px'>예약날짜</th>
								<th width='150px'>가격</th>
								<th width='100px'>수량</th>
								<th width='200px'>이메일</th>
							</thead>
							<%
							for (BasketVO data : bList) {
							%>
							<tbody>
								<tr>
									<td><%=data.getName()%></td>
									<td><%=data.getId()%></td>
									<td><%=data.getTitle()%></td>
									<td><%=data.getDate()%></td>
									<td><%=data.getPrice()%></td>
									<td><%=data.getCount()%>명</td>
									<td><%=data.getEmail()%></td>
								</tr>
							</tbody>
							<%
							}
							%>
						</table>
					</div>
				</form>
			</div>
		</div>
```
- 회전목마
```
function onload() {
    const img = document.querySelector(".banner_change");
    const left = document.querySelector(".fa-caret-left");
    const right = document.querySelector('.fa-caret-right');
    const menu = document.querySelector('.dropdown');

    let intervalID = null;

    function change() {
    	let banner_num = Math.floor(Math.random() * (4 - 1 + 1) + 1);
            let srcData = 'http://localhost:8080/ZooMainPage/Zoo/img/Zoo'+banner_num+'.png';
            img.src = srcData;
    }
    intervalID = setInterval(change, 2000);

    img.addEventListener("mouseenter", (event) => {
        clearInterval(intervalID);
    })
    img.addEventListener("mouseleave", (event) => {
        intervalID = setInterval(change, 2000);
    })
    left.addEventListener("click", change);

    left.addEventListener("mouseenter", (event) => {
        clearInterval(intervalID);
    })
    left.addEventListener("mouseleave", (event) => {
        intervalID = setInterval(change, 2000);
    })

    right.addEventListener("click", change);

    right.addEventListener("mouseenter", (event) => {
        clearInterval(intervalID);
    })
    right.addEventListener("mouseleave", (event) => {
        intervalID = setInterval(change, 2000);
    })
}
```

### 📝실행화면

- __메인화면__, __로그인__ 및 __회원가입__ 

![main, login, register](https://github.com/munjungbae/ZooMainPage/blob/main/zoo/login.png)
![](https://github.com/munjungbae/ZooMainPage/blob/main/zoo/register.png)

- __게시판__ 및 __게시판 내용__

![board](https://github.com/munjungbae/ZooMainPage/blob/main/zoo/board.png)
![](https://github.com/munjungbae/ZooMainPage/blob/main/zoo/content.png)

- __티켓 예매__ 화면 및 __비 로그인__ 시 __알림__  

![ticket](https://github.com/munjungbae/ZooMainPage/blob/main/zoo/ticket.png)
![](https://github.com/munjungbae/ZooMainPage/blob/main/zoo/addticket.png)
![](https://github.com/munjungbae/ZooMainPage/blob/main/zoo/session.png)

- __본인 인증__ 을 위한 __개인정보__ 확인 및 __개인정보__ 수정, __장바구니__

![checkpass, basket](https://github.com/munjungbae/ZooMainPage/blob/main/zoo/checkPass.png)
![](https://github.com/munjungbae/ZooMainPage/blob/main/zoo/updateId.png)
![](https://github.com/munjungbae/ZooMainPage/blob/main/zoo/basket.png)
