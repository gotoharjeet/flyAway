
<%-- <%
if (request.getSession().getAttribute("customerId") == null || request.getSession().getAttribute("flightobject") == null
		|| request.getSession().getAttribute("fareobject") == null) {
	response.sendRedirect("index.jsp");
} else if (request.getSession().getAttribute("customerId") != null
		&& request.getSession().getAttribute("flightobject") != null
		&& request.getSession().getAttribute("fareobject") != null) {
%>
 --%>
<%@page import="com.flyaway.model.Reservation"%>
<%@page import="com.flyaway.model.Customer"%>
<%@page import="com.flyaway.model.Airport"%>
<%@page import="com.flyaway.dao.CustomerDAO"%>
<%@page import="com.flyaway.model.Fare"%>
<%@page import="com.flyaway.model.Flight"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
	rel="stylesheet">
<link rel="icon" href="images/header-logo.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">

<title>Fly Away</title>

</head>
<body>

	<%-- <%
	Flight flight = (Flight) session.getAttribute("flightobject");
	Fare fare = (Fare) session.getAttribute("fareobject");
	String travelDate = (String) session.getAttribute("traveldate");
	int passengers = (int) session.getAttribute("passengers");
	String day = (String) session.getAttribute("day");
	int customerId = (int) session.getAttribute("customerId");
	int bookingId = (int) session.getAttribute("bookingId");
	CustomerDAO cust = new CustomerDAO();
	Airport srcAirport = cust.getAirportObject(flight.getSource());
	Airport destAirport = cust.getAirportObject(flight.getDestination());
	Customer customer = cust.getCustomer(customerId);
	Reservation reservation = cust.getReservation(bookingId);
	String cardName = (String) session.getAttribute("cardname");
	String cardNo = (String) session.getAttribute("cardno");
	String paymentDate = (String) session.getAttribute("paymentdate");
	%>

 --%>
	<!-- header -->
	<header class="d-flex align-items-center">
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
			<!-- <a class="navbar-brand" href="customerdetails.jsp"><i
				class="fas fa-plane pr-2 fa-2x text-primary"></i></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button> -->

			<div class="collapse navbar-collapse " id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="customerdetails.jsp"
						class="nav-link">Customer Details</a></li>
					<li class="nav-item"><a href="changepassword.jsp"
						class="nav-link">Change Password</a></li>
					<li class="nav-item"><a
						class="text-uppercase text-center p-1 nav-link" href="Logout"><i
							class="fas fa-sign-out-alt fa-2x pr-1 "></i> logout</a></li>
				</ul>

			</div>
		</nav>

		<!-- Navigation -->
	</header>
	<!--Header-->

	<section class="mt-4">
		<a href="bookflight.jsp" class="btn btn-success
		 pl-3 ml-3 mt-5">Book
			a new Journey</a>

		<h2
			class="text-center text-uppercase text-success font-weight-bold pt-3 mt-3">Booking
			Details</h2>

		<div class="container jumbotron py-2">
			<dl class="row pt-3">

				<dt class="col-sm-3">Booking Id:</dt>
				<dd class="col-sm-9">B1001</dd>

				<dt class="col-sm-3">Flight Number:</dt>
				<dd class="col-sm-9">1000</dd>

				<dt class="col-sm-3">Airline:</dt>
				<dd class="col-sm-9">Indigo</dd>

				<dt class="col-sm-3">Travel Class:</dt>
				<dd class="col-sm-9">Economy</dd>

				<dt class="col-sm-3">Source:</dt>
				<dd class="col-sm-9">MUMBAI(BOM), INDIA</dd>

				<dt class="col-sm-3">Destination:</dt>
				<dd class="col-sm-9">NEW DELHI, INDIA</dd>

				<dt class="col-sm-3">Travel Date:</dt>
				<dd class="col-sm-9">2022-09-18 (Sunday)</dd>

				<dt class="col-sm-3">No of Passengers:</dt>
				<dd class="col-sm-9">3%</dd>

				<dt class="col-sm-3">Total Amount paid:</dt>
				<dd class="col-sm-9">3000.0x3=9000.0</dd>

				<dt class="col-sm-3">Passenger Details:</dt>
				<dd class="col-sm-9">
					<dl class="row">
						<dt class="col-sm-4">Customer Id:</dt>
						<dd class="col-sm-8">3008</dd>

						<dt class="col-sm-4">Customer Name:</dt>
						<dd class="col-sm-8">Durga Ji</dd>

						<dt class="col-sm-4">Email Address:</dt>
						<dd class="col-sm-8">durga2019@durgasoft.com</dd>

						<dt class="col-sm-4">Phone Number:</dt>
						<dd class="col-sm-8">9999999999</dd>

					</dl>
				</dd>

				<!-- <dt class="col-sm-3">Payment Details:</dt>
				<dd class="col-sm-9">
					<dl class="row">
						<dt class="col-sm-4">Card Number:</dt>
						<dd class="col-sm-8"></dd>

						<dt class="col-sm-4">Card Holder Name:</dt>
						<dd class="col-sm-8"></dd>

						<dt class="col-sm-4">Payment Date:</dt>
						<dd class="col-sm-8"></dd>

					</dl>
				</dd> -->

			</dl>
 
			<input type="submit" class="btn btn-success btn-block"
				value="Confirm Booking" name="download" onclick="window.print()" />

		</div>

	</section>
	<!-- Footer -->
	<!-- Footer -->
	<!-- <footer>
		<div class="row justify-content-center">
			<div class="col-md-5 text-center">
				<i class="fas fa-plane pr-2 fa-4x text-primary"></i>
				<p>Here at Fly Away we provide flights at the cheapest rate to
					help you reach your destination</p>
				<strong>Contact Info</strong>
				<p>
					<i class="fas fa-phone-square pr-2 fa-2x text-success"></i>{888}
					888-8888
				</p>
				<p>
					<i class="fas fa-envelope-open-text pr-2 fa-2x text-success"></i>support@flyaway.com
				</p>

			</div>

			<hr class="socket">
			<p>&copy; FlyAway, All Rights Reserved</p>
		</div>
	</footer> -->


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.5.0/js/all.js"></script>
 -->
</body>
</html>

<%-- <%
}
%> --%>