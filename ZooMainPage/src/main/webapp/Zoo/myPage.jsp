<%@page import="co.kh.dev.memberone.model.StudentVO"%>
<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
String id = (String) session.getAttribute("id");
String pass = request.getParameter("pass");
String name = (String) session.getAttribute("name");
String title = (String) session.getAttribute("title");
int price = (Integer) session.getAttribute("price");

String passValue = (String) session.getAttribute("pass");

StudentVO svo = new StudentVO();
svo.setId(id);
StudentDAO sdao = new StudentDAO();
svo = sdao.selectOneDB(svo);
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문정배</title>
<link rel="stylesheet"
	href="myPage.css?timestamp=<%=System.currentTimeMillis()%>">
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="javascript"
	src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>

<%
if (passValue.equals(pass)) {
%>

<div class="banner">
	<div class="banner_left">
		<a href="Zoo.jsp" target="_self"><i class="fa-solid fa-cat"></i></a> <a
			href="Zoo.jsp"><p>Zoo</p></a>
	</div>
	<div class="banner_right">
		<ul>
			<li class="dropdown"><a href="#" class="dropdown_button">매장소개</a>
				<div class="dropdown_content">
					<a href="#">관람 유의사항</a> <a href="#">운영시간</a> <a href="#">매장안내</a> <a
						href="#">오시는길</a>
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
		<h4>마이페이지</h4>
		<ul>
			<a href="myPage.jsp"><li>회원정보수정</li></a>
			<a href="./ticket/basket.jsp"><li>예매정보확인</li></a>
		</ul>
	</nav>
	<div class=write_content>
		<h4 class="title">회원정보수정</h4>
		<div class="registerBody">
			<form method="post" action="./login/modifyCheck.jsp" name="register">
				<div class="register">
					<table class="register_id">
						<tr>
							<td><input type="text" class="id" name="id"
								value="<%=svo.getId()%>" readonly="readonly" /></td>
						</tr>
						<tr>
							<td><input type="password" class="pass" name="pass"
								placeholder="비밀번호" /><span></span></td>
						</tr>
						<tr>
							<td><input type="password" class="repass" name="repass"
								placeholder="비밀번호 확인" /><span></span></td>
						</tr>
						<tr>
							<td><input type="text" class="name" name="name"
								value="<%=svo.getName()%>" /><span></span></td>
						</tr>

						<tr>
							<td><select name="phone1" class="phone1">
									<option value="02">02</option>
									<option value="010">010</option>
							</select> - <input type="text" class="phone2" name="phone2"
								value="<%=svo.getPhone2()%>" /> - <input type="text"
								class="phone3" name="phone3" value="<%=svo.getPhone3()%>" /><span></span></td>
						</tr>
						<tr>
							<td><input type="text" class="email" name="email"
								value="<%=svo.getEmail()%>" /><span></span></td>
						</tr>
						<tr>
							<td><input type="text" class="zipcode" name="zipcode"
								value="<%=svo.getZipcode()%>" /> <input type="button"
								value="찾기" onClick="zipCheckMy()" name="find" class="find" /><span></span></td>
						</tr>
						<tr>
							<td><input type="text" class="address1" name="address1"
								value="<%=svo.getAddress1()%>" /><span></span></td>
						</tr>
						<tr>
							<td><input type="text" class="address2" name="address2"
								value="<%=svo.getAddress2()%>" /><span></span></td>
						</tr>
						<tr>
							<td><input type="reset" value="다시입력" class="reset">
								<input type="button" value="정보수정" onClick="myPageinputCheck()"
								class="register_user" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>

	<%
	} else {
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
						<a href="myPage.jsp" class="my_page">마이페이지</a> <a
							href="./login/logout.jsp">로그아웃</a>
					</div></li>
			</ul>
		</div>
	</div>
	<div class="content">
		<nav>
			<h4>마이페이지</h4>
			<ul>
				<a href="myPage.jsp"><li>회원정보수정</li></a>
				<a href="./ticket/basket.jsp"><li>예매정보확인</li></a>
			</ul>
		</nav>
		<div class=write_content>
			<h4 class="title">개인정보 확인</h4>
			<div class="write">
				<form method="post" name="myPage" action="myPage.jsp">
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
	<%
	}
	%>