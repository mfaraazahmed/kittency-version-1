<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
%>


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


<!-- Top banners styling -->

<div class="banner top">
	<div class="row mr-0 p-0">
		<div class="col">
			<img src="images/kitten1.png" alt="My Image">

		</div>
		<div class="col">
			<div class="banner-text top">" The purr-fect addition to your family "</div>
		</div>
	</div>
</div>

<div class="banner bottom">
	<div class="row mr-0 p-0">
		<div class="col">
			<div class="banner-text bottom">" Where every pet finds their forever home "</div>
		</div>
		<div class="col">
			<img src="images/kitten3.png" alt="My Image">
		</div>
	</div>
</div>
	
	
<!-- Cards styling -->

	<div class="buy-title">Cats</div>
 	<div class="row buy-container mr-0 p-0">
 	
 	<%@ page import="java.sql.*" %>
 	<%
 	
 	//creating connection
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
 		ResultSet res = st.executeQuery("Select * from cats");
 	
 	%>
 	
 	<% while(res.next()) { %>
		<div class="col-md-3 mr-0 p-0">
			<div class="card mr-0 p-0">
 				<img src="images/cat_preview.jpeg" class="card-img-top buy-image" alt="...">
  				<div class="card-body">
    				<h5 class="card-title"><span>&#x20B9;</span><%=res.getInt("price") %></h5>
    				<p class="card-text"><%=res.getString("cat_breed") %></p>
    				<a href="contact-seller.jsp?cat_name=<%=res.getString("cat_name") %>&cat_age=<%=String.valueOf(res.getInt("cat_age")) %>&cat_breed=<%=res.getString("cat_breed") %>&description=<%=res.getString("description") %>" class="btn btn-primary" class="btn btn-primary">Buy</a>
  				</div>
	 		</div>
    	</div>
    	
    <% } %>
    
    	<!-- <div class="col-md-3">
    		<div class="card mr-0 p-0 mr-0 p-0">
 				<img src="images/cat2.jpeg" class="card-img-top buy-image" alt="...">
  				<div class="card-body">
    				<h5 class="card-title"><span>&#x20B9;</span>19,200</h5>
    				<p class="card-text">Main Coon</p>
    				<a href="#" class="btn btn-primary">Buy</a>
  				</div>
	 		</div>
    	</div>
    
    	<div class="col-md-3 mr-0 p-0">
     		<div class="card mr-0 p-0">
 				<img src="images/cat3.jpeg" class="card-img-top buy-image" alt="...">
  				<div class="card-body">
    				<h5 class="card-title"><span>&#x20B9;</span> 19,200</h5>
    				<p class="card-text">Main Coon</p>
    				<a href="#" class="btn btn-primary">Buy</a>
  				</div>
	 		</div>
    	</div>
    
    	<div class="col-md-3 mr-0 p-0">
      		<div class="card mr-0 p-0">
 				<img src="images/cat4.jpeg" class="card-img-top buy-image" alt="...">
  				<div class="card-body">
    				<h5 class="card-title"><span>&#x20B9;</span> 19,200</h5>
    				<p class="card-text">Main Coon</p>
    				<a href="#" class="btn btn-primary">Buy</a>
  				</div>
	 		</div>
   	 	</div>
   	 	
   	 	<div class="col-md-3 mr-0 p-0">
			<div class="card mr-0 p-0">
 				<img src="images/cat5.jpeg" class="card-img-top buy-image" alt="...">
  				<div class="card-body">
    				<h5 class="card-title"><span>&#x20B9;</span>19,200</h5>
    				<p class="card-text">Main Coon</p>
    				<a href="#" class="btn btn-primary">Buy</a>
  				</div>
	 		</div>
    	</div>
    
    	<div class="col-md-3 mr-0 p-0">
    		<div class="card mr-0 p-0">
 				<img src="images/cat6.jpeg" class="card-img-top buy-image" alt="...">
  				<div class="card-body">
    				<h5 class="card-title"><span>&#x20B9;</span>19,200</h5>
    				<p class="card-text">Main Coon</p>
    				<a href="#" class="btn btn-primary">Buy</a>
  				</div>
	 		</div>
    	</div>
    
    	<div class="col-md-3 mr-0 p-0">
     		<div class="card mr-0 p-0">
 				<img src="images/cat7.jpeg" class="card-img-top buy-image" alt="...">
  				<div class="card-body">
    				<h5 class="card-title"><span>&#x20B9;</span>19,200</h5>
    				<p class="card-text">Main Coon</p>
    				<a href="#" class="btn btn-primary">Buy</a>
  				</div>
	 		</div>
    	</div>
    
    	<div class="col-md-3 mr-0 p-0">
      		<div class="card mr-0 p-0">
 				<img src="images/cat8.jpeg" class="card-img-top buy-image" alt="...">
  				<div class="card-body">
    				<h5 class="card-title"><span>&#x20B9;</span>19,200</h5>
    				<p class="card-text">Main Coon</p>
    				<a href="#" class="btn btn-primary">Buy</a>
  				</div>
	 		</div>
   	 	</div>  -->
   	 	<%
 		} catch(Exception e){
   	 		e.printStackTrace();
   	 	}
   	 	%>
   	 	
 	</div> 
	
   	<div class="buy-title">Products</div>
   	<div class="row buy-container mr-0 p-0">
   	
   	<%@ page import="java.sql.*" %>
 	<%
 	Connection conn = null;
 	String url2 = "jdbc:mysql://localhost:3306/";
 	
 	try{
 		Class.forName(driver).newInstance();
 		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoSignUp?useSSL=false","root","Faraaz123$");
 		Statement st = con.createStatement();
 		ResultSet res = st.executeQuery("Select * from products");
 	
 	%>
 	
 	<% while(res.next()) { %>
		<div class="col-md-3 mr-0 p-0">
			<div class="card mr-0 p-0">
 				<img src="images/cat-food.jpeg" class="card-img-top buy-image" alt="...">
  				<div class="card-body">
    				<h5 class="card-title"><span>&#x20B9;</span><%=res.getInt("pqty") %></h5>
    				<p class="card-text"><%=res.getString("pname") %></p>
    				<a href="contact-product-seller.jsp?pname=<%=res.getString("pname") %>&pqty=<%=String.valueOf(res.getInt("pqty")) %>&pmfc=<%=res.getString("pmfc") %>&pexp=<%=res.getString("pexp") %>" class="btn btn-primary" class="btn btn-primary">Buy</a>
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
