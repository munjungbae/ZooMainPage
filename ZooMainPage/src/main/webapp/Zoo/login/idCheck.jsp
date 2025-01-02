<%@page import="co.kh.dev.memberone.model.StudentVO"%>
<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
//1. 사용자 정보를 가져온다
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
//2. curd
StudentVO svo = new StudentVO();
svo.setId(id);
StudentDAO sdao = new StudentDAO();
boolean flag = sdao.selectIdCheck(svo);
%>
<!-- 3. 화면설계 -->
<!DOCTYPE html>
<html>
<head>
<title>ID중복체크</title>
<script language="JavaScript" src="../script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
	<%
	if (flag == true) {
	%>
	<script>
		trueValue();
	</script>
	<%
	} else {
	%>
	<script>
		falseValue();
	</script>
	<%
	}
	%>
	<script>
		javascript: self.close();
	</script>
</body>
</html>



