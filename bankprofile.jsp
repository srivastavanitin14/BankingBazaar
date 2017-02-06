<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/header.css"/>
<link rel="stylesheet" href="css/style1.css"/>
<style>
#hilpf,#cilpf,#eilpf,#pilpf,#bilpf,#gilpf{width:90%;}
</style>
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
	<a href="applicationforloan">View Applications for loan</a>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
	<div class="col-md-12">
	<table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Loan</th>
        <th>Rate of Interest</th>
        <th>Loan Processing Fee</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    	<tr><form action="homeloanDetails" method="post">
    	<td><input type="hidden" name="ltype" value="Home">Home Loan</td>
        <td><span id="hroi">${requestScope.homeLoan.interestRate}% onwards</span><input type="text" value="" id="hiroi" name="hiroi" style="display:none"></td>
        <td><span id="hlpf">${requestScope.homeLoan.loanFee}</span><input type="text" value="" id="hilpf" name="hilpf" style="display:none"></td>
        <td><input type="button" value="Edit" id="hedit"><input type="submit" value="Save" id="hsave" style="display:none"></td>
        </form></tr>
        
        <tr><form action="carloanDetails" method="post">
    	<td><input type="hidden" name="ltype" value="Car">Car Loan</td>
        <td><span id="croi">${requestScope.carLoan.interestRate}% onwards</span><input type="text" value="" id="ciroi" name="ciroi" style="display:none"></td>
        <td><span id="clpf">${requestScope.carLoan.loanFee}</span><input type="text" value="" id="cilpf" name="cilpf" style="display:none"></td>
        <td><input type="button" value="Edit" id="cedit"><input type="submit" value="Save" id="csave" style="display:none"></td>
        </form></tr>
        
        <tr><form action="eduloanDetails" method="post">
    	<td><input type="hidden" name="ltype" value="Education">Education Loan</td>
        <td><span id="eroi">${requestScope.educationLoan.interestRate}% onwards</span><input type="text" value="" id="eiroi" name="eiroi" style="display:none"></td>
        <td><span id="elpf">${requestScope.educationLoan.loanFee}</span><input type="text" value="" id="eilpf" name="eilpf" style="display:none"></td>
        <td><input type="button" value="Edit" id="eedit"><input type="submit" value="Save" id="esave" style="display:none"></td>
        </form></tr>
        
        <tr><form action="prsloanDetails" method="post">
    	<td><input type="hidden" name="ltype" value="Personal">Personal Loan</td>
        <td><span id="proi">${requestScope.personalLoan.interestRate}% onwards</span><input type="text" value="" id="piroi" name="piroi" style="display:none"></td>
        <td><span id="plpf">${requestScope.personalLoan.loanFee}</span><input type="text" value="" id="pilpf" name="pilpf" style="display:none"></td>
        <td><input type="button" value="Edit" id="pedit"><input type="submit" value="Save" id="psave" style="display:none"></td>
        </form></tr>
        
        <tr><form action="bsloanDetails" method="post">
    	<td><input type="hidden" name="ltype" value="Business">Business Loan</td>
        <td><span id="broi">${requestScope.businessLoan.interestRate}% onwards</span><input type="text" value="" id="biroi" name="biroi" style="display:none"></td>
        <td><span id="blpf">${requestScope.businessLoan.loanFee}</span><input type="text" value="" id="bilpf" name="bilpf" style="display:none"></td>
        <td><input type="button" value="Edit" id="bedit"><input type="submit" value="Save" id="bsave" style="display:none"></td>
        </form></tr>
        
        <tr><form action="goldloanDetails" method="post">
    	<td><input type="hidden" name="ltype" value="Gold">Gold Loan</td>
        <td><span id="groi">${requestScope.goldLoan.interestRate}% onwards</span><input type="text" value="" id="giroi" name="giroi" style="display:none"></td>
        <td><span id="glpf">${requestScope.goldLoan.loanFee}</span><input type="text" value="" id="gilpf" name="gilpf" style="display:none"></td>
        <td><input type="button" value="Edit" id="gedit"><input type="submit" value="Save" id="gsave" style="display:none"></td>
        </form></tr>
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