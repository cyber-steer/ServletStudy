<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%=session.getAttribute("name") %>님의 회원정보 수정이 정상 처리 되었습니다<br />
<a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;<a href="modify.jsp">정보수정</a>
</body>
</html>