var jq = $.noConflict();

//var regApp = angular.module('emiApp',[]);

//regApp.controller('emiController',function($scope){});


jq(document).ready(
function(){
	//alert("hello");
	
	jq("#loanAmountSlider").slider({
	      value: 500000,
	      min: 10000,
	      max: 10000000,
	      step: 10000,
	      slide: function(event, ui) {
	    	  jq("#loanAmount").val(ui.value);
	    	  jq(".lamount").val(ui.value);
	        emiCalc();
	      }
	    });
	jq("#loanAmount").val(jq("#loanAmountSlider").slider("value"));
	jq(".lamount").val(jq("#loanAmountSlider").slider("value"));
	
	
	    
	jq("#loanAmount").change(function(){
		var value = jq(this).val();
		jq("#loanAmountSlider").slider("value",value);
		jq(".lamount").val(value);
		emiCalc();
	});
	
	
	jq("#durationSlider").slider({
	      value: 3,
	      min: 1,
	      max: 50,
	      step: 1,
	      slide: function(event, ui) {
	    	  jq("#duration").val(ui.value);
	    	  jq(".lduration").val(ui.value);
	        emiCalc();
	      }
	    });
	jq("#duration").val(jq("#durationSlider").slider("value"));
	jq(".lduration").val(jq("#durationSlider").slider("value"));
	    
	jq("#duration").change(function(){
		var value = jq(this).val();
		jq("#durationSlider").slider("value",value);
		jq(".lduration").val(Math.ceil(value).toString());
		emiCalc();
	});
	
	
	jq("#intrsRateSlider").slider({
	      value: 10.00,
	      min: 1,
	      max: 20,
	      step: 0.01,
	      slide: function(event, ui) {
	    	  jq("#intrsRate").val(ui.value);
	    	  jq(".lrate").val(ui.value);
	        emiCalc();
	      }
	    });
	jq("#intrsRate").val(jq("#intrsRateSlider").slider("value"));
	jq(".lrate").val(jq("#intrsRateSlider").slider("value"));
	    
	jq("#intrsRate").keyup(function(){
		var value = jq(this).val();
		jq("#intrsRateSlider").slider("value",value);
		jq(".lrate").val(value);
		emiCalc();
	});
	
	var inrCurrency = function(x){
		//alert(x);
		var lastThree = x.substring(x.length-3);
		var otherNumbers = x.substring(0,x.length-3);
		if(otherNumbers != '')
		    lastThree = ',' + lastThree;
		var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;
		return res;
	};
	
	var emiCalc = function(){
		var amount = parseInt(jq("#loanAmount").val(),10);
		var timeMonths = parseInt(jq("#duration").val(),10)*12;
		var rate = parseFloat(jq("#intrsRate").val());
		
		var monthlyInterestRatio = (rate/100)/12;
		//alert(monthlyInterestRatio);
		var top = Math.pow((1+monthlyInterestRatio),timeMonths);
		//alert(top);
		var bottom = top-1;
		var sp = top/bottom;
		var emi = ((amount*monthlyInterestRatio)*sp);
		//alert(emi);
		/*var x=(Math.round(emi)).toString();
		var lastThree = x.substring(x.length-3);
		var otherNumbers = x.substring(0,x.length-3);
		if(otherNumbers != '')
		    lastThree = ',' + lastThree;
		var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;*/
		var res = inrCurrency((Math.round(emi)).toString());
		jq("#loanAmountSpan").html(inrCurrency(amount.toString()));
		jq("#emispan").html(res);
	};
	
	emiCalc();
});
