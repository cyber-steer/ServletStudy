<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:set var="varName" value="varValue" />
	varName : <c:out value="${ varName }" />
	<br />
	<c:remove var="varName" />
	varName : <c:out value="${ varName }" /> </h3>
	
	<hr />
	
	<c:catch var="error">
		<%=2/0 %>
	</c:catch>
	<br />
	<c:out value="${ error }" />
	
	<hr />
	
	<c:if test="${ 1+2 == 3 }">
		1 + 2 = 3
	</c:if>
	<c:if test="${ 1+2 != 3 }">
		1 + 2 != 3
	</c:if>
	
	<hr />
	
	<c:forEach var="fEach" begin="0" end="30" step="3">
		${ fEach }
	</c:forEach>
	
</body>
</html>