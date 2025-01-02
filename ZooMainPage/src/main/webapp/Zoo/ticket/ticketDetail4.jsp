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
	href="ticketDetail.css?timestamp=<%=System.currentTimeMillis()%>">
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="javascript"
	src="../script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
</script>
<script type="text/javascript">
	function ticketInsert() {
		document.capy_detail.submit();
	}
</script>

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

</body>
</html>
<hr>
<form method="post" action="basketinsert.jsp" name="ticketForm">
	<input type="hidden" name="price" value=25000> <img
		src="./image/penguin.jpg" alt="" class="cat_detail">
	<p class="title">일일 훈련사 체험</p>
	<p class="price">25000원</p>
	<p class="detail">상세 옵션을 선택 해 주세요</p>
	<select name="ticket_list" id="ticket_list">
		<option disabled hidden selected class="option_value">메뉴를 선택
			해 주세요</option>
		<option value="일일 훈련사 체험">일일 훈련사 체험 1인 입장권 25000원</option>
	</select>
	<p id="result"></p>
	<input type="number" class="number_increment" name="number_increment"
		value="1" min="1"> <input type="submit" value="구매하기"
		class="submit_detail">
</form>
<%
String ticketName = "일일 훈련사 체험 1인 입장권 25000원";
%>
<script>
	const ticket_list = document.ticketForm.ticket_list;
	const pobj = document.querySelector('p#result')
	const price = document.querySelector('p#price_sum')
	const number = document.querySelector('.number_increment')

	ticket_list.addEventListener("change", check);

	function check() {
		pobj.textContent = `<%=ticketName%>
	`;
		number.style.display = 'inline-block'
	}
</script>
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
<%
}
%>

