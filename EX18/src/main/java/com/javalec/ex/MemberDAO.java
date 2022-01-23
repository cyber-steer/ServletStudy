package com.javalec.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {}
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public int insertMember(MemberDTO dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String query = "insert into members values(?,?,?,?,?,?)";
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, dto.getId());
			preparedStatement.setString(2, dto.getPw());
			preparedStatement.setString(3, dto.getName());
			preparedStatement.setString(4, dto.geteMail());
			preparedStatement.setTimestamp(5, dto.getrDate());
			preparedStatement.setString(6, dto.getAddress());
			preparedStatement.executeUpdate();
			ri = MEMBER_JOIN_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return ri;
	}
	
	public int confirmId(String id) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String query = "select id form members where id = ?";
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) ri = MEMBER_EXISTENT;
			else ri = MEMBER_NONEXISTENT;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return ri;
	}
	
	public int userCheck(String id, String pw) {
		int ri = 0;
		String dbPw;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String query = "select pw from members where id = ?";
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				dbPw = resultSet.getString("pw");
				if(dbPw.equals(pw))
					ri = MEMBER_JOIN_SUCCESS;
				else
					ri = MEMBER_LOGIN_PW_NO_GOOD;
			}
			else {
				ri = MEMBER_LOGIN_IS_NOT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ri;
	}
	
	public MemberDTO getMember(String id) {
		Connection connection = null;
		PreparedStatement preparedStatement =null;
		ResultSet resultSet = null;
		String query = "select * from members where id = ?";
		MemberDTO dto = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				dto = new MemberDTO();
				dto.setId(resultSet.getString("id"));
				dto.setPw(resultSet.getString("pw"));
				dto.setName(resultSet.getString("name"));
				dto.seteMail(resultSet.getString("eMail"));
				dto.setrDate(resultSet.getTimestamp("rDate"));
				dto.setAddress(resultSet.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
	}
	
	public int updateMember(MemberDTO dto) {
		int ri =0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String query = "update members set pw=?, eMail=?, address=?, where id=?";
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, dto.getPw());
			preparedStatement.setString(2, dto.geteMail());
			preparedStatement.setString(3, dto.getAddress());
			preparedStatement.setString(4, dto.getId());
			ri = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				preparedStatement.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return ri;
	}
	
	private Connection getConnection() {
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
}
