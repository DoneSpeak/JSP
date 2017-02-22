package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import entity.Book;
import util.DBHelper;

// 与数据库交互类
public class BookDAO {
	/*
	 JDBC编程过程：
	 1. 连接数据库
	 2. 执行SQL语句，接收执行结果集ResultSet
	 3. 处理执行结果集ResultSet
	 4. 必要的关闭ResultSet、Statement
	 */

	/*
	 * 获取所有书籍
	 */
	public ArrayList<Book> getAllBooks(){
//		数据库连接
		Connection conn = null;
//		数据库操作：对SQL进行预编译的Statment，用于执行sql语句
		PreparedStatement preStmt = null;
//		数据库结果：ResultSet是数据库执行结果集。数据结构和数据库中的表相当
		ResultSet bookSet = null;
//		存放所有的书籍结果
		ArrayList<Book> books = new ArrayList<Book>();
		try{
//--------------- 1. 连接数据库------------------
			conn = DBHelper.getConnection();
//--------------- 2. 执行SQL语句，接收执行结果集ResultSet ------------------
			String sql = "select * from book";
//			预编译sql语句，获取PreparedStament对象
			preStmt = conn.prepareStatement(sql);
//			执行编译的结果
			bookSet = preStmt.executeQuery();
//			遍历结果集的方法如下：
//--------------- 3. 处理执行结果集ResultSet ------------------
			while(bookSet.next()){
				Book book = new Book();
				
				book.setAuthor(bookSet.getString("author"));
				book.setImg(bookSet.getString("img"));
				book.setIntro(bookSet.getString("intro"));
				book.setIsbn(bookSet.getString("isbn"));
				book.setName(bookSet.getString("name"));
				book.setPrice(Float.parseFloat(bookSet.getString("price")));
				book.setPrice_original(Float.parseFloat(bookSet.getString("price_original")));
//				book.setPublish_company(bookSet.getString("publish_company"));
////				时间格式化
//				SimpleDateFormat dateformat  = new SimpleDateFormat( "yyyy年MM月dd日 ");
//				ParsePosition pos = new ParsePosition(0);
//				book.setPublish_time(dateformat.parse(bookSet.getString("name"),pos));
				
				books.add(book);
			}
			return books;
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}finally{
//--------------- 4. 必要的关闭ResultSet、Statement ------------------
//			为了确保资源不被占用，需要在fianlly释放资源，注意这里不可以关闭Connection，否则会报错
//			释放 ResultSet
			if(bookSet != null){
				try{
					bookSet.close();
					bookSet = null;
				}catch(Exception ex){
					ex.printStackTrace();
				}
			}
//			释放语句对象：PreparedStatement
			if(preStmt != null){
				try{
					preStmt.close();
					preStmt = null;
				}catch(Exception ex){
					ex.printStackTrace();
				}
			}
		}
	}
	
	public Book getBookByISBN(String isbn){
		Connection conn = null;
		PreparedStatement preStmt = null;
		ResultSet bookSet = null;
		
		try{
//--------------- 1. 连接数据库------------------
			conn = DBHelper.getConnection();
//--------------- 2. 执行SQL语句，接收执行结果集ResultSet ------------------
			String sql = "select * from book where isbn=?;";
			preStmt = conn.prepareStatement(sql);
			preStmt.setString(1, isbn);
			bookSet = preStmt.executeQuery();
//--------------- 3. 处理执行结果集ResultSet ------------------
			if(bookSet.next()){
				Book book = new Book();
				
				book.setAuthor(bookSet.getString("author"));
				book.setImg(bookSet.getString("img"));
				book.setIntro(bookSet.getString("intro"));
				book.setIsbn(bookSet.getString("isbn"));
				book.setName(bookSet.getString("name"));
				book.setPrice(Float.parseFloat(bookSet.getString("price")));
				book.setPrice_original(Float.parseFloat(bookSet.getString("price_original")));
				book.setPublish_company(bookSet.getString("publish_company"));
//				时间格式化
				SimpleDateFormat dateformat  = new SimpleDateFormat( "yyyy年MM月dd日 ");
				ParsePosition pos = new ParsePosition(0);
				book.setPublish_time(dateformat.parse(bookSet.getString("name"),pos));
				
				return book;
			}else{
				return null;
			}
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}finally{
//--------------- 4. 必要的关闭ResultSet、Statement ------------------
//			为了确保资源不被占用，需要在fianlly释放资源，注意这里不可以关闭Connection，否则会报错
//			释放 ResultSet
			if(bookSet != null){
				try{
					bookSet.close();
					bookSet = null;
				}catch(Exception ex){
					ex.printStackTrace();
				}
			}
//						释放语句对象：PreparedStatement
			if(preStmt != null){
				try{
					preStmt.close();
					preStmt = null;
				}catch(Exception ex){
					ex.printStackTrace();
				}
			}
		}
	}
	
	/*
	 * 通过一系列isbn获取书籍信息
	 */
	public ArrayList<Book> getViewList(String isbnStr){
		ArrayList<Book> books = new ArrayList<Book>();
//		返回最多4条信息
		int maxRecordCount = 4;
		if(isbnStr != null && isbnStr.length() > 0){
			String[] isbns = isbnStr.split(",");
			if(isbns.length >= maxRecordCount){
//				商品记录数大于等于4条
				for(int i = isbns.length - 1; i >= isbns.length-maxRecordCount; i --){
					books.add(getBookByISBN(isbns[i]));
				}
			}else{
//				商品记录数小于4条
				for(int i = isbns.length-1; i >= 0; i --){
					books.add(getBookByISBN(isbns[i]));
				}
			}
			return books;
		}else{
			return null;
		}
		
 	}
}
