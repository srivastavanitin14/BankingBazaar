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
<style>
#confiramtiondiv{width:40%;text-align: center;}
</style>
<title>bankingBazaar.com</title>
</head>
<body>
<jsp:include page="header-div.jsp"></jsp:include>
<br>
<div id="confiramtiondiv" style="margin: 0 auto;">
<h2>Loan Application was Successful!</h2>
<br>
<table class="table table-bordered" style="font-size: 16px;">
<tr>
<td>Application Id</td><td>:</td><td>${requestScope.application.applicationId}</td>
</tr>
<tr>
<td>Loan type</td><td>:</td><td>${requestScope.application.appliedLoan.loanType} Loan</td>
</tr> 
<tr>
<td>Bank name</td><td>:</td><td>${requestScope.application.appliedLoan.bank.name}</td>
</tr>
<tr>
<td>Loan amount</td><td>:</td><td id="amount">${requestScope.application.loanAmount}</td>
</tr>
<tr>
<td>Duration</td><td>:</td><td>${requestScope.application.loanDuration} years</td>
</tr>
<tr>
<td>EMI</td><td>:</td><td id="emi">${requestScope.application.emi}</td>
</tr>
</table>
</div>
</body>
</html>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	var inrCurrency = function(x){
		//alert(x);
		x = Math.round(parseFloat(x)).toString();
		var lastThree = x.substring(x.length-3);
		var otherNumbers = x.substring(0,x.length-3);
		if(otherNumbers != '')
		    lastThree = ',' + lastThree;
		var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;
		return res;
	};
	
	$("#emi").html("Rs. "+inrCurrency($("#emi").html())+"/-");
	$("#amount").html("Rs. "+inrCurrency($("#amount").html())+"/-");
});
</script>