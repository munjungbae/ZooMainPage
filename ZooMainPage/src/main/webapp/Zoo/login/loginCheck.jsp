<%@page import="co.kh.dev.memberone.model.StudentVO"%>
<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<script language="JavaScript"
	src="../script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
StudentDAO sdao = new StudentDAO();
StudentVO svo = new StudentVO();
svo.setId(id);
svo.setPass(pass);
int check = sdao.selectLoginCheck(svo);
%>
<%
if (id == null) {
%>
<script>
	alert("아이디를 입력 해 주세요");
	history.go(-1);
</script>
<%
} else {
if (check == 1) {//로그인 성공
	StudentVO vo = sdao.selectOneDB(svo);
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	session.setAttribute("name", vo.getName());
	session.setAttribute("email", vo.getEmail());
%>
<script>
	sendID()
</script>
<%
} else if (check == 0) {//아이디는 있는데 비밀번호 오류
%>
<script>
	alert("비밀번호가 일치하지 않습니다.");
	history.go(-1);
</script>
<%
} else {//아이디 자체가 존재하지 않는 경우
%>
<script>
	alert("아이디가 존재하지 않습니다");
	history.go(-1);
</script>
<%
}
}
%>