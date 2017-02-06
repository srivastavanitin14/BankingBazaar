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
	<spring:form method="post" modelAttribute="bank">
	<tbody>
	<tr>
		<td>Bank Name</td><td>:</td>
		<td>
			<span id="name">${requestScope.bank.name}</span>
			<spring:input path="name" id="iname" style="display:none"/>
		</td>
	</tr>
	<tr>
		<td>Email</td><td>:</td>
		<td>
			<span id="email">${requestScope.bank.email}</span>
			<spring:input path="email" id="iemail" style="display:none"/>
		</td>
	</tr>
	<tr>
		<td>Bank type</td><td>:</td>
		<td>
			<span id="bType">${requestScope.bank.bankType}</span>
			<spring:input path="bankType" id="ibType" style="display:none"/>
		</td>
	</tr>
	<tr>
		<td>Headquarter</td><td>:</td>
		<td>
			<span id="hq">${requestScope.bank.hq}</span>
			<spring:input path="hq" id="ihq" style="display:none"/>
		</td>
	</tr>
	<tr>
		<td>Customer care no.</td><td>:</td>
		<td>
			<span id="ccare">${requestScope.bank.customerCare}</span>
			<spring:input path="customerCare" id="iccare" style="display:none"/>
		</td>
	</tr>
	<tr>
		<td>Website</td><td>:</td>
		<td>
			<span id="website">${requestScope.bank.website}</span>
			<spring:input path="website" id="iwebsite" style="display:none"/>
		</td>
	</tr>
	</tbody>
	</table>
	</div>
	<div class="col-md-4">
	<a href="javascript:void(0);" id="editb">Edit Profile</a>
	<input type="submit" value="Update Profile" id="update" style="display:none">
	</spring:form>
	<br><br>
	<a href="javascript:void(0);" id="chpsw">Change Password</a>
	<form action="bankchangepsw" method="post" id="frmchpsw" style="display:none">
	<table class="table">
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
	<a href="bankprofile">View Rate of Interest for Loans</a>
	</div>
	<div class="col-md-2"></div>
</div>
</div>
<div class="container-fluid" style="margin-top:20px">
<div class="row">
	<div class="col-md-12">
	<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Id</th>
        <th>Loan</th>
        <th>Customer name</th>
        <th>Customer email</th>
        <th>Customer Mobile</th>
        <th>Customer Address</th>
        <th>Loan Amount</th>
        <th>Applied Date</th>
        <th>Duration</th>
        <th>EMI</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    	<!-- <script>
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
    	</script> -->
    	<jstl:forEach items="${requestScope.applicationLoanForms}" var="loanForm">
    		<tr>
    			<td>${loanForm.applicationId}</td>
        		<td>${loanForm.appliedLoan.loanType} Loan</td>
        		<td>${loanForm.user.name}</td>
        		<td>${loanForm.user.email}</td>
        		<td>${loanForm.user.mobileNo}</td>
        		<td>${loanForm.user.address}<br>${loanForm.user.city}, ${loanForm.user.state}<br>Pin: ${loanForm.user.pincode}</td>
        		<td class="amount">Rs. ${loanForm.loanAmount}/-</td>
        		<td>${loanForm.appliedDate}</td>
        		<td>${loanForm.loanDuration} years</td>
        		<td class="emi">Rs. ${loanForm.emi}/-</td>
        		<td><a href="docimageshow?applicationid=${loanForm.applicationId}&docName=idproof" id="">Id Proof</a><br><a href="docimageshow?applicationid=${loanForm.applicationId}&docName=salaryslip" id="">Salary slip</a></td>
        		<td>
        		<span style="font-size: 12px;font-weight: bold">${loanForm.appStatus }</span><br>
        			<%-- <jstl:choose>
        			<jstl:when test="${loanForm.appStatus eq 'Pending'}"> --%>
        				<form action="docsrequired" method="post">
        				<input type="hidden" name="applicationid" value="${loanForm.applicationId}">
        				<input type="submit" value="Latest Document Required">
        				</form>
        				<form action="willcontact" method="post">
        				<input type="hidden" name="applicationid" value="${loanForm.applicationId}">
        				<input type="submit" value="Will Contact...">
        				</form>
        				<form action="reject" method="post">
        				<input type="hidden" name="applicationid" value="${loanForm.applicationId}">
        				<input type="submit" value="Reject">
        				</form>
        			<%-- </jstl:when>
        			<jstl:otherwise><span style="font-size: 12px;font-weight: bold;">${loanForm.appStatus}</span></jstl:otherwise>
        			</jstl:choose> --%>
        		</td>
        	</tr>
        	<!-- <script>
				$(".emi").html("Rs. "+inrCurrency($(".emi").html())+"/-");
				$(".amount").html("Rs. "+inrCurrency($(".amount").html())+"/-");
			</script> -->
        </jstl:forEach>
    </tbody>
    </table>
	</div>
</div>
</div>
</body>
</html>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

 <script type="text/javascript" src="js/bankprofile.js"></script> 