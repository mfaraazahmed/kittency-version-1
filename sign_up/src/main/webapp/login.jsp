<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Kittency</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
	
<!-- Google fonts link -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;400;500&family=Poppins:ital,wght@0,100;0,200;0,500;0,600;1,100&display=swap" rel="stylesheet">

<!-- Custom css -->
<link rel="stylesheet" href="css/material-dashboard.css">

</head>
<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-form">
						<h2 class="form-title">Welcome to Kittency</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							<div class="form-group input-block">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="username" id="username" autocomplete="username"
									placeholder="Your Email" />
							</div>
							<div class="form-group input-block">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password" autocomplete="current-password"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
							
						</div>
					</div>
					<div class="signin-image">
							<img src="images/login-image.png" alt="sing up image">
						<a href="registration.jsp" class="signup-image-link">Create an
						account ?</a> 
					</div>
				</div>
			</div>
		</section>
		<ul class="alt-login">
			<li>
				<a href="adminlogin.jsp">Admin login</a>
			</li>
		</ul>
	</div>


	<!-- JS -->
	<script src="js/main.js"></script>
	
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
	
	var status = document.getElementById("status").value;
	if(status == "failed"){
		swal("Sorry","Wrong username and password","error");
	}
		
	</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>