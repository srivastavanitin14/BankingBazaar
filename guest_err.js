var jq = $.noConflict();
var regApp = angular.module('guestApp',[]);

regApp.controller('guestController',function($scope){
	$scope.$watch('(guestForm.email.$touched && guestForm.email.$error.required)||(guestForm.email.$dirty && guestForm.email.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq('#email').css("borderColor",'red');
			}
		else
			{
				jq('#email').css("borderColor",'');
			}
	});
	
	$scope.$watch('(guestForm.mobile.$touched && guestForm.mobile.$error.required)||(guestForm.mobile.$dirty && guestForm.mobile.$error.pattern)',function(newValue,oldValue){
		if(newValue == true)
			{
				jq('#mobile').css("borderColor",'red');
			}
		else
			{
				jq('#mobile').css("borderColor",'');
			}
	});
	
});