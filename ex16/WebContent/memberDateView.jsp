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
    	
    	String driver = "oracle.jdbc.driver.OracleDriver";
    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String uid = "c##user11";
    	String upw = "user11";
    	String query = "select * from member";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		try{
			Class.forName(driver);
			connection = DriverManager.getConnection(url, uid, upw);
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			
			while(resultSet.next()){
				String name = resultSet.getString("name");
				String id = resultSet.getString("id");
				String pw = resultSet.getString("pw");
				String phone = resultSet.getString("phone");
				String gender = resultSet.getString("gender");
				
				out.println("이름 : "+name+", 아이디 : "+id+", 비밀번호"+pw+", 연락처 : "+phone+", 성별 : "+gender+"<br>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
</body>
</html>