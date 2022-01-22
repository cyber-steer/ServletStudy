<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%!
    	Connection connection;
    	PreparedStatement preparedStatement;
    	ResultSet resultSet;
    	
    	String driver = "oracle.jdbc.driver.OracleDriver";
    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String uid = "c##user11";
    	String upw = "user11";
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
			int n;
			String query = "insert into member (name, id, pw, phone, gender) values(?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, "이름");
			preparedStatement.setString(2, "id");
			preparedStatement.setString(3, "pw");
			preparedStatement.setString(4, "010-0000-00000");
			preparedStatement.setString(5, "man");
			n = preparedStatement.executeUpdate();
			
			preparedStatement.setString(1, "가나다");
			preparedStatement.setString(2, "id");
			preparedStatement.setString(3, "pw");
			preparedStatement.setString(4, "010-9876-5432");
			preparedStatement.setString(5, "woman");
			n = preparedStatement.executeUpdate();
			
			preparedStatement.setString(1, "아무개");
			preparedStatement.setString(2, "id");
			preparedStatement.setString(3, "pw");
			preparedStatement.setString(4, "010-1111-1111");
			preparedStatement.setString(5, "man");
			n = preparedStatement.executeUpdate();
			
			preparedStatement.setString(1, "무명");
			preparedStatement.setString(2, "id");
			preparedStatement.setString(3, "pw");
			preparedStatement.setString(4, "010-2222-2222");
			preparedStatement.setString(5, "woman");
			n = preparedStatement.executeUpdate();
			
			if(n == 1) out.println("insert sucess");
			else out.println("insert fail");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	%>
	
	<br />
	<a href="memberDateView.jsp">회원정보 보기</a>
</body>
</html>