$(document).ready(function(){
	
	$("#editb").click(function(){
		$("#name").css("display","none");
		$("#iname").css("display","block");
		
		$("#email").css("display","none");
		$("#iemail").css("display","block");
		
		$("#bType").css("display","none");
		$("#ibType").css("display","block");
		
		$("#hq").css("display","none");
		$("#ihq").css("display","block");
		
		$("#ccare").css("display","none");
		$("#iccare").css("display","block");
		
		$("#website").css("display","none");
		$("#iwebsite").css("display","block");
		
		$("#editb").css("display","none");
		$("#update").css("display","block");
	});
	
	$("#chpsw").click(function(){
		$("#frmchpsw").css("display","block");
		$(this).css("display","none");
	});
	
	$("#hedit").click(function(){
		$("#hroi").css("display","none");
		//$("#hiroi").val($("#hroi").html());
		$("#hiroi").css("display","block");
		$("#hlpf").css("display","none");
		$("#hilpf").val($("#hlpf").html());
		$("#hilpf").css("display","block");
		$("#hsave").css("display","block");
		$(this).css("display","none");
	});
	
	$("#cedit").click(function(){
		$("#croi").css("display","none");
		//$("#ciroi").val($("#croi").html());
		$("#ciroi").css("display","block");
		$("#clpf").css("display","none");
		$("#cilpf").val($("#clpf").html());
		$("#cilpf").css("display","block");
		$("#csave").css("display","block");
		$(this).css("display","none");
	});
	
	$("#eedit").click(function(){
		$("#eroi").css("display","none");
		//$("#eiroi").val($("#eroi").html());
		$("#eiroi").css("display","block");
		$("#elpf").css("display","none");
		$("#eilpf").val($("#elpf").html());
		$("#eilpf").css("display","block");
		$("#esave").css("display","block");
		$(this).css("display","none");
	});
	
	$("#pedit").click(function(){
		$("#proi").css("display","none");
		//$("#piroi").val($("#proi").html());
		$("#piroi").css("display","block");
		$("#plpf").css("display","none");
		$("#pilpf").val($("#plpf").html());
		$("#pilpf").css("display","block");
		$("#psave").css("display","block");
		$(this).css("display","none");
	});
	
	$("#bedit").click(function(){
		$("#broi").css("display","none");
		//$("#biroi").val($("#broi").html());
		$("#biroi").css("display","block");
		$("#blpf").css("display","none");
		$("#bilpf").val($("#blpf").html());
		$("#bilpf").css("display","block");
		$("#bsave").css("display","block");
		$(this).css("display","none");
	});
	
	$("#gedit").click(function(){
		$("#groi").css("display","none");
		//$("#giroi").val($("#groi").html());
		$("#giroi").css("display","block");
		$("#glpf").css("display","none");
		$("#gilpf").val($("#glpf").html());
		$("#gilpf").css("display","block");
		$("#gsave").css("display","block");
		$(this).css("display","none");
	});
	
});