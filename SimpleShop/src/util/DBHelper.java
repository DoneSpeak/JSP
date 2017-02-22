package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {
//	数据库驱动
	private static final String driver = "com.mysql.jdbc.Driver";
//	连接数据库的URL地址，这里使用的是mysql的默认端口3306
//	添加字符集，防止中文写入乱码
	private static final String url = "jdbc:mysql://localhost:3306/simpleshop?useUnicode=true&characterEncoding=UTF-8";
//	数据库登陆信息，我这里不使用root用户，一般对与一个项目，我们可以创建一个独立的具有部分权限用户出来，root用户一般都只是用于管理数据库
	private static final String username = "superboy";
	private static final String password = "iamsuperboy";
	
	private static Connection conn = null;
	
//	静态代码块负责加载驱动
//	一般情况下,如果有些代码必须在项目启动的时候就执行的时候,需要使用静态代码块,这种代码是主动执行的，且优先于主函数。
	static{
		try{
			Class.forName(driver);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws Exception{
		if(conn == null){
			conn = DriverManager.getConnection(url,username,password);
			return conn;
		}
		return conn;
	}
	
	public static void main(String[] args) {
		
		try
		{
		   Connection conn = DBHelper.getConnection();
		   if(conn!=null)
		   {
			   System.out.println("数据库连接正常！");
		   }
		   else
		   {
			   System.out.println("数据库连接异常！");
		   }
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}
}
