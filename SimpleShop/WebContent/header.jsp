<%-- 下面的语句，解决中文乱码问题 --%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="entity.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>DIAGRAM</title>
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
  <link href="bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="css/style.css" rel="stylesheet"/>
  <link href="css/single.css" rel="stylesheet"/>
  <link href="css/signin-login.css" rel="stylesheet"/>
 	<link href="css/cart-order.css" rel="stylesheet"/>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="logo-big"><span>D&nbsp;I&nbsp;A&nbsp;G&nbsp;R&nbsp;A&nbsp;M</span></div>
		<div class="container-fluid">
		 <div class="row nav-menuare">
			<div class="navbar-header">
				<a class="navbar-brand logo-small" href="#">DIAGRAM</a>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="row navbar-row">
				<div class="nav-divider col-md-3 col-sm-3"><span class="divider"></span></div>
				<div id="navbar"  class="col-md-6 col-sm-6 collapse">
					<ul>
						<li class="li-col"><a href="./index.jsp">SHOPINDEX</a></li>
						<li class="li-col"><a href="#">NEWBOOK</a></li>
						<li class="li-col li-logo"><a href="./index.jsp"><img class="logo-img" src="./img/robot.png"/></a></li>
						<li class="li-col"><a href="./cart.jsp">CART(2)</a></li>
						<li class="dropdown li-col">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								CUSTOMER 
								<b class="caret"></b>
							</a>
							<%
							if(session.getAttribute("user") == null){
							%>
							<ul class="dropdown-menu">
								<li><a href="signin.jsp">注册</a></li>
								<li><a href="login.jsp">登录</a></li>
							</ul>
							<%
							}else{
							%>
							<ul class="dropdown-menu">
								<li><a href="#"><%= ((User)session.getAttribute("user")).getName() %></a></li>
								<li><a href="./orderlist.jsp">我的订单</a></li>
								<li class="divider"></li>
								<li><a href="logout">登出</a></li>
							</ul>
							<%
							}
							%>
						</li>
					</ul>
				</div>
				<div class="nav-divider col-md-3 col-sm-3"><span class="divider"></span></div>
			</div>
			</div>
		</div>
	</nav>