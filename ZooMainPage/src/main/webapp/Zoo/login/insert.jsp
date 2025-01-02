<%@page import="java.awt.Window"%>
<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
StudentDAO sdao = new StudentDAO();
%>
<jsp:useBean id="svo" class="co.kh.dev.memberone.model.StudentVO" />
<jsp:setProperty name="svo" property="*" />
<%
boolean flag = sdao.insertDB(svo);
String name = (String) session.getAttribute("name");
session.setAttribute("name", name);
%>
<html>
<head>
<title>회원가입 확인</title>
</head>
<link href="./login.css" rel="stylesheet" type="text/css">
	<main>
		<%
		if (flag) {
		%>
		<script>
			alert('회원 가입이 완료 되었습니다.');
			javascript: self.close();
		</script>
		<%
		} else {
		%>
		<script>
			alert('다시 입력 바랍니다.');
			history.go(-1);
		</script>
		<%
		}
		%>
	</main>
</body>
</html>
