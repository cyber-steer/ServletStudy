<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	dispacherJsp.jsp
	<hr />
	
	id : <%= request.getAttribute("id") %> <br />
	pw : <%= request.getAttribute("pw") %>
</body>
</html>