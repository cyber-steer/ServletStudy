<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%!
    	Connection connection;
    	Statement statement;
    	ResultSet resultSet;
    	
    	String name,id,pw,phone,gender;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		id = (String)session.getAttribute("id");
	
		String query = "select * from member where id ='"+id+"'";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","c##user11","user11");
		statement = connection.createStatement();
		resultSet = statement.executeQuery(query);
		
		while(resultSet.next()){
			name = resultSet.getString("name");
			id = resultSet.getString("id");
			pw = resultSet.getString("pw");
			phone = resultSet.getString("phone");
			gender = resultSet.getString("gender");
		}
	%>
	
	<form action="ModifyOk" method="post">
		이름 : <input type="text" name="name" size="10" value=<%=name %>/><br />
		아이디 : <%=id %> <br />
		비밀번호 : <input type="text" name="pw" size="10"/><br />
		전화번호 : <input type="text" name="phone" value=<%=phone %> /><br />
		<%
			if(gender.equals("man")){
		%>
		성별 : <input type="radio" name="gender" value="man" checked="checked"/>남 &nbsp;<input type="radio" name="gender" value="woman" />여<br />
		<%
			} else{
		%>
		성별 : <input type="radio" name="gender" value="man" />남 &nbsp;<input type="radio" name="gender" value="woman" checked="checked"/>여<br />
		<%
			}
		%>
		<input type="submit" value="정보수정"/> <input type="reset" value="취소"/>
	</form>
</body>
</html>