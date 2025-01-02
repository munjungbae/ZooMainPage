<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%
request.setCharacterEncoding("UTF-8");
String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="vo" scope="page"
	class="co.kh.dev.boardone.model.BoardVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<%
BoardDAO bdao = BoardDAO.getInstance();
int check = bdao.updateDB(vo);
// check 반환값이 1일때 : 성공
// 2일때 : 패스워드 문제
// 3일때 : 수정문제
if (check == 1) {
%>
<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<%
} else if (check == 2) {
%>
<script>
	alert("비밀번호가 일치하지 않습니다.");
	history.go(-1);
</script>
<%
} else {
%>
<script>
	alert("업데이트가 올바르게 이뤄지지 않았습니다.");
	history.go(-1);
</script>
<%
}
%>