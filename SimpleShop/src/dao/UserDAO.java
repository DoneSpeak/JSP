package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

import entity.User;
import util.DBHelper;

public class UserDAO {
//	注册
//	判断用户是否已经存在
	public boolean isExistByName(String username){
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet userSet = null;
		
		try{
			//【1. 连接数据库】
			conn = DBHelper.getConnection();
			//【 2. 执行SQL语句，接收执行结果集ResultSet 】			
			String sql = "select * from user where user=?";
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, username);
			userSet = preStmt.executeQuery();
			//【 3. 处理执行结果集ResultSet】
			if(userSet.next()){
				return true;
			}
			return false;
		}catch(Exception ex){
			ex.printStackTrace();
			return true;
		}finally{
			//【 4. 必要的关闭ResultSet、Statement 】
			if(userSet != null){
				try {
					userSet.close();
					userSet = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(preStmt != null){
				try {
					preStmt.close();
					preStmt = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
//	插入用户数据，同时判断用户是否存在
	public String addUser(User user){
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet affectedSet = null;
		
		String uid = null;
		
		try{
			conn = DBHelper.getConnection();
			String sql = "insert into user(name, password) values(?, ?)";
//			[!]注意这里的insert获取id的写法
			preStmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			preStmt.setString(1, user.getName());
			preStmt.setString(2, user.getPassword());
			preStmt.executeUpdate();
			affectedSet = preStmt.getGeneratedKeys();
			if(affectedSet.next()){
				uid = affectedSet.getString(1);
			}
			return uid;
		}catch(MySQLIntegrityConstraintViolationException ex){
			if(ex.getErrorCode() == 1062){
//				System.out.println("用户已存在");
				return "exist";
			}
			ex.printStackTrace();
			return null;
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}finally{
			if(affectedSet != null){
				try {
					affectedSet.close();
					affectedSet = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(preStmt != null){
				try {
					preStmt.close();
					preStmt = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}
//	登陆
//	判断用户名和用户密码是否匹配
	public String userLogin(User user){
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet userSet = null;
		
		try{
			conn = DBHelper.getConnection();
			String sql = "select uid from user where name=? and password=?";
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, user.getName());
			preStmt.setString(2, user.getPassword());
			userSet = preStmt.executeQuery();
			if(userSet.next()){
				return userSet.getString("uid");
			}
			return "false";
		}catch(Exception ex){
			ex.printStackTrace();
			return "false";
		}finally{
			//【 4. 必要的关闭ResultSet、Statement 】
			if(userSet != null){
				try {
					userSet.close();
					userSet = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(preStmt != null){
				try {
					preStmt.close();
					preStmt = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	public static void main(String args[]){
		UserDAO userdao = new UserDAO();
		User user = new User();
		user.setName("xiandddg");
		user.setPassword("112222");
//		userdao.addUser(user);
		System.out.println(userdao.userLogin(user));
		System.out.println("完成");
	}
}
