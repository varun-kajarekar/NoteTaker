<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="Required/logo.jpg" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Krub:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">



<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="Required/headcontent.jsp"%>
<link href="Required/signin.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light red">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}"
				style="font-size: 130%">NoteTaker</a>
		</div>
	</nav>

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">
		<div
			class="container d-flex flex-column align-items-center justify-content-center"
			data-aos="fade-up">
			<h1>Save your thoughts,</h1>
			<h2>wherever you are</h2>
			<a href="${pageContext.request.contextPath}/NoteTaker?page=register1"
				class="btn-get-started scrollto">Sign up for free</a> Already have
			an account?<a class="nav-link active"
				href="${pageContext.request.contextPath}/NoteTaker?page=login">Sign
				in now</a> <img src="assets/img/hero-img.png" class="img-fluid hero-img"
				alt="" data-aos="zoom-in" data-aos-delay="150">
		</div>

	</section>
	<!-- End Hero -->

	<!-- ======= Footer ======= -->

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>