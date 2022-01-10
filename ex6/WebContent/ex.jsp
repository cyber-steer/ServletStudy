<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		int i = 10;
		String str = "Hello World!";
	%>
	<%
		int[] iarr = {1,2,3};
		int temp = 30;
		out.println("i = "+i+"<br>");
		out.println("str = "+str+"<br>");
		out.println("iarr = "+Arrays.toString(iarr)+"<br>");
	%>
	i = <%= i %> <br />
	str = <%= str %> <br />
	temp = <%= temp %> <br /> <br />
	<h1>ex.jsp 파일</h1>
	<%@ include file="ex1.jsp" %>
	<h1>ex.jsp 파일</h1>
	<!-- html 주석 -->
	<%-- jps 주석 --%>
</body>
</html>