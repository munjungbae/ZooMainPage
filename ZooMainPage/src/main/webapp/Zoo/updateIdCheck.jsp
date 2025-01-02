<%@page import="co.kh.dev.memberone.model.StudentVO"%>
<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@ page import="java.sql.Timestamp"%>
<%
request.setCharacterEncoding("UTF-8");

String id = (String) session.getAttribute("id");
String pass = (String) request.getParameter("pass");

int num = (Integer) session.getAttribute("num");
String pageNum = (String) session.getAttribute("pageNum");

BoardDAO bdao = BoardDAO.getInstance();
BoardVO vo = new BoardVO();
vo.setNum(num);
BoardVO bvo = bdao.selectBoardDB(vo);
int _num = bvo.getNum();
String passValue = bvo.getPass();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
		let pageNum = "<%=pageNum%>";
</script>
<body>
	<%
	if (pass.equals(passValue)) {
	%>
	<script>
	opener.document.location.replace("update.jsp?num=<%=_num%>&pageNum=<%=pageNum%>");
		self.close();
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