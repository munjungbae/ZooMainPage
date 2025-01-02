<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
String name = (String) session.getAttribute("name");

session.setAttribute("pass", pass);
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문정배</title>
<link rel="stylesheet"
	href="ticket.css?timestamp=<%=System.currentTimeMillis()%>">
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="javascript"
	src="../script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
</script>
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
</script>
<body onload="onload()">
	<%
	if (id == null) {
	%>
	<script>
		alert("로그인 후 이용 바랍니다.")
		history.go(-1);
	</script>
	<%
	} else {
	%>

<body onload="onload()">
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
			<button type="button" class="ticket">
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

</body>
</html>
<%
}
%>
<hr>
<p class="tema">테마 선택</p>
<div class="ticket_img">
	<form method="post" action="basketinsert.jsp" name="ticket">
		<div class="table1">
			<table>
				<tr>
					<td><a href="#"><img src="./image/capybara.jpg" alt=""
							class="capy"></a></td>
				</tr>
				<div class="linenum1">
					<p>
						<b>먹이주기 체험</b>
					</p>
				</div>
				<tr>
					<td><input type="button" class="submit" value="구매하기" onClick="window.location='ticketDetail.jsp'"></td>
				</tr>
			</table>
		</div>
	</form>
	<form method="post" action="basketinsert.jsp" name="ticket">
		<div class="table2">
			<table>
				<tr>
					<td><a href="#"><img src="./image/cat.jpg" alt=""
							class="otter"></a></a></td>
				</tr>
				<div class="linenum1">
					<p>
						<b>맹수 생태 설명회</b>
					</p>
				</div>
				<tr>
					<td><input type="button" class="submit" value="구매하기" onClick="window.location='ticketDetail2.jsp'"></td>
				</tr>
			</table>
		</div>
	</form>
	<form method="post" action="basketinsert.jsp" name="ticket">
		<div class="table3">
			<table>
				<tr>
					<td><a href="#"><img src="./image/otter.jpg" alt=""
							class="deer"></a></td>
				</tr>
				<div class="linenum1">
					<p>
						<b>동물원 두드림 교육</b>
					</p>
				</div>
				<tr>
					<td><input type="button" class="submit" value="구매하기" onClick="window.location='ticketDetail3.jsp'"></td>
				</tr>
			</table>
		</div>
	</form>
	<form method="post" action="basketinsert.jsp" name="ticket">
		<div class="table4">
			<table>
				<tr>
					<td><a href="#"><img src="./image/penguin.jpg" alt=""
							class="penguin"></a></td>
				</tr>
				<div class="linenum1">
					<p>
						<b>일일 훈련사 체험</b>
					</p>
				</div>
				<tr>
					<td><input type="button" class="submit" value="구매하기" onClick="window.location='ticketDetail4.jsp'"></td>
				</tr>
			</table>
		</div>
	</form>
</div>
<footer>
	<div class="line1">
		<a href="#">이용약관 |</a> <a href="">개인정보처리방침 |</a> <a href="">법적고지 및
			주의사항 |</a> <a href="">입점안내</a>
	</div>
	<br>
	<p style="color: rgba(0, 0, 0, 0.596);">본 동물원 홈페이지는 통신판매중개자이며,
		통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매자에게 있습니다</p>

	<p>사업자등록번호 : 111-11-11111</p>
	<p>통신판매업신고번호 : 제0001-경기평택-0001호</p>
	<p>대표이사 : 문정배 | 이메일 : ster12390@naver.com</p>
	<p>대표전화 : 1555-1555 | 1:1문의 | 호스팅 서비스 제공 : 문정배</p>
</footer>