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
	<h1><%= name %>�� �ȳ��ϼ���</h1>
	<form action="logout.jsp" method="post">
		<input type="submit" value="�α׾ƿ�" /> &nbsp;&nbsp; <input type="button" value="��������" onclick="javascript:window.location='modify.jsp'" />
	</form>
</body>
</html>