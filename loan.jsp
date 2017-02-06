<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/header.css"/>
<link rel="stylesheet" href="css/style1.css"/>
<link rel="stylesheet" href="css/emicss.css"/>
<link rel="stylesheet" href="css/jquery-ui.css"/>
<!-- <link rel="stylesheet" href="css/font-awesome.min.css"/> -->
<title>bankingBazaar.com</title>
</head>
<body> <!-- ng-app="emiApp" ng-Controller="emiController" -->
<jsp:include page="header-div.jsp"></jsp:include>
<br>
<center><span style="color:red">${sessionScope.err}</span></center>
<%session.setAttribute("err", ""); %>
<div class="container" style="margin-top:30px;">
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">
	<div class="container-fluid" style="border:1px solid rgb(60,60,0);border-top-left-radius: 20px;border-top-right-radius: 20px;">
	<div class="row">
		<div class="col-sm-12" id="emidiv">
		EMI Calculator for ${sessionScope.loantype} Loan
		</div>
	</div>
	<div class="row">
		<div class="col-sm-7">
			<br>
			<div class="input-group"> 
    			<span class="input-group-addon">Loan Amount : <!-- <i class="fa fa-inr"></i> --></span>
    			<!-- <span class="input-group-addon">Rs.</span> -->
    			<input id="loanAmount" type="number" min="10000" class="form-control" name="loanAmount" required>
			</div>
			<br>		
		</div>
		<div class="col-sm-5" align="center" style="font-size:18px">
			<br>
			Rs. <span id="loanAmountSpan"></span>/-
			<br>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div id="loanAmountSlider"></div>
			<br>
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-sm-7">
			<br>
			<div class="input-group"> 
    			<span class="input-group-addon">Duration : <!-- <i class="fa fa-calendar-plus-o"></i> --></span>
    			<input id="duration" type="number" class="form-control" name="duration" required>
    			<span class="input-group-addon">Years</span>
			</div>
			<br>		
		</div>
		<div class="col-sm-5"></div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div id="durationSlider"></div>
			<br>
		</div>
	</div>
	
	
	<div class="row">
		<!-- <div class="col-sm-3" align="right" >Rate of Interest:</div> -->
		<div class="col-sm-7">
			<br>
			<div class="input-group"> 
				<span class="input-group-addon">Rate of Interest :<!-- <i class="fa fa-calculator"></i> --></span>
    			<input id="intrsRate" type="text" class="form-control" name="intrsRate" required>
    			<span class="input-group-addon">%<!-- <i class="fa fa-calculator"></i> --></span>
			</div>
			<br>		
		</div>
		<div class="col-sm-5"></div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div id="intrsRateSlider"></div>
			<br>
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-sm-12">
			<br>
				<div style="font-size:24px">EMI : <b>Rs. <span id="emispan"></span>/-</b></div> 
			<br>
		</div>
	</div>
	
	</div>
</div>
<div class="col-sm-2"></div>
</div>
<div class="row">
	<!-- <div class="col-sm-1"></div> -->
	<div class="col-sm-12">
	<br><br>
	<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Bank Name</th>
        <th>Rate of Interest</th>
        <th>Loan Processing Fee</th>
        <th>Web site</th>
        <th>Customer care</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    	<jstl:forEach items="${requestScope.bankList}" var="bankLoanData">
      	<form action="applyforloan" method="post" enctype="multipart/form-data">
     	<tr>
        	<td><%-- <input type="hidden" name="lbank" value="${bankLoanData.bank.name}"> --%>${bankLoanData.bank.name}</td>
        	<td><input type="hidden" name="lroi" value="${bankLoanData.interestRate}">${bankLoanData.interestRate}%</td>
        	<td><input type="hidden" name="llpf" value="${bankLoanData.loanFee}">${bankLoanData.loanFee}</td>
        	<td>${bankLoanData.bank.website}</td>
        	<td>${bankLoanData.bank.customerCare}</td>
        	<td>
      			<input type="hidden" name="lamount" class="lamount" value="0">
       			<input type="hidden" name="lduration" class="lduration" value="0">
       			<input type="hidden" name="lrate" class="lrate" value="0">
       			<input type="hidden" name="loanid" value="${bankLoanData.loanId}">
       			
       			<input type="submit" value="Apply">  	
        	</td>
      	</tr>
      	</form>
      	</jstl:forEach>
    </tbody>
  </table>
	</div>
	<!-- <div class="col-sm-1"></div> -->
</div>
</div>
<br><br>

</body>
</html>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/emi_slider.js"></script>
<!-- <script type="text/javascript" src="js/emi_err.js"></script>
<script type="text/javascript" src="js/angular.min.js" ></script> -->