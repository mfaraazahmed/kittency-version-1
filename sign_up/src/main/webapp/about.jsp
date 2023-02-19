<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kittency</title>
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
	
<!-- Google fonts link -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;400;500&family=Poppins:ital,wght@0,100;0,200;0,500;0,600;1,100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;400;500&family=Lato:ital,wght@0,300;0,400;0,900;1,400&family=Poppins:ital,wght@0,100;0,200;0,500;0,600;1,100&display=swap" rel="stylesheet">

<!-- Bootstrap linked here -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<!-- zavoloklom icons linked here -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

<!-- Custom css -->
<link rel="stylesheet" href="css/material-dashboard.css">
</head>
<body id="about-us">
<!-- Navbar starts here -->	

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">
  	<img class="logo" src="images/Logo.png" alt="Logo">
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav mx-auto">
      <a class="nav-link" href="about.jsp"><i class="zmdi zmdi-globe"></i>About</a>
      <a class="nav-link active" href="index.jsp"><i class="zmdi zmdi-shopping-cart"></i>Buy</a>
      <a class="nav-link" href="sell.jsp"><i class="zmdi zmdi-label"></i>Sell</a>
      <a class="nav-link" href="profile.jsp"><i class="zmdi zmdi-account"></i>Profile</a>
      <a class="nav-link" href="logout"><i class="zmdi zmdi-sign-in"></i>Logout</a>
    </div>
  </div>
</nav>

<!-- form section STARTS here -->

<div class="text-container">
	<div class="title-section">
		<div class="title">ISE 5th Sem</div>
	</div>
	<div class="content-container">
		<!-- <img src="images/about-us-cat1.png"> -->
		<div class="content-block">
			<span class="sub-heading">Our Mission</span>
			Our website is a platform for people who love cats and are interested in buying or selling pet cats. Our mission is to make it easy for cat lovers to find the perfect feline companion, whether they are looking for a pedigree show cat or a more laid-back family pet.
		</div>
		
		<div class="content-block">
			<span class="sub-heading">Our Selection</span>
			We have a wide selection of cats for sale, from popular breeds like Siamese and Persians to more unusual breeds like Devon Rex and Scottish Folds. We also have a section for adoptions, where you can find cats in need of a new home.
		</div>
		
		<div class="content-block">
		<span class="sub-heading">Our Services</span>
			In addition to our extensive selection of cats for sale, we also offer a range of resources and services for cat owners. Our blog is a great source of information on everything from nutrition and grooming to behavior and training. We also have a forum where cat owners can connect and share tips and advice with each other.
			We take the welfare of cats very seriously, and we have strict guidelines in place to ensure that all cats listed on our site are treated humanely. We require all sellers to provide proof of vaccination and veterinary care, and we do not allow the sale of cats under the age of 8 weeks.
		</div>
		
		<div class="content-block">
			<span class="sub-heading">Our Vision</span>
			We are constantly striving to improve our website and make it the best it can be. Our vision is to be the go-to source for all things feline and to create a community of cat lovers from all over the world.
		</div>
		
		<div class="content-block">
			<span class="sub-heading">Contact Us</span>
			If you have any questions or feedback, we would love to hear from you. You can contact us through our website or by emailing info@example.com. Thank you for choosing our website as your go-to source for all things feline.
		</div>
	</div>
</div>

<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>