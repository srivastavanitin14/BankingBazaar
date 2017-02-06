var jq = $.noConflict();
var regApp = angular.module('registerApp',[]);

regApp.controller('registerController',function($scope){
	$scope.$watch('(registerForm.name.$touched && registerForm.name.$error.required)||(registerForm.name.$dirty && registerForm.name.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#name").css("borderColor","red");
			}
		else
			{
				jq("#name").css("borderColor","");
			}
	});
	
	$scope.$watch('(registerForm.email.$touched && registerForm.email.$error.required)||(registerForm.email.$dirty && registerForm.email.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#email").css("borderColor","red");
			}
		else
			{
				jq("#email").css("borderColor","");
			}
	});
	
	$scope.$watch('(registerForm.password.$touched && registerForm.password.$error.required)||(registerForm.password.$dirty && registerForm.password.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#password").css("borderColor","red");
			}
		else
			{
				jq("#password").css("borderColor","");
			}
	});
	
	$scope.$watch('(registerForm.cpassword.$touched && registerForm.cpassword.$error.required)||(registerForm.cpassword.$dirty && registerForm.cpassword.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#cpassword").css("borderColor","red");
			}
		else
			{
				jq("#cpassword").css("borderColor","");
			}
	});
	
	$scope.$watch('(registerForm.dob.$touched && registerForm.dob.$error.required)||(registerForm.dob.$dirty && registerForm.dob.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#dob").css("borderColor","red");
			}
		else
			{
				jq("#dob").css("borderColor","");
			}
	});
	
	$scope.$watch('(registerForm.mobileNo.$touched && registerForm.mobileNo.$error.required)||(registerForm.mobileNo.$dirty && registerForm.mobileNo.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#mobileNo").css("borderColor","red");
			}
		else
			{
				jq("#mobileNo").css("borderColor","");
			}
	});
	
	$scope.$watch('registerForm.address.$touched && registerForm.address.$error.required',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#address").css("borderColor","red");
			}
		else
			{
				jq("#address").css("borderColor","");
			}
	});
	
	$scope.$watch('(registerForm.state.$touched && registerForm.state.$error.required)||(registerForm.state.$dirty && registerForm.state.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#state").css("borderColor","red");
			}
		else
			{
				jq("#state").css("borderColor","");
			}
	});
	
	$scope.$watch('(registerForm.city.$touched && registerForm.city.$error.required)||(registerForm.city.$dirty && registerForm.city.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#city").css("borderColor","red");
			}
		else
			{
				jq("#city").css("borderColor","");
			}
	});
	
	$scope.$watch('(registerForm.pincode.$touched && registerForm.pincode.$error.required)||(registerForm.pincode.$dirty && registerForm.pincode.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#pincode").css("borderColor","red");
			}
		else
			{
				jq("#pincode").css("borderColor","");
			}
	});
	
	$scope.$watch('registerForm.tc.$touched && registerForm.tc.$error.required',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#tc").css("borderColor","red");
			}
		else
			{
				jq("#tc").css("borderColor","");
			}
	});
});
