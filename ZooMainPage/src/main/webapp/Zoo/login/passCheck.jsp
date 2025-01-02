<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>문정배</title>
<link href="login.css" type="text/css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="JavaScript"
	src="../script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
</head>
<body class="loginBody">
	<form method="POST" name="passForm" action="../myPage.jsp"
		onsubmit="return deleteSave()">
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
</html>