<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");

int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
%>

<html>
<head>
<title>문정배</title>
<link href="./login/login.css" type="text/css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="JavaScript"
	src="../script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>


<body class="loginBody">
	<form method="POST" name="delForm"
		action="deleteCheck.jsp?pageNum=<%=pageNum%>"
		onsubmit="return deleteSave()">
		<input type="hidden" name="num" value="<%=num%>"> <input
			type="hidden" name="pageNum" value="<%=pageNum%>">
		<table class="top">
			<tr class="title">
				<th>삭제 정보 입력</th>
			</tr>
			<tbody>
				<tr>
					<td class="tdicon"><i class="fa-solid fa-key"></i></td>
					<td class="tdbody"><input type="password" name="pass"
						class="pwd" placeholder="PW" /></td>
				</tr>
			</tbody>
			<tr>
				<td><input type="submit" value="삭제하기" class="login_ID"></td>
			</tr>
		</table>
	</form>
</body>
</html>