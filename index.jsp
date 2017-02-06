<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<% if(session.getAttribute("loginType")!=null && session.getAttribute("loginType").toString().equals("Bank")){ %>
<jstl:redirect url="bankprofile"></jstl:redirect>
<%} %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/header.css"/>
<link rel="stylesheet" href="css/style1.css"/>
<link rel="stylesheet" href="css/products.css"/>
<link rel="stylesheet" href="css/responsive.css"/>
<title>bankingBazaar.com</title>
</head>
<body>
<jsp:include page="header-div.jsp"></jsp:include>
<div id="products-div">
<div class="container">
	<div class="row" id="icon-row">
	<div class="col-sm-4"><a href="homeloan"><div class="img-circle" id="d1"></div><br><span id="s1">HOME LOAN</span></a></div>
	<div class="col-sm-4"><a href="educationloan"><div class="img-circle" id="d3"></div><br><span id="s3">EDUCATION LOAN</span></a></div>
	<div class="col-sm-4"><a href="carloan"><div class="img-circle" id="d2"></div><br><span id="s2">CAR LOAN</span></a></div>	
	</div>
	<div class="row" id="icon-row">
	<div class="col-sm-4"><a href="personalloan"><div class="img-circle" id="d4"></div><br><span id="s4">PERSONAL LOAN</span></a></div>
	<div class="col-sm-4"><a href="businessloan"><div class="img-circle" id="d5"></div><br><span id="s5">BUSINESS LOAN</span></a></div>
	<div class="col-sm-4"><a href="goldloan"><div class="img-circle" id="d6"></div><br><span id="s6">GOLD LOAN</span></a></div>	
	</div>
</div>
</div>
</body>
</html>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
