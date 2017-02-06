var jq = $.noConflict();
var regApp = angular.module('loginApp',[]);

regApp.controller('loginController',function($scope){
	$scope.$watch('(loginForm.email.$touched && loginForm.email.$error.required)||(loginForm.email.$dirty && loginForm.email.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq('#email').css("borderColor",'red');
			}
		else
			{
				jq('#email').css("borderColor",'');
			}
	});
	
	$scope.$watch('loginForm.password.$touched && loginForm.password.$error.required',function(newValue,oldValue){
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