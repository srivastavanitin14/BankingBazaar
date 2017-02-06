var jq = $.noConflict();
var regApp = angular.module('vendorApp',[]);

regApp.controller('vendorController',function($scope){
	$scope.$watch('(vloginForm.email.$touched && vloginForm.email.$error.required)||(vloginForm.email.$dirty && vloginForm.email.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq('#email').css("borderColor",'red');
			}
		else
			{
				jq('#email').css("borderColor",'');
			}
	});
	
	$scope.$watch('vloginForm.password.$touched && vloginForm.password.$error.required',function(newValue,oldValue){
		if(newValue == true)
			{
				jq('#password').css("borderColor",'red');
			}
		else
			{
				jq('#password').css("borderColor",'');
			}
	});
});