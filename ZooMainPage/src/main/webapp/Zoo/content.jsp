<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
String name = (String) session.getAttribute("name");

int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
session.setAttribute("num", num);
session.setAttribute("pageNum", pageNum);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

try {
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO vo = new BoardVO();
	vo.setNum(num);
	BoardVO bvo = bdao.selectBoardDB(vo);
	int _num = bvo.getNum();
	int ref = bvo.getRef();
	int step = bvo.getStep();
	int depth = bvo.getDepth();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문정배</title>
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<link href="content.css?timestamp=<%=System.currentTimeMillis()%>"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="script.js?timestamp=<%=System.currentTimeMillis()%>">
	
</script>
<script>
function deleteWindow() {
	let left = Math.ceil((window.screen.width - 450) / 2);
	let top = Math.ceil((window.screen.height - 450) / 2);
	
	let num = "<%=num%>";
	let pageNum = "<%=pageNum%>";

		url = "delete.jsp?num=" + num + "&pageNum=" + pageNum;
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

	function updateWindow() {
		let left = Math.ceil((window.screen.width - 450) / 2);
		let top = Math.ceil((window.screen.height - 450) / 2);

		url = "updateId.jsp";
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
</head>
<body onload="onload()">
	<%
	if (id == null) {
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
			<i class="fa-solid fa-user" onclick="loginWindow()"></i>
		</div>
	</div>
</body>
</html>
<%
} else {
%>
<body onload="onload()">
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
	<%
	}
	%>
	<div class="content">
		<nav>
			<h4>커뮤니티</h4>
			<ul>
				<a href="list.jsp"><li>자유게시판</li></a>
				<a href=""><li>자료실</li></a>
			</ul>
		</nav>
		<div class="write_content">
			<h4 class="title">자유게시판</h4>
			<div class="write">
				<div class="table3">
					<table>
						<tr>
							<td><%=bvo.getSubject()%></td>
						</tr>
					</table>
				</div>
				<div class="table1">
					<table>
						<tr>
							<td>작성자 :</td>
							<td>&nbsp;<%=bvo.getWriter()%></td>
						</tr>
					</table>
					<div class="date">
						<table>
							<tr>
								<td><%=sdf.format(bvo.getRegdate())%></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="table2">
					<table>
						<tr>
							<td>조회수</td>
							<td><%=bvo.getReadcount()%></td>
						</tr>
					</table>
				</div>
				<hr>
				<div class="table4">
					<table>
						<tr>
							<td><pre><%=bvo.getContent()%></pre></td>
						</tr>
					</table>
				</div>
				<div class="table5">
					<form method="post" name="content" action="deleteCheck.jsp">
						<input type="hidden" value="<%=_num%>" name="num" id="num">
						<input type="hidden" value="<%=pageNum%>" name="pageNum"
							id="pageNum">
					</form>
					<table>
						<tr>
							<td><input type="button" value="수정하기" class="update" onclick="updateWindow()"> 
							<input type="button" value="삭제하기" class="delete" onclick="deleteWindow()"> 
							<input type="button" value="답글쓰기" class="reply" onclick="document.location.href='reply.jsp?num=<%=num%>&ref=<%=ref%>&step=<%=step%>&depth=<%=depth%>'">
								<input type="button" value="목록보기" class="list" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>


	<%
	} catch (Exception e) {
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