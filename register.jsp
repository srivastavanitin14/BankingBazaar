<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/style1.css"/>
<link rel="stylesheet" href="css/header.css"/>
<link rel="stylesheet" href="css/register.css"/>
<!-- <link rel="stylesheet" href="css/jquery-ui-1-12-1.css" /> -->
<title>bankingBazaar.com</title>
</head>
<body>
<jsp:include page="header-div.jsp"></jsp:include>
<div id="register-div" class="container" ng-app="registerApp" ng-controller="registerController">
<spring:form name="registerForm" method="post" modelAttribute="user">
<div class="row">
<div class="col-md-12" style="height:60px;line-height:60px; font-size:22px; color:white;background-color:rgb(60,60,0); border-top-left-radius: 20px; border-top-right-radius: 20px">
	User Registration
</div>
</div>
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-4">
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
    	<spring:input path="name" id="name" type="text" class="form-control" name="name" placeholder="Enter name" ng-model="name" ng-pattern="/^[a-z A-Z]+$/i" ng-required="true"/>
    </div>
    <span ng-show="registerForm.name.$touched && registerForm.name.$error.required" class="error" style="color:red">Please enter a valid name.</span>
    <span ng-show="registerForm.name.$dirty && registerForm.name.$error.pattern" class="error" style="color:red">Please enter a valid name.</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
    	<spring:input path="email" id="email" type="email" class="form-control" name="email" placeholder="Enter email" ng-required="true" ng-model="email" ng-pattern="/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/i"/>
    </div>
    <span ng-show="registerForm.email.$touched && registerForm.email.$error.required" class="error" style="color:red">Please enter your Email Address.</span>
    <span ng-show="registerForm.email.$dirty && registerForm.email.$error.pattern" class="error" style="color:red">Invalid Email Address</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    	<spring:input path="password" id="password" type="password" class="form-control" name="password" placeholder="Enter password" ng-model="password" ng-required="true" ng-pattern="/^[a-zA-Z0-9_#$@%^&*!]{6,}$/i"/>
    </div>
    <span ng-show="registerForm.password.$touched && registerForm.password.$error.required" class="error" style="color:red">Password can not be empty.</span>
    <span ng-show="registerForm.password.$dirty && registerForm.password.$error.pattern" class="error" style="color:red">Invalid Password.Atleast 6 characters required.</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
    	<input id="cpassword" type="password" class="form-control" name="cpassword" placeholder="Re-enter password" ng-model="cpassword" ng-required="true" ng-pattern="{{registerForm.password.$viewValue}}">	
    </div>
    <span ng-show="registerForm.cpassword.$touched && registerForm.cpassword.$error.required" class="error" style="color:red">Please Re-Enter your password.</span>
	<span ng-show="registerForm.cpassword.$dirty && registerForm.cpassword.$error.pattern" class="error" style="color:red">Password does not match.</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
    	<input id="dob" type="text" class="form-control" name="dob" placeholder="Date of birth (dd/mm/yyyy)" ng-model="dob" ng-required="true" ng-pattern="/^[0-9]{2}/[0-9]{2}/[0-9]{4}$/i"/>
    </div>
    <span ng-show="registerForm.dob.$touched && registerForm.dob.$error.required" class="error" style="color:red">Please Enter your Date of Birth</span>
    <span ng-show="registerForm.dob.$dirty && registerForm.dob.$error.pattern" class="error" style="color:red">Date of birth must be in the DD/MM/YYYY Format</span>
	<br>
</div>
<div class="col-md-2"></div>
<div class="col-md-4">
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
    	<spring:input path="mobileNo" id="mobileNo" type="text" class="form-control" name="mobileNo" placeholder="Mobile no." ng-model="mobileNo" ng-required="true" ng-pattern="/^[0-9]{10}$/i"/>
    </div>
    <span ng-show="registerForm.mobileNo.$touched && registerForm.mobileNo.$error.required" class="error" style="color:red">Please Enter your Mobile Phone number.</span>
    <span ng-show="registerForm.mobileNo.$dirty && registerForm.mobileNo.$error.pattern" class="error" style="color:red">Invalid Mobile Number.</span>
    <br>
    <div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
    	<spring:input path="address" id="address" type="text" class="form-control" name="address" placeholder="Address" ng-model="address" ng-required="true"/>
    </div>
    <span ng-show="registerForm.address.$touched && registerForm.address.$error.required" class="error" style="color:red">Please Enter your Address.</span>
    <br>
    <div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
    	<spring:input path="state" type="text" id="state" class="form-control" name="state" placeholder="Enter state" ng-model="state" ng-required="true" ng-pattern="/^[a-z A-Z]+$/i"/>
    </div>
    <span ng-show="registerForm.state.$touched && registerForm.state.$error.required" class="error" style="color:red">Please Enter the state of Residence.</span>
    <span ng-show="registerForm.state.$dirty && registerForm.state.$error.pattern" class="error" style="color:red">Please enter the correct State.</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
    	<spring:input path="city" type="text" id="city" class="form-control" name="city" placeholder="Enter city" ng-model="city" ng-required="true" ng-pattern="/^[a-zA-Z]+$/i"/>
    </div>
    <span ng-show="registerForm.city.$touched && registerForm.city.$error.required" class="error" style="color:red">Please Enter city of Residence.</span>
    <span ng-show="registerForm.city.$dirty && registerForm.city.$error.pattern" class="error" style="color:red">Please enter the correct City.</span>
	<br>
	<div class="input-group">
    	<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
    	<spring:input path="pincode" type="text" id="pincode" class="form-control" name="pincode" placeholder="Enter pin-code" ng-model="pincode" ng-required="true" ng-pattern="/^[0-9]{6}$/i"/>
    </div>
    <span ng-show="registerForm.pincode.$touched && registerForm.pincode.$error.required" class="error" style="color:red">Please Enter the PinCode of your Residence.</span>
    <span ng-show="registerForm.pincode.$dirty && registerForm.pincode.$error.pattern" class="error" style="color:red">Please enter the correct PinCode.</span>
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
	<span ng-show="registerForm.tc.$touched && registerForm.tc.$error.required" style="color:red">Term & Condition have to be Accepted.</span>
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
<!-- <script type="text/javascript" src="js/jquery-ui-1-12-1.min.js" ></script> -->
<script type="text/javascript" src="js/register.js" ></script>
<script type="text/javascript" src="js/angular.min.js" ></script>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script tpe="text/javascript" src="js/register_err.js"></script>