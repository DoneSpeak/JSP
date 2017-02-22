<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="entity.Book" %>
<%@ page import="dao.BookDAO" %>

<%@ include file="header.jsp" %>
	<div class="main newbook-all">
		<div class="container-fluid">
			<div class="row">
				<%
					BookDAO bookdao = new BookDAO();
					Book book = bookdao.getBookByISBN(request.getParameter("isbn"));
					if(book != null){
				%>
				<div class="col-md-3 col-md-offset-1 col-sm-4 col-sm-offset-1">
					<div class="book-img">
						<img src="img/<%= book.getImg() %>" />
					</div>
				</div>
				<div class="sell col-md-5 col-sm-6">
					<div class="booktext">
						<h3>《<%= book.getName() %>》</h3>
						<div class="divider divider-bookinfo"></div>
						<p><span class="t1">作者:<%= book.getAuthor() %></span><span class="t1">著出版社:<%= book.getPublish_company() %></span><span class="t1">出版时间:<%= book.getPublish_time() %></span><p>
						<p class="newbook-intro">《<%= book.getIntro() %></p>
					</div>
					<div class="snapped-up-btn-area">
						<span class="cost">￥<%= book.getPrice() %></span> / <span class="cost-original">¥<%= book.getPrice_original() %></span><button class="snapup">Add To Cart</button>
					</div>
				</div>
				<%
					}
				%>
				<%
					// 往Cookie中添加当前访问的书籍isbn 
					String isbnStr = "";
					// 从客户端获取Cookie集合
					Cookie[] cookies = request.getCookies();
					if(cookies != null && cookies.length > 0){
						for(Cookie c:cookies){
							if(c.getName().equals("BookViewRecordCookie")){
								isbnStr = c.getValue();
							}
						}
					}
					// 添加当前访问的记录
					isbnStr += request.getParameter("isbn") + ",";
					
					// 记录超过4条时，只去最新4条
					String[] arr = isbnStr.split(",");
					if(arr != null && arr.length > 0){
						if(arr.length >= 4){
							isbnStr = "";
							for(int i=arr.length-1; i >= arr.length-4; i --){
								isbnStr = arr[i] + "," + isbnStr;
							}
						}
					}
					// 创建最新的Cookie
					Cookie cookie = new Cookie("BookViewRecordCookie",isbnStr);
					response.addCookie(cookie);
				%>
				<div class="col-md-2 record">
					<div class="rec-head">浏览记录</div>
					<%
						//利用BookDAO获取浏览记录
						
						ArrayList<Book> booksView = bookdao.getViewList(isbnStr);
					
						if(booksView != null && booksView.size() > 0){
							for(Book b: booksView){
								System.out.println("进入");
								System.out.println("book = " + book);
					%>sh
					<div class="rec-card">
						<a href="single.jsp?isbn=<%= b.getIsbn() %>"><img class="img-rec pull-left" src="img/<%= b.getImg() %>"/></a>
						<div class="pull-left txt-rec"><%= b.getName() %><br />￥<%= b.getPrice() %></div>
					</div>
					<%
							}
						}
					%>
				</div>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>