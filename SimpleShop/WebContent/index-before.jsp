<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="entity.Book" %>
<%@ page import="dao.BookDAO" %>
<%@ include file="header.jsp" %>
	<div class="main">
		<div class="container-fluid">
			<div class="row">
			<%-- 通过BookDao获取数据库中的书籍数据 --%>
			<%
				BookDAO bookDao = new BookDAO();
				ArrayList<Book> books = bookDao.getAllBooks();
				if(books != null && books.size() > 0){
					for(Book book:books){
						
			%>
				<div class="book-box col-md-3 col-sm-6">
					<div class="book">
						<a href="single.jsp?isbn=<%= book.getIsbn() %>"><img src="img/<%= book.getImg() %>"/></a>
						<p class="book-name">《<%= book.getName() %>》</p>
						<p class="book-intro"><%= book.getIntro() %></p>
						
						<div class="add-button">
							<span class="cost">￥<%= book.getPrice() %></span> / <span class="cost-original">¥<%= book.getPrice_original() %></span><button>Add To Cart</button>
						</div>
					</div>
				</div>
			<%
					}
				}
			%>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>