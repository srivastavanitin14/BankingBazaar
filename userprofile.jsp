<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/header.css"/>
<link rel="stylesheet" href="css/style1.css"/>
<link rel="stylesheet" href="css/editprofile.css"/>
<title>bankingBazaar.com</title>
</head>
<body>
<jsp:include page="header-div.jsp"></jsp:include>
<br>
<center><span style="color:red">${sessionScope.err}</span></center>
<%session.setAttribute("err", ""); %>
<div class="container" style="margin-top: 40px">
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-6">
	<table class="table table-bordered">
	<spring:form method="post" modelAttribute="user">
	<tbody>
	<tr>
		<td>Name</td><td>:</td>
		<td>
			<span id="name">${requestScope.user.name}</span>
			<spring:input path="name" id="iname" style="display:none"/>
		</td>
	</tr>
	<tr>
		<td>Email</td><td>:</td>
		<td>
			<span id="email">${requestScope.user.email}</span>
			<spring:input path="email" id="iemail" style="display:none"/>
		</td>
	</tr>
	<tr>
		<td>Date of birth</td><td>:</td>
		<td>
			<span id="dob">${requestScope.user.dob}</span>
			<spring:input path="dob" id="idob" style="display:none" value="${requestScope.user.dob}"/>
		</td>
	</tr>
	<tr>
		<td>Mobile</td><td>:</td>
		<td>
			<span id="mobileNo">${requestScope.user.mobileNo}</span>
			<spring:input path="mobileNo" id="imobileNo" style="display:none"/>
		</td>
	</tr>
	<tr>
	<td>Address</td><td>:</td>
	<td>
		<span id="address">${requestScope.user.address}<br>${requestScope.user.city}, ${requestScope.user.state}<br>Pin: ${requestScope.user.pincode}</span>
		<spring:input path="address" id="iaddress" style="display:none"/><br>
		<spring:input path="city" id="icity" style="display:none"/><br>
		<spring:input path="state" id="istate" style="display:none"/><br>
		<spring:input path="pincode" id="ipincode" style="display:none"/>
	</td>
	</tr>
	</tbody>
	
	</table>
	</div>
	<div class="col-md-4">
		<a href="javascript:void(0);" id="editp">Edit Profile</a>
		<input type="submit" value="Update Profile" id="update" style="display:none">
		</spring:form>
	<br>
	<a href="javascript:void(0);" id="chpsw">Change Password</a>
	<form action="userchangepsw" method="post" id="frmchpsw" style="display:none">
	<table class="table">
		<br>
		<tbody>
		<tr>
			<td>Old Password</td><td>:</td><td><input type="password" name="oldpsw"></td> 
		</tr>
		<tr>
			<td>New Password</td><td>:</td><td><input type="password" name="newpsw"></td> 
		</tr>
		<tr>
			<td>Re-enter Password</td><td>:</td><td><input type="password" name="rnewpsw"></td> 
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="Submit"></td> 
		</tr>
		</tbody>
	</table>
	</form>
	<br>
	<a href="javascript:void(0);" id="uploaddocs">Upload Documents</a>
	<form action="uploaddocuments" method="post" enctype="multipart/form-data" id="upldfrm" style="display: none;">
		<table class="table">
		<tbody>
		<tr>
			<td>ID Proof</td><td><input type="file" name="idproof"></td> 
		</tr>
		<tr>
			<td>Salary slip</td><td><input type="file" name="salaryslip"></td> 
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="Upload"></td>
		</tr>
		</tbody>
		</table>
	</form>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
	<jstl:if test="${not empty requestScope.appliedLoans}">
	<div class="col-md-12">
	<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Application Id</th>
        <th>Bank name</th>
        <th>Web site</th>
        <th>Customer care</th>
        <th>Loan type</th>
        <th>Loan Amount</th>
        <th>Applied on Date</th>
        <th>Duration</th>
        <th>EMI</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
    	<jstl:forEach var="applLoan" items="${requestScope.appliedLoans}">
    		<tr>
    			<td>${applLoan.applicationId}</td> 
        		<td>${applLoan.appliedLoan.bank.name}</td>
		        <td>${applLoan.appliedLoan.bank.website}</td>
        		<td>${applLoan.appliedLoan.bank.customerCare}</td>
        		<td>${applLoan.appliedLoan.loanType}</td>
        		<td class=".amount">${applLoan.loanAmount}</td>
        		<td>${applLoan.appliedDate}</td>
        		<td>${applLoan.loanDuration} years</td>
        		<td class=".emi">${applLoan.emi}</td>
        		<td style="font-size: 12px;font-weight: bold;">${applLoan.appStatus}</td>
        	</tr>
    	</jstl:forEach>
    	    </tbody>
    </table>
	</div>
	</jstl:if>
</div>
</div>

</body>
</html>



<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/userprofile.js"></script>
<script>
$(document).ready(function(){
	var inrCurrency = function(x){
		x = Math.round(parseFloat(x)).toString();
		var lastThree = x.substring(x.length-3);
		var otherNumbers = x.substring(0,x.length-3);
		if(otherNumbers != '')
		    lastThree = ',' + lastThree;
		var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;
		return res;
	};
	
	$(".emi").html("Rs. "+inrCurrency($(".emi").html())+"/-");
	$(".amount").html("Rs. "+inrCurrency($(".amount").html())+"/-");
});
</script>