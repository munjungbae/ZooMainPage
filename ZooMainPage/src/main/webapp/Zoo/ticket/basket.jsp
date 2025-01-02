<%@page import="java.util.ArrayList"%>
<%@page import="co.kh.dev.memberone.model.BasketVO"%>
<%@page import="co.kh.dev.memberone.model.BasketDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String pass = (String) request.getParameter("pass");
String name = (String) session.getAttribute("name");

String passValue = (String) session.getAttribute("pass");

BasketDAO bdao = new BasketDAO();
BasketVO bvo = new BasketVO();
bvo.setId(id);

ArrayList<BasketVO> bList = bdao.selectDB(bvo);
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문정배</title>
<link rel="stylesheet"
	href="basket.css?timestamp=<%=System.currentTimeMillis()%>">
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="javascript"
	src="../script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<script>
	function loginWindow() {
		var left = Math.ceil((window.screen.width - 450) / 2);
		var top = Math.ceil((window.screen.height - 450) / 2);

		url = "../login/login.jsp";
		window
				.open(
						url,
						' ',
						'width='
								+ 450
								+ ',height='
								+ 360
								+ ',left='
								+ left
								+ ',top='
								+ top
								+ ',scrollbars=no,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no');
	}
	function passCheck() {
		opener.location.reload();
	}
</script>
<body>
<%
if (passValue.equals(pass)) {
%>
	<div class="banner">
		<div class="banner_left">
			<a href="../Zoo.jsp" target="_self"><i class="fa-solid fa-cat"></i></a>
			<a href="../Zoo.jsp"><p>Zoo</p></a>
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
				<li class="dropdown"><a href="../list.jsp"
					class="dropdown_button">커뮤니티</a>
					<div class="dropdown_content">
						<a href="../list.jsp">자유게시판</a> <a href="#">자료실</a>
					</div></li>
			</ul>
		</div>
		<div class="input_button">
			<button type="button" class="ticket"
				onClick="window.location='ticket.jsp'">
				<i class="fa-solid fa-ticket"></i><span>구매하기</span>
			</button>
			<ul class="myPage">
				<li class="dropdown"><b><%=name%></b>님 환영합니다.
					<div class="dropdown_content">
						<a href="../myPage.jsp">마이페이지</a> <a href="../login/logout.jsp">로그아웃</a>
					</div></li>
			</ul>
		</div>
	</div>
	<div class="content">
		<nav>
			<h4>마이페이지</h4>
			<ul>
				<a href="../myPage.jsp"><li>회원정보수정</li></a>
				<a href="basket.jsp"><li>예매정보확인</li></a>
			</ul>
		</nav>
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
	</div>
<%
} else {
%>
	<div class="banner">
		<div class="banner_left">
			<a href="../Zoo.jsp" target="_self"><i class="fa-solid fa-cat"></i></a>
			<a href="../Zoo.jsp"><p>Zoo</p></a>
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
				<li class="dropdown"><a href="../list.jsp"
					class="dropdown_button">커뮤니티</a>
					<div class="dropdown_content">
						<a href="../list.jsp">자유게시판</a> <a href="#">자료실</a>
					</div></li>
			</ul>
		</div>
		<div class="input_button">
			<button type="button" class="ticket"
				onClick="window.location='ticket.jsp'">
				<i class="fa-solid fa-ticket"></i><span>구매하기</span>
			</button>
			<ul class="myPage">
				<li class="dropdown"><b><%=name%></b>님 환영합니다.
					<div class="dropdown_content">
						<a href="../myPage.jsp" class="my_page">마이페이지</a> <a
							href="../login/logout.jsp">로그아웃</a>
					</div></li>
			</ul>
		</div>
	</div>
	<div class="content">
		<nav>
			<h4>마이페이지</h4>
			<ul>
				<a href="../myPage.jsp"><li>회원정보수정</li></a>
				<a href="basket.jsp"><li>예매정보확인</li></a>
			</ul>
		</nav>
		<div class=write_content>
			<h4 class="title">예매정보 확인</h4>
			<div class="write">
				<form method="post" name="basket" action="basket.jsp">
					<div class="passCheck">
						<table>
							<tr>
								<td class="tdicon"><i class="fa-solid fa-key"></i></td>
								<td class="tdbody"><input type="password" name="pass"
									class="myPagePass" placeholder="비밀번호 확인" /></td>
							</tr>
							<table>
							</table>
							<tr>
								<td><input type="submit" class="submit" value="입력"
									onclick="passCheck()" /></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
	}
	%>
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