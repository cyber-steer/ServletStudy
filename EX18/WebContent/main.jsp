<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	if(session.getAttribute("ValidMem") == null){
%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%
	}

	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1><%= name %>님 안녕하세요</h1>
	<form action="logout.jsp" method="post">
		<input type="submit" value="로그아웃" /> &nbsp;&nbsp; <input type="button" value="정보수정" onclick="javascript:window.location='modify.jsp'" />
	</form>
</body>
</html>