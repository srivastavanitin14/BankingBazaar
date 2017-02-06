var jq = $.noConflict();
var regApp = angular.module('vendorApp',[]);

regApp.controller('vendorController',function($scope){
	$scope.$watch('(vendorForm.name.$touched && vendorForm.name.$error.required)||(vendorForm.name.$dirty && vendorForm.name.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#name").css("borderColor","red");
			}
		else
			{
				jq("#name").css("borderColor","");
			}
	});
	
	$scope.$watch('(vendorForm.email.$touched && vendorForm.email.$error.required)||(vendorForm.email.$dirty && vendorForm.email.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#email").css("borderColor","red");
			}
		else
			{
				jq("#email").css("borderColor","");
			}
	});
	
	$scope.$watch('(vendorForm.password.$touched && vendorForm.password.$error.required)||(vendorForm.password.$dirty && vendorForm.password.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#password").css("borderColor","red");
			}
		else
			{
				jq("#password").css("borderColor","");
			}
	});
	
	$scope.$watch('(vendorForm.cpassword.$touched && vendorForm.cpassword.$error.required)||(vendorForm.cpassword.$dirty && vendorForm.cpassword.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#cpassword").css("borderColor","red");
			}
		else
			{
				jq("#cpassword").css("borderColor","");
			}
	});
	
	$scope.$watch('vendorForm.bankType.$touched && vendorForm.bankType.$error.required',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#bankType").css("borderColor","red");
			}
		else
			{
				jq("#bankType").css("borderColor","");
			}
	});
	
	$scope.$watch('(vendorForm.hq.$touched && vendorForm.hq.$error.required)||(vendorForm.hq.$dirty && vendorForm.hq.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#hq").css("borderColor","red");
			}
		else
			{
				jq("#hq").css("borderColor","");
			}
	});
	
	$scope.$watch('(vendorForm.customerCare.$touched && vendorForm.customerCare.$error.required)||(vendorForm.customerCare.$dirty && vendorForm.customerCare.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#customerCare").css("borderColor","red");
			}
		else
			{
				jq("#customerCare").css("borderColor","");
			}
	});
	
	$scope.$watch('vendorForm.website.$touched && vendorForm.website.$error.required',function(newValue,oldValue){
		if(newValue == true)
			{
				jq("#website").css("borderColor","red");
			}
		else
			{
				jq("#website").css("borderColor","");
			}
	});
	
	$scope.$watch('vendorForm.tc.$touched && vendorForm.tc.$error.required',function(newValue,oldValue){
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
