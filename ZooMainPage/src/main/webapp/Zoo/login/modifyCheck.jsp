<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="sdao" class="co.kh.dev.memberone.model.StudentDAO" />
<jsp:useBean id="svo" class="co.kh.dev.memberone.model.StudentVO">
	<jsp:setProperty name="svo" property="*" />
</jsp:useBean>
<%
String id = (String) session.getAttribute("id");
svo.setId(id);
boolean flag = sdao.updateDB(svo);
%>
<html>
<head>
<title>정보수정</title>
</head>
<meta http-equiv="Refresh" content="0;url=../myPage.jsp">
<body>
	<main>
		<%
		if (flag == true) {
			session.setAttribute("pass", svo.getPass());
		%>
		<script>
			alert('정보 수정이 완료 되었습니다.');
		</script>
		<%
		} else {
		%>
		<p>수정에 실패 하였습니다 다시 입력 바랍니다.</p>
		<%
		return;
		}
		%>
	</main>
</body>
</html>