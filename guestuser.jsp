<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/header.css"/>
<link rel="stylesheet" href="css/style1.css"/>
<link rel="stylesheet" href="css/register.css"/>
<title>bankingBazaar.com</title>
</head>
<body>
<jsp:include page="header-div.jsp"></jsp:include>
<div id="login-div" class="container" ng-app="guestApp" ng-controller="guestController">
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<div class="container-fluid" id="login-div_">
<div class="row">
<div class="col-md-12" style="height:60px;line-height:60px; font-size:22px; color:white;background-color:rgb(60,60,0); border-top-left-radius: 20px; border-top-right-radius: 20px">
	Guest User
</div>
</div>
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
	<form name="guestForm" action="guestuser" method="post">
	<br><br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
    	<input id="email" type="email" class="form-control" name="email" placeholder="Enter email" ng-model="email" ng-required="true" ng-pattern="/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/i">
    </div>
    <span ng-show="guestForm.email.$touched && guestForm.email.$error.required" style="color:red">Email can not be empty!!</span>
    <span ng-show="guestForm.email.$dirty && guestForm.email.$error.pattern" style="color:red">Invalid Email !!</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    	<input id="mobile" type="text" class="form-control" name="mobile" placeholder="Enter mobile no." ng-model="mobile" ng-required="true" ng-pattern="/^[0-9]{10}$/i">
    </div>
    <span ng-show="guestForm.mobile.$touched && guestForm.mobile.$error.required" style="color:red">Mobile no. required!!</span>
    <span ng-show="guestForm.mobile.$dirty && guestForm.mobile.$error.pattern" style="color:red">Invalid Mobile no.!!</span>
	<br>
	<button class="btn btn-success btn-block">Continue</button>
	<br><br>
	</form>
</div>
<div class="col-md-1"></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

<script type="text/javascript" src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/angular.min.js" ></script>
<script tpe="text/javascript" src="js/guest_err.js"></script>
