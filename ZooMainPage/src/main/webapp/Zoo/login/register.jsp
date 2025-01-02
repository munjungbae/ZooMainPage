<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>register</title>
<link href="login.css" type="text/css" rel="stylesheet" />
<script language="JavaScript"
	src="../script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
<style>
</style>
</head>
<body class="registerBody">
	<form method="post" action="insert.jsp" name="register">
		<div class="register">
			<table class="register_id">
				<tr>
					<th class="title">회원 가입 정보 입력</th>
				</tr>
				<tr>
					<td><input type="text" class="id" name="id" placeholder="아이디" /><input
						type="button" value="중복확인" onClick="idCheck()" name="idText"
						class="idCheck" /><span></span></td>
				</tr>
				<tr>
					<td><input type="password" class="pass" name="pass"
						placeholder="비밀번호" /><span></span></td>
				</tr>
				<tr>
					<td><input type="password" class="repass" name="repass"
						placeholder="비밀번호 확인" /><span></span></td>
				</tr>
				<tr>
					<td><input type="text" class="name" name="name" placeholder="이름(을)를 입력하세요" /><span></span></td>
				</tr>

				<tr>
					<td><select name="phone1" class="phone1">
							<option value="02">02</option>
							<option value="010">010</option>
					</select> - <input type="text" class="phone2" name="phone2" /> - <input
						type="text" class="phone3" name="phone3" /><span></span></td>
				</tr>
				<tr>
					<td><input type="text" class="email" name="email" placeholder="이메일" /><span></span></td>
				</tr>
				<tr>
					<td><input type="text" class="zipcode" name="zipcode"
						placeholder="우편번호" /> <input type="button" value="찾기"
						onClick="zipCheck()" name="find" class="find" /><span></span></td>
				</tr>
				<tr>
					<td><input type="text" class="address1" name="address1"
						placeholder="주소1" /><span></span></td>
				</tr>
				<tr>
					<td><input type="text" class="address2" name="address2"
						placeholder="주소2" /><span></span></td>
				</tr>
				<tr>
					<td><input type="reset" value="다시입력" class="reset">
						<input type="button" value="가입하기" onClick="inputCheck()"
						class="register_user" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>