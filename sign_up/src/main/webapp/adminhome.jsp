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
<body id="admin-users">
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
      <a class="nav-link" href="adminhome.jsp"><i class="zmdi zmdi-account-circle"></i>Users</a>
      <a class="nav-link active" href="admincats.jsp"><i class="zmdi zmdi-shopping-cart"></i>Cats</a>
      <a class="nav-link" href="adminproducts.jsp"><i class="zmdi zmdi-truck"></i>Products</a>
      <a class="nav-link" href="logout"><i class="zmdi zmdi-sign-in"></i>Logout</a>
    </div>
  </div>
</nav>

<!-- top banner starts here -->


<%
    int totalUsers = 0;
    int totalCats = 0;
    int totalProducts = 0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
        		"jdbc:mysql://localhost:3306/demoSignUp?useSSL=false","root","Faraaz123$");
        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM users");
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            totalUsers = rs.getInt(1);
        }
        ps = con.prepareStatement("SELECT COUNT(*) FROM cats");
        rs = ps.executeQuery();
        if (rs.next()) {
            totalCats = rs.getInt(1);
        }
        ps = con.prepareStatement("SELECT COUNT(*) FROM products");
        rs = ps.executeQuery();
        if (rs.next()) {
            totalProducts = rs.getInt(1);
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>



<div class="banner bottom">
	<div class="row mr-0 p-0">
		<div class="col total-count">
			<div class="banner-text bottom">Total users listed :<span class="count"><%= totalUsers %></span></div>
		</div>
		<div class="col total-count">
			<div class="banner-text bottom">Total cats listed :<span class="count"><%= totalCats %></span></div>
		</div>
		
		<div class="col total-count">
			<div class="banner-text bottom">Total products listed :<span class="count"><%= totalProducts %></span></div>
		</div>
	</div>
</div>


<!-- users section STARTS here -->

<div class="row detail-container container">
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
            ResultSet res = st.executeQuery("Select * from users");
    %>
  <div class="inner-table">
    <table class="table admin-table table-borderless">
        <thead>
            <tr>
                <th class="table-data" scope="col">User id</th>
                <th class="table-data" scope="col">Name</th>
                <th class="table-data" scope="col">Email</th>
                <th class="table-data" scope="col">Phone no</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>

    <% while(res.next()) { %>
        <tbody>
        <tr>
            <th class="table-data" scope="row"><%=res.getInt("id") %></th>
            <td class="table-data"><%=res.getString("uname") %></td>
            <td class="table-data"><%=res.getString("uemail") %></td>
            <td class="table-data"><%=res.getString("umobile") %></td>
            <td >
                <form action="delete.jsp" method="post" class="form-group form-button">
                    <input type="hidden" name="id" value="<%=res.getInt("id") %>">
                    <input type="submit" value="Delete" class="form-submit">
                </form>
            </td>
        </tr>
        </tbody>
    <% } %>
    </table>
    <%
        } catch(SQLException se){
            //handle errors for JDBC
            se.printStackTrace();
        }catch(Exception e){
            //handle errors for Class.forName
            e.printStackTrace();
        }finally{
            //finally block used to close resources
            try{
                if(con!=null)
                con.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }
    %>
   </div>

 	<div class="update-section">
 	<form id="updateMobileForm" class="form-button" method="post" action="updateMobile">
    	<label for="id">Enter User ID:</label>
    	<input type="text" id="id" name="id" required>
    	
    	<label for="mobile">Enter New Mobile Number:</label>
    	<input type="text" id="mobile" name="umobile" required>
    	
    	<input type="submit" value="Update" class="form-submit">
	</form>
 </div>
	
</div> 	

<div class="total-visits">
<%@ page import="java.sql.*" %>
 <%
 // Step 1: Create a database connection
    Connection con2 = null;
    String driver2 = "com.mysql.cj.jdbc.Driver";
    
    try {
        Class.forName(driver).newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoSignUp?useSSL=false","root","Faraaz123$");
    } catch (Exception e) {
        e.printStackTrace();
    }
    // Step 2: Create a SQL query
    Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM login_count");
        int count =0;
        if (rs.next()) {
        	count = rs.getInt("count");
    }
%>

<p>Total Login Count : <%=count %> </p>

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