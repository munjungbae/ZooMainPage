<%@page import="co.kh.dev.memberone.model.StudentVO"%>
<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@ page import="java.sql.Timestamp"%>
<%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String pass = request.getParameter("pass");

BoardVO vo = new BoardVO();
vo.setNum(num);
vo.setPass(pass);

BoardDAO bdao = BoardDAO.getInstance();
boolean flag = bdao.deleteDB(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
		let pageNum = "<%=pageNum%>
	";
</script>
<body>
	<%
	if (flag == true) {
	%>
	<script>
		opener.location.replace('list.jsp');
		self.close()
	</script>
	<%
	} else {
	%>
	<script>
		alert("비밀번호가 일치하지 않습니다");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>