$(document).ready (function () {  
	$('#signup-form').validate ({
		rules : {
			firstName : {
				required : true,
				minlength : 3,
				maxlength : 12
			},
			lastName : {
				required : true,
				minlength : 3,
				maxlength : 12
			},
			mobileNo : {
				required : true,
				minlength : 10,
				maxlength : 12,
				remote : {
					url : '/customer/checkMobile',
					type : 'GET',
					data : {id:$ ("#id").val(), mobileNo: $("#phone_no").val()},
				}
			},
			email : {
				required : true,
				minlength : 3,
				maxlength : 70,
				remote : {
					url :'/customer/checkEmail',
					type :'GET',
					dataType : 'html',
					data : {email : 	function() {
										return $('input[name=email]').val();
									}, id: $("#id").val()},
				}
			},
			age : {
				required : true,
				min : 18,
				max : 100
			},
			dateOfBirth : {
				required : true,
			},
			address1 : {
				required : true,
				minlength : 10,
				maxlength : 50
			}
		},
		messages : {
			firstName : {
				required : "Please enter the First name!",
				minlength : "Your username must consist of at least 3 characters"
				},
			lastName : {
				required : "Please enter the Last name!"
			},
			email : {
				required : "Please enter a valid email",
			},
			mobileNo : {
				required : "Please enter phone number",
				minlength : "Number must be at least 10 digit long",
				remote : "Mobile number is already exists"
			},
			dateOfBirth : {
				required : "Please select your birthdate",
			},
			age : {
				required : "Please enter your age in digit"
			},
			address1 : {
				required : "Please enter your address"
			}
		},
	});
});