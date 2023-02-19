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
<body>

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
      <a class="nav-link" href="index.jsp"><i class="zmdi zmdi-shopping-cart"></i>Buy</a>
      <a class="nav-link" href="sell.jsp"><i class="zmdi zmdi-label"></i>Sell</a>
      <a class="nav-link" href="profile.jsp"><i class="zmdi zmdi-account"></i>Profile</a>
      <a class="nav-link" href="logout"><i class="zmdi zmdi-sign-in"></i>Logout</a>
    </div>
  </div>
</nav>

<!-- main body styling starts here -->
<div class="sell-body">
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
	<div class="form-section">
		<div class="title-section">
		
	<%@ page import="java.sql.*" %>
	<%
	int id = 0;
          							
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
	  for (Cookie cookie : cookies) {
	    if (cookie.getName().equals("logged_in_user_id")) {
	      id = Integer.parseInt(cookie.getValue());
	      session.setAttribute("id", id);
	      break;
	    }
	  }
	}
	
    // Step 1: Create a database connection
    Connection con = null;
    String driver = "com.mysql.cj.jdbc.Driver";
    
    try {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoSignUp?useSSL=false","root","Faraaz123$");
    } catch (Exception e) {
        e.printStackTrace();
    }
    // Step 2: Create a SQL query
    String sql = "SELECT uname FROM users WHERE id = ?";
    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setInt(1, id); //set id parameter
    ResultSet rs = stmt.executeQuery();
    // Step 3: Extract the seller name from the ResultSet
    String sellerName = "";
    if (rs.next()) {
        sellerName = rs.getString("uname");
    }
%>
		
			<div class="heading"><%=sellerName%></div>
			<div class="sub-heading">Listening to market place</div>
		</div>
		<div class="details-section">
			<div class="heading">Details: </div>
			<form method="post" action="sell">
				<!-- <label for="image" class="sub-heading">Select an image:</label>
  				<input type="file" id="image" name="image" class="img-input" accept="image/*"> -->
  				<div class="form-text-inputs">
  					<div class="form-input-block">
						<label for="cat-name">Name</label>
  						<input type="text" id="cat-name" name="cat-name" placeholder="Enter cat name">
					</div>
					<div class="form-input-block">
						<label for="breed">Breed</label>
  						<input type="text" id="breed" name="breed" placeholder="Enter the cat breed">
					</div>
					<div class="form-input-block">
						<label for="age">Age</label>
  						<input type="number" id="age" name="age" placeholder="Select cat age">
					</div>
					<div class="form-input-block">
						<label for="price">Price</label>
  						<input type="number" id="price" name="price" placeholder="Enter price">
					</div>
  				</div>
  				<div class="text-area-group">
  					<label for="description">Description</label>
  					<textarea id="description" name="description" rows="5" cols="40"></textarea>
  				</div>
  				<div class="form-group form-button">
  					<input type="submit" value="Submit" class="form-submit">
  				</div>
			</form>
		</div>
	<div class="alt-redirection">Or, click here to <a href="products.jsp">sell cat products</a></div>
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