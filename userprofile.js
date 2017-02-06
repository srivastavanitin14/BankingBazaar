$(document).ready(function(){
	
	$("#editp").click(function(){
		$("#name").css("display","none");
		$("#iname").css("display","block");
		
		$("#email").css("display","none");
		$("#iemail").css("display","block");
		
		$("#dob").css("display","none");
		$("#idob").css("display","block");
		
		$("#mobileNo").css("display","none");
		$("#imobileNo").css("display","block");
		
		$("#address").css("display","none");
		$("#iaddress").css("display","block");
		$("#istate").css("display","block");
		$("#icity").css("display","block");
		$("#ipincode").css("display","block");
		
		$("#editp").css("display","none");
		$("#update").css("display","block");
	});
	
	$("#chpsw").click(function(){
		$("#uploaddocs").css("display","block");
		$("#upldfrm").css("display","none");
		$("#frmchpsw").css("display","block");
		$(this).css("display","none");
	});

	$("#uploaddocs").click(function(){
		$("#chpsw").css("display","block");
		$("#frmchpsw").css("display","none");
		$("#upldfrm").css("display","block");
		$(this).css("display","none");
	});
});