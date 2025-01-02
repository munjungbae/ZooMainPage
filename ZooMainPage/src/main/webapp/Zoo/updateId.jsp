<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");

int num = (Integer) session.getAttribute("num");
String pageNum = (String) session.getAttribute("pageNum");

BoardDAO bdao = BoardDAO.getInstance();
BoardVO vo = new BoardVO();
vo.setNum(num);
BoardVO bvo = bdao.selectBoardDB(vo);
int _num = bvo.getNum();
%>

<html>
<head>
<title>문정배</title>
<link href="./login/login.css?timestamp=<%=System.currentTimeMillis()%>"
	type="text/css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="JavaScript"
	src="../script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>

<%
if (id != null) {
%>
<body class="loginBody">
	<form method="POST" name="updateForm" action="updateIdCheck.jsp">
		<input type="hidden" name="num" value="<%=num%>"> <input
			type="hidden" name="pageNum" value="<%=pageNum%>">
		<table class="top">
			<tr class="title">
				<th>비밀번호 입력</th>
			</tr>
			<tbody>
				<tr>
					<td class="tdicon"><i class="fa-solid fa-key"></i></td>
					<td class="tdbody"><input type="password" name="pass"
						class="pwd" placeholder="PW" /></td>
				</tr>
			</tbody>
			<tr>
				<td><input type="submit" value="입력하기" class="login_ID"></td>
			</tr>
		</table>
	</form>
</body>
<%
} else {
%>
<script>
	opener.window.alert("로그인 후 이용 바랍니다.");
	self.close();
</script>
<%
}
%>
</html>