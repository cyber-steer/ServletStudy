<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		
		for(int i=0; i<cookies.length; i++){
			String str = cookies[i].getName();
			if(str.equals("cookieN")){
				out.println("cookie["+i+"] namne: "+cookies[i].getName()+"<br />");
				out.println("cookie["+i+"] value: "+cookies[i].getValue()+"<br />");
				out.println("==================================");
			}
		}
	%>
	<a href="cookiedel.jsp">cookie delete</a>
</body>
</html>