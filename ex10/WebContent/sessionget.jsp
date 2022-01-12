<%@page import="java.util.Enumeration"%>
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
		out.println("================= 값 ============<br />");
		Object obj1 = session.getAttribute("mySessionName");
		String mySessionName = (String)obj1;
		out.println(mySessionName+"<br />");
		
		Object obj2 = session.getAttribute("myNum");
		Integer myNum = (Integer)obj2;
		out.println(myNum +"<br>");

		out.println("============== 모든 세션 ==========<br />");
		
		String sName;
		String sValue;
		Enumeration enumeration = session.getAttributeNames();
		while(enumeration.hasMoreElements()){
			sName = enumeration.nextElement().toString();
			sValue = session.getAttribute(sName).toString();
			out.println("sName : " + sName +" <br>");
			out.println("sValue : " + sValue +" <br>");
		}

		out.println("================= 유효 기간 ============<br />");
		String sessionID = session.getId();
		out.println("sessionID : "+ sessionID + "<br>");
		int sessionInter = session.getMaxInactiveInterval();
		out.println("sessionInter : " +sessionInter+"<br>");

		out.println("================= mySessionName 삭제 ============<br />");
		session.removeAttribute("mySessionName");
		Enumeration enumeration1 = session.getAttributeNames();
		while(enumeration1.hasMoreElements()){
			sName = enumeration1.nextElement().toString();
			sValue = session.getAttribute(sName).toString();
			out.println("sName : " + sName +" <br>");
			out.println("sValue : " + sValue +" <br>");
		}

		out.println("================= 모든 세션 삭제 ============<br />");
		session.invalidate();
		if(request.isRequestedSessionIdValid()){
			out.println("session valid");
		}else{
			out.println("session invalid");
		}
	%>
</body>
</html>