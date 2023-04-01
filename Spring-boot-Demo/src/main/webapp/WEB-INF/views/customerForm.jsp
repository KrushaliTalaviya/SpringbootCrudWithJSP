<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Customer Form</title>
	<!-- Font Icon -->
	<link rel="stylesheet" href="/fonts/material-icon/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="/vendor/jquery-ui/jquery-ui.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- Main css -->
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/styleNew.css">
	</head>
	<body>
		<div class="main">
			<section class="signup">
				<div class="container">
					<div class="signup-content">
						<label class="label">
							<c:choose>
								<c:when test="${customer.id>0}">Edit Customer</c:when>
								<c:otherwise>Add Customer </c:otherwise>
							</c:choose> 
							<a href="/customer/customerList"><i class="fa-solid fa-users"></i></a>
						</label>
						<form:form name="form" id="signup-form" class="signup-form" method="POST"  action="/customer/saveCustomer" modelAttribute="customer">
							<div class="form-wrapper"> 
								<form:hidden path = "id"  />
							</div>
							<div class="form-row">
								<div class="form-group">
									<label for="first_name">First name</label>
									<form:input path = "firstName" type="text" class="form-input" name="firstName" id="first_name" />
								</div>
								<div class="form-group">
									<label for="last_name">Last name</label>
									<form:input path = "lastName" type="text" class="form-input" name="lastName" id="last_name" />
								</div>
							</div>
							<div class="form-row">
								<div class="form-group">
									<label for="email">Email</label>
									<form:input path = "email" type="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-input" name="email" id="email" />
								</div>
								<div class="form-group">
									<label for="age">Age</label>
									<form:input path = "age" type="number" class="form-input" name="age" id="age" />
								</div>
							</div>
							<div class="form-row">
								<div class="form-group">
									<label>Birth date</label>
									<form:input path="dateOfBirth" type="date" id="datefield" name="dateOfBirth" placeholder="DD/MM/YYYY" min="2021-01-01" />
								</div>
								<div class="form-radio">
									<label for="gender">Gender</label>
									<div class="form-flex">
									<c:choose>
											<c:when test = "${customer.id>0}">
												<c:if  test = "${customer.gender == 'male'}"> 
													<input type="radio" path ="gender" name="gender" value="1" id="male" checked="checked" /> 
													<label for="male">Male</label> 
													<input type="radio" path ="gender" name="gender" value="2" id="female" /> 
													<label for="female">Female</label>
												</c:if>
												<c:if test = "${customer.gender == 'female'}">
													<input type="radio" path ="gender" name="gender" value="1" id="male"  /> 
													<label for="male">Male</label> 
													<input type="radio" path ="gender" name="gender" value="2" id="female" checked="checked" /> 
													<label for="female">Female</label>
												</c:if>
											</c:when>
											<c:otherwise>
												<input type="radio" path ="gender" name="gender" value="1" id="male" checked="checked" /> 
												<label for="male">Male</label> 
												<input type="radio" path ="gender" name="gender" value="2" id="female" /> 
												<label for="female">Female</label>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="phone_number">Phone number</label>
								<form:input path =  "mobileNo" type="number" class="form-input" name="mobileNo" id="phone_number" />
							</div>
							<div class="form-group">
								<label for="inputAddressLine1" class="col-sm-2 control-label">Address Line 1</label>
								<div class="col-sm-10">
									<form:input path = "address1" type="text" class="form-control" id="inputAddressLine1"
										name="address1" placeholder="Street address, P.O. box, company name, c/o" />
								</div>
							</div>
							<div class="form-text">
								<a class="add-info-link">
									<i class="zmdi zmdi-chevron-right"></i>Additional info
								</a>
								<div class="form-group">
									<label for="inputAddressLine2" class="col-sm-2 control-label">Address
										Line 2</label>
									<div class="col-sm-10">
										<form:input path = "address2" type="text" class="form-control" id="inputAddressLine2"
											name="address2"
											placeholder="Apartment, suite , unit, building, floor, etc." />
									</div>
								</div>
							</div>
							<div class="form-text">
								<div class="form-group">
										<input type="submit" name="submit" id="submit" class="form-submit" value="Submit" />
								</div>
								<div class="form-group">
									<input type="reset" name="reset" id="reset" class="form-submit"
										value="Reset" />
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</section>
		</div>
		<!-- JS -->
		<script src="/vendor/jquery/jquery.min.js"></script>
		<script src="/vendor/jquery-ui/jquery-ui.min.js"></script>
		<script src="/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="/vendor/jquery-validation/dist/additional-methods.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
    		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
		<script src="/js/main.js"></script>
	</body>
</html>
