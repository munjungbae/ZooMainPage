<%@page import="co.kh.dev.memberone.model.BasketVO"%>
<%@page import="co.kh.dev.memberone.model.BasketDAO"%>
<%@page import="java.awt.Window"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("ticket_list");
int price = Integer.parseInt(request.getParameter("price"));
int count = Integer.parseInt(request.getParameter("number_increment"));
int priceValue = price * count;

String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
BasketDAO bdao = new BasketDAO();
BasketVO bvo = new BasketVO(id, name, email, title, priceValue, count);
%>

<html>
<head>
<title>회원가입 확인</title>
</head>
<link href="./login.css" rel="stylesheet" type="text/css">
<main>
	<%
	if (title == null || count <= 0) {
	%>
	<script>
		alert('메뉴와 수령을 정확하게 선택 해 주세요.');
		history.go(-1);
	</script>
	<%
	} else {
	boolean flag = bdao.insertDB(bvo);
	if (flag) {
		session.setAttribute("priceValue", bvo.getPrice());
		session.setAttribute("title", bvo.getTitle());
		session.setAttribute("count", bvo.getCount());
	%>
	<script>
		alert('구매가 완료 되었습니다.');
		history.go(-1);
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
	}
	%>
</main>