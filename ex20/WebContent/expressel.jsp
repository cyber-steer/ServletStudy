<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<jsp:useBean id="member" class="com.javaelc.ex.MemberInfo" scope="page" />
<jsp:setProperty name="member" property="name" value="홍길동" />
<jsp:setProperty name="member" property="id" value="abc" />
<jsp:setProperty name="member" property="pw" value="123" />
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	이름 : <jsp:getProperty name="member" property="name"/> <br />
	아이디 : <jsp:getProperty name="member" property="id" /> <br />
	비밀번호 : <jsp:getProperty name="member" property="pw" /> <br />
	
	<hr />
	이름 : ${ member.name } <br />
	아이디 : ${ member.id } <br />
	비밀번호 : ${ member.pw } <br />
</body>
</html>