<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Kittency</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>


	
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
<body id="page-top">

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
<!-- main body styling starts here -->
<div class="contact-seller">
	
	<div class="form-section">
	<div class="upper-row">
		<div class="cat-img">
			<img src="images/cat5.jpeg" class="profile-img" alt="...">
		</div>
		
			<%@ page import="java.sql.*" %>
			<%@ page import="javax.servlet.http.*" %>
			<%
    		String cat_name = request.getParameter("cat_name");
    		int cat_age = Integer.parseInt(request.getParameter("cat_age"));
    		String cat_breed = request.getParameter("cat_breed");
    		String description = request.getParameter("description");
			%>
		
		<div class="details">
			<div class="product-details"><span class="left-title">Cat name</span> : <span class="right-title"><%=cat_name %></span></div>
			<div class="product-details"><span class="left-title">Breed</span>  : <span class="right-title"><%=cat_breed %></span></div>
			<div class="product-details"><span class="left-title">Age</span>  : <span class="right-title"><%=cat_age %></span></div>
			<div class="product-details"><span class="left-title">Description</span>  : <span class="right-title"><%=description %></span></div>
			<form id="myForm" class="form-group form-button">
  				<input type="submit" value="Contact seller" class="form-submit">
  			</form>
		</div>
	</div>
	
	<div class="bottom-row">
		<div class="title">People also buy :</div>
		<div class="suggested-card">
		
		<%@ page import="java.sql.*" %>
 		<%
 		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/";
 		String dbName = "demoSignUp";
 		String driver = "com.mysql.cj.jdbc.Driver";
 		String userName = "root";
 		String password ="Faraaz123$";
 	
 		try{
 			Class.forName(driver).newInstance();
 			con = DriverManager.getConnection(url+dbName,userName,password);
 			Statement st = con.createStatement();
 			ResultSet res = st.executeQuery("Select * from cats limit 2");
 	
 		%>
 	
 		<%while(res.next()) { %>
			
			<div class="card mb-3 mr-4">
  				<div class="row no-gutters">
    				<div class="col-md-4">
      					<img src="images/cat_preview.jpeg" alt="...">
    				</div>
    				<div class="col-md-8">
      					<div class="card-body">
        					<h5 class="card-title"><%=res.getString("cat_breed") %></h5>
        					<p class="card-text"><%=res.getString("description") %></p>
        					<p class="card-text">Price : &#x20B9;<small class="text-muted"><%=res.getInt("price")%></small></p>
      					</div>
   					</div>
  				</div>
			</div>
		
		<% } %>
		
		<%
 		} catch(Exception e){
   	 		e.printStackTrace();
   	 	}
   	 	%>
		
		</div>
	</div>
	</div>
	
	
	<div class="carousal-section">
		<div class="bd-example">
  			<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    		<ol class="carousel-indicators">
      				<li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      				<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      				<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    			</ol>
    			<div class="carousel-inner">
      				<div class="carousel-item active">
        				<img src="images/carousel1.png" class="caousel-img-1" alt="...">
        				<div class="carousel-caption d-none d-md-block">
          					<h5>Adopt</h5>
          					<p>" Just like flowers, kittens spring up anywhere and everywhere. "</p>
        				</div>
      				</div>
      				<div class="carousel-item">
        				<img src="images/carousel2.png" class="caousel-img-2" alt="...">
        				<div class="carousel-caption d-none d-md-block">
          					<h5>Buy</h5>
          					<p>" Looking for a purr-fect companion? Look no further! "</p>
       	 				</div>
     		 		</div>
      				<div class="carousel-item">
        				<img src="images/carousel3.png" class="caousel-img-3" alt="...">
        				<div class="carousel-caption d-none d-md-block">
          					<h5>Sell</h5>
          					<p>" They always think that it’s their food inside every packet "</p>
       					</div>
      				</div>
   		 		</div>
    			<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
      				<span class="sr-only">Previous</span>
    			</a>
    			<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      				<span class="carousel-control-next-icon" aria-hidden="true"></span>
      				<span class="sr-only">Next</span>
   				</a>
  			</div>
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
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

	
</body>
</html>