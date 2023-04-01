<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Customer List</title>
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
		<link rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../stylelistpage/style.css">
		<script src="../stylelistpage/main.js"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	</head>
	<body>
		<div class="container-xl">
			<div class="table-responsive">
				<div class="table-wrapper">
					<div class="table-title">
						<div class="row">
							<div class="col-sm-6">
								<h2>
									Manage <b>Customer</b>
								</h2>
							</div>
							<div class="col-sm-6">
								<a href="addCustomer" class="btn btn-success"><i
									class="material-icons">&#xE147;</i> <span>Add Customer</span></a>
							</div>
						</div>
					</div>
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>Name</th>
								<th>Date Of Birth</th>
								<th>Mobile No.</th>
								<th>Address</th>
								<th>Gender</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="customer" items="${customerList}">
								<tr>
									<th style = "display: none;">${customer.id}</th>
									<td style="width: 13%;">${customer.firstName} ${customer.lastName }</td>
									<td>${customer.dateOfBirth}</td>
									<td>${customer.mobileNo}</td>
									<td>${customer.address1} ${customer.address2}</td>
									<td>${customer.gender}</td>
									<td><a href="updateCustomer/${customer.id}" class="edit"><i
											class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
										<a href="#deleteEmployeeModal"  class="delete btn1"
										data-toggle="modal"> <i class="material-icons"
											data-toggle="tooltip" title="Delete">&#xE872;</i></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script src="/stylelistpage/list.js"></script>
	</body>
</html>
