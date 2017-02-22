<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
	<div class="main main-white">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4">
					<div class="signin-div">
					<%
						if(session.getAttribute("user") != null){
						//	用户已经登录，此时不能再注册
							response.sendRedirect(request.getContextPath() + "/index.jsp");
						}
					
						if(request.getAttribute("error") != null){
					%>
						<div class="alert-div">
						    <a href="javascript:void(0)" class="close">
						        &times;
						    </a>
						    <strong>警告！</strong><span class="tips-text"><%= request.getAttribute("error") %></span>
						</div>
					<%

						}
					%>
						<form class="signin-form" role="form" action="login" method="post">
							<span class="tosignin">Don't have a account? <a href="./signin.jsp">sign in</a></span>
							<hr />
							<div class="form-group">
								<label for="username">USERNAME</label>
								<input type="text" class="form-control" name="name" placeholder="enter name" />
							</div>
							<div class="form-group">
								<label for="password">PASSWORD</label>
								<input type="password" class="form-control" name="password" placeholder="enter password" />
							</div>
							<button type="submit" class="btn btn-default">LOGIN</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>