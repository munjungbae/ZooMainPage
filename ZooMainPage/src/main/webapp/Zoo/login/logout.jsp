<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session = request.getSession(false);

if (session != null) {
	session.invalidate();
}


// 로그인 페이지로 리다이렉트
response.sendRedirect("../Zoo.jsp");
%>