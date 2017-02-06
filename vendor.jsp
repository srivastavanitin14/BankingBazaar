<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/style1.css"/>
<link rel="stylesheet" href="css/header.css"/>
<link rel="stylesheet" href="css/register.css"/>
<link rel="stylesheet" href="css/jquery-ui-1-12-1.css" />
<title>bankingBazaar.com</title>
</head>
<body>
<jsp:include page="header-div.jsp"></jsp:include>
<div id="register-div" class="container" ng-app="vendorApp"  ng-controller="vendorController">
<spring:form name="vendorForm" method="post" modelAttribute="bank">
<div class="row">
<div class="col-md-12" style="height:60px;line-height:60px; font-size:22px; color:white;background-color:rgb(60,60,0); border-top-left-radius: 20px; border-top-right-radius: 20px">
	Bank Registration
</div>
</div>
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-4">
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    	<spring:input path="name" id="name" type="text" class="form-control" name="name" placeholder="Enter Bank name" ng-model="name" ng-pattern="/^[a-z A-Z]+$/i" ng-required="true"/>
    </div>
    <span ng-show="vendorForm.name.$touched && vendorForm.name.$error.required" class="error" style="color:red">Please enter the name of the Institution.</span>
    <span ng-show="vendorForm.name.$dirty && vendorForm.name.$error.pattern" class="error" style="color:red">Invalid Name.</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
    	<spring:input path="email" id="email" type="email" class="form-control" name="email" placeholder="Enter Bank email" ng-required="true" ng-model="email" ng-pattern="/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/i"/>
    </div>
    <span ng-show="vendorForm.email.$touched && vendorForm.email.$error.required" class="error" style="color:red">Please enter contact email.</span>
    <span ng-show="vendorForm.email.$dirty && vendorForm.email.$error.pattern" class="error" style="color:red">Email format invalid.</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    	<input id="password" type="password" class="form-control" name="password" placeholder="Enter password" ng-model="password" ng-required="true" ng-pattern="/^[a-zA-Z0-9_#$@%^&*!]{6,}$/i">
    </div>
    <span ng-show="vendorForm.password.$touched && vendorForm.password.$error.required" class="error" style="color:red">Please enter a password.</span>
    <span ng-show="vendorForm.password.$dirty && vendorForm.password.$error.pattern" class="error" style="color:red">Password must have 6 characters minimum.</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    	<input id="cpassword" type="password" class="form-control" name="cpassword" placeholder="Re-enter password" ng-model="cpassword" ng-required="true" ng-pattern="{{vendorForm.password.$viewValue}}">	
    </div>
    <span ng-show="vendorForm.cpassword.$touched && vendorForm.cpassword.$error.required" class="error" style="color:red">Please enter the password again.</span>
	<span ng-show="vendorForm.cpassword.$dirty && vendorForm.cpassword.$error.pattern" class="error" style="color:red">Passwords must be identical.</span>
	<br>
</div>
<div class="col-md-2"></div>
<div class="col-md-4">
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-flag"></i></span>
    	<spring:select path="bankType" id="bankType" type="text" class="form-control" name="bankType" ng-model="dob" ng-required="true">
    	<option value="">--Select bank type--</option>
    	<option>Public Sector Bank</option>
    	<option>Private Sector Bank</option> 
    	</spring:select>
    </div>
    <span ng-show="vendorForm.bankType.$touched && vendorForm.bankType.$error.required" class="error" style="color:red">Select a bank type!!</span>
    <br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
    	<spring:input path="hq" id="hq" type="text" class="form-control" name="hq" placeholder="Enter Headquarter" ng-model="hq" ng-required="true" ng-pattern="/^[a-zA-Z ]+$/i"/>
    </div>
    <span ng-show="vendorForm.hq.$touched && vendorForm.hq.$error.required" class="error" style="color:red">Please enter Headquarters Location.</span>
    <span ng-show="vendorForm.hq.$dirty && vendorForm.hq.$error.pattern" class="error" style="color:red">Invalid name.</span>
    <br>
    <div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
    	<spring:input path="customerCare" id="customerCare" type="text" class="form-control" name="customerCare" placeholder="Enter customer care no." ng-model="customerCare" ng-required="true" ng-pattern="/^[0-9]{10}$/i"/> 
    </div>
    <span ng-show="vendorForm.customerCare.$touched && vendorForm.customerCare.$error.required" class="error" style="color:red">Please enter customer care number.</span>
    <span ng-show="vendorForm.customerCare.$dirty && vendorForm.customerCare.$error.pattern" class="error" style="color:red">Customer care number invalid.</span>
    <br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-link"></i></span>
    	<spring:input path="website" type="text" id="website" class="form-control" name="website" ng-model="website" placeholder="Enter website name" ng-required="true"/>
    </div>
    <span ng-show="vendorForm.website.$touched && vendorForm.website.$error.required" class="error" style="color:red">Please enter the bank website.</span>
	<br>
</div>
<div class="col-md-1"></div>
</div>
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-4">
	<div class="checkbox">
  		<label><input type="checkbox" value="tc" id="tc" name="tc" ng-model="tc" ng-required="true">I accept Terms and Conditions</label>
	</div>
	<span ng-show="vendorForm.tc.$touched && vendorForm.tc.$error.required" style="color:red">Term & Condition have to be Accepted!!</span>
	<br>
</div>
<div class="col-md-2"></div>
<div class="col-md-4">
	<button class="btn btn-success btn-block">Submit</button>
	<br>
</div>
<div class="col-md-1"></div>
</div>
</spring:form>
 </div>
 <br>
 <center><span style="color:red">${requestScope.msg}</span></center>
</body>
</html>

<script type="text/javascript" src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1-12-1.min.js" ></script>
<script type="text/javascript" src="js/register.js" ></script>
<script type="text/javascript" src="js/angular.min.js" ></script>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script tpe="text/javascript" src="js/vendor_err.js"></script>