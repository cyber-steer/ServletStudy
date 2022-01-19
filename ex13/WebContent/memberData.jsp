<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%!
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "c##user11";
		String upw = "user11";
		String query = "select * from test";
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
			Class.forName("oracle.jdbc.driver.OracleDriver");
			out.println("driver clear<br>");
			connection = DriverManager.getConnection(url,uid,upw);
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			
			while(resultSet.next()){
				String id = resultSet.getString("id");
				String pw = resultSet.getString("pw");
				String name = resultSet.getString("name");
				String tel = resultSet.getString("tel");
				
				out.println("���̵� : " +id +", ��й�ȣ : "+ pw +", �̸� : "+name+", ��ȭ��ȣ : "+tel+"<br>");
			}
		}catch(Exception e){
			out.println("error: "+e);
		}finally{
			try{
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			} catch(Exception e){}
			
		}
	%>
</body>
</html>