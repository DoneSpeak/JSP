<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="entity.Book" %>
<%@ page import="dao.BookDAO" %>
<%@ include file="header.jsp" %>
	<div class="main">
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="addAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-sm">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="myModalLabel">提示</h4>
		            </div>
		            <div class="modal-body" id="addAlert-content">操作错误</div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div>
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
							<span class="cost">￥<%= book.getPrice() %></span> / <span class="cost-original">¥<%= book.getPrice_original() %></span>
							<button class="add-btn" data-book-isbn="<%= book.getIsbn() %>">Add To Cart</button>
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