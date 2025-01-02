<%@ page contentType="text/html; charset=UTF-8"%>
<%
//새로운글로 입력(num=0, ref=0, step=0, depth=0)
//다른글을 누르고 입력(num=부모값, ref=부모값, step=부모값, depth=부모값)
int num = 0, ref = 0, step = 0, depth = 0;
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
String name = (String) session.getAttribute("name");

try {
	if (request.getParameter("num") != null) {
		num = Integer.parseInt(request.getParameter("num"));
		ref = Integer.parseInt(request.getParameter("ref"));
		step = Integer.parseInt(request.getParameter("step"));
		depth = Integer.parseInt(request.getParameter("depth"));
	}
%>
<html>
<head>
<title>문정배</title>
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<link href="write.css?timestamp=<%=System.currentTimeMillis()%>"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="script.js?timestamp=<%=System.currentTimeMillis()%>">
	
</script>
</head>
<body onload="onload()">
	<%
	if (id != null) {
	%>
	<div class="banner">
		<div class="banner_left">
			<a href="Zoo.jsp" target="_self"><i class="fa-solid fa-cat"></i></a>
			<a href="Zoo.jsp"><p>Zoo</p></a>
		</div>
		<div class="banner_right">
			<ul>
				<li class="dropdown"><a href="#" class="dropdown_button">매장소개</a>
					<div class="dropdown_content">
						<a href="#">관람 유의사항</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
						<a href="#">오시는길</a>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown_button">체험정보</a>
					<div class="dropdown_content">
						<a href="#">프로그램 안내</a> <a href="#">동물정보</a>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown_button">매장정보</a>
					<div class="dropdown_content">
						<a href="#">제휴/할인 안내</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
						<a href="#">오시는길</a>
					</div></li>
				<li class="dropdown"><a href="list.jsp" class="dropdown_button">커뮤니티</a>
					<div class="dropdown_content">
						<a href="list.jsp">자유게시판</a> <a href="#">자료실</a>
					</div></li>
			</ul>
		</div>
		<div class="input_button">
			<button type="button" class="ticket"
				onClick="window.location='./ticket/ticket.jsp'">
				<i class="fa-solid fa-ticket"></i><span>구매하기</span>
			</button>
			<ul class="myPage">
				<li class="dropdown"><b><%=name%></b>님 환영합니다.
					<div class="dropdown_content">
						<a href="myPage.jsp">마이페이지</a> <a href="./login/logout.jsp">로그아웃</a>
					</div></li>
			</ul>
		</div>
	</div>
	<div class="content">
		<nav>
			<h4>커뮤니티</h4>
			<ul>
				<a href="list.jsp"><li>자유게시판</li></a>
				<a href=""><li>자료실</li></a>
			</ul>
		</nav>
		<div class=write_content>
			<h4 class="title">자유게시판</h4>
			<div class="write">
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
									value="<%=name%>" placeholder="작성자 이름" /></td>
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
							<td><input type="text" name="subject" class="subject"
								placeholder="답글 제목을 입력 해 주세요" /></td>
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
			</div>
		</div>


		<!-- 예외처리<2> -->
		<%
		} else {
		%>
		<script>
			alert("로그인 후 이용 바랍니다.")
			history.go(-1);
		</script>
		<%
		}
		} catch (Exception e) {
		}
		%>
	</div>
			<footer>
			<div class="line1">
				<a href="#">이용약관 |</a> <a href="">개인정보처리방침 |</a> <a href="">법적고지
					및 주의사항 |</a> <a href="">입점안내</a>
			</div>
			<br>
			<p style="color: rgba(0, 0, 0, 0.596);">본 동물원 홈페이지는 통신판매중개자이며,
				통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매자에게 있습니다</p>

			<p>사업자등록번호 : 111-11-11111</p>
			<p>통신판매업신고번호 : 제0001-경기평택-0001호</p>
			<p>대표이사 : 문정배 | 이메일 : ster12390@naver.com</p>
			<p>대표전화 : 1555-1555 | 1:1문의 | 호스팅 서비스 제공 : 문정배</p>
		</footer>
</body>
</html>