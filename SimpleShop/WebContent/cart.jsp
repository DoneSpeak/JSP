<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.CartDAO" %>
<%@ page import="entity.*" %>
<%@ include file="header.jsp" %>
	<div class="main main-white">
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="deleteAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-sm">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title" id="myModalLabel">提示</h4>
		            </div>
		            <div class="modal-body" id="deleteAlert-content">操作错误</div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		            </div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<%
						User user = (User)session.getAttribute("user");
         		if(user == null){
         			// 未登录
         	%>
         	<div class="withoutlogin-area">
	          <p>您尚未登录，登录后将显示您购物车中商品</p>
	        </div>
         	<%
         		}else{
          %>
          <div class="table-responsive table-shadow">
	          <table class="table table-striped">
            	<thead>
                <tr>
                  <th></th>
                  <th>商品名</th>
                  <th>单价(元)</th>
                 	<th>数量</th>
                  <th>金额</th>
                  <th>操作</th>
                </tr>
            	</thead>
            	<tbody>
            	<%
            		String uid = user.getUid();
            		CartDAO cartdao = new CartDAO();
            		Cart cart = cartdao.getCart(uid);
            		
            		HashMap<Book,Integer> books = cart.getBooks();
			         	Set<Book> bookSet = books.keySet();
			        	Iterator<Book> it = bookSet.iterator();
			         	while(it.hasNext())
			         	{
			            Book book = it.next();
			            double cost = cart.getOneTypeBookCostInCart(book);
            	%>
                <tr>
                  <td><input type="checkbox" /></td>
                 	<td>《<%= book.getName() %>》</td>
                  <td><%= String.format("%.2f",book.getPrice()) %></td>
                  <td><%=books.get(book) %></td>
                  <td><%= String.format("%.2f",cost)%></td>
                  <td><a href="javascript:void(0)" class="delete" data-cost="<%= cost %>" data-book-isbn="<%=book.getIsbn() %>">删除</a></td>
                </tr>
			    <%
			         	}
			    %>
	            </tbody>
		        </table>
			    </div>
			    <div class="divider divider-light"></div>
			    <div class="amount">
					<div class="tag-left">
						<input class="allchose" type="checkbox" />全选
					</div>
					<div class="tag-right">
			    		总计:￥<span class="amount-cost"><%= String.format("%.2f",cart.getTotalCost()) %></span><button type="submit" class="btn">提交订单</button>
			    	</div>
			    </div>
			    <%
         		}
			    %>
				</div>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>