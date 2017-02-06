<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/style1.css"/>
<link rel="stylesheet" href="css/header.css"/>
<link rel="stylesheet" href="css/register.css"/>
<title>bankingBazaar.com</title>
</head>
<body>
<jsp:include page="header-div.jsp"></jsp:include>
<div id="login-div" class="container" ng-app="vendorApp" ng-controller="vendorController">
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<div class="container-fluid" id="login-div_">
<div class="row">
<div class="col-md-12" style="height:60px;line-height:60px; font-size:22px; color:white;background-color:rgb(60,60,0); border-top-left-radius: 20px; border-top-right-radius: 20px">
	Vendor Log in
</div>
</div>
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
	<spring:form name="vloginForm" method="post" modelAttribute="bank">
	<br><br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
    	<spring:input path="email" id="email" type="email" class="form-control" name="email" placeholder="Enter email" ng-model="email" ng-required="true" ng-pattern="/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/i"/>
    </div>
    <span ng-show="vloginForm.email.$touched && vloginForm.email.$error.required" style="color:red">Email can not be empty!!</span>
    <span ng-show="vloginForm.email.$dirty && vloginForm.email.$error.pattern" style="color:red">Invalid Email !!</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    	<spring:input path="password" id="password" type="password" class="form-control" name="password" placeholder="Enter password" ng-model="password" ng-required="true"/>
    </div>
    <span ng-show="vloginForm.password.$touched && vloginForm.password.$error.required" style="color:red">Password can not be empty!!</span>
	<br>
	<button class="btn btn-success btn-block">Log in</button>
	<br>
	</spring:form>
</div>
<div class="col-md-1"></div>
</div>
</div>
</div>
</div>
</div>
<br><center><span style="color:red">${requestScope.msg_v}</span></center>
</body>
</html>

<script type="text/javascript" src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/angular.min.js" ></script>
<script tpe="text/javascript" src="js/vlogin_err.js"></script>
