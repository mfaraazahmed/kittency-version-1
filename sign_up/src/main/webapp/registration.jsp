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

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group input-block">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group input-block">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group input-block">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<!-- <div class="form-group input-block">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div> -->
							<div class="form-group input-block">
								<label for="contact"><i class="zmdi zmdi-phone"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Enter your WhatsApp number" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup.png" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	
	<script>
	
	// Get the phone number input field
	var phoneInput = document.getElementById("contact");

	// Get the form
	var form = document.getElementById("register-form");

	// Add an event listener to the form's submit event
	form.addEventListener("submit", function(event) {
	  // Get the phone number
	  var phoneNumber = phoneInput.value;

	  // Regular expression to check if phone number is Indian
	  var indianPhoneRegex = /^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$/;

	  // Check if phone number is Indian
	  if (!indianPhoneRegex.test(phoneNumber)) {
	    // If phone number is not Indian, prevent form submission and show an error message
	    event.preventDefault();
	    alert("Invalid Indian phone number. Please enter a valid Indian phone number.");
	  }
	});
	
	var passwordInput = document.getElementById("pass");
	var form = document.getElementById("register-form");
	for.addEventlistner("submit", function(event){
		var password = passwordInput.value;
		var validPassword = /^(?=.*[a-z])(?=.*[A-Z]).{6,}$/;
		if(!validPassword.test(password)){
			event.preventDefault();
			alert("password should be minimum of 6 character with one uppercase, one lower case and a special character");
		}
		
	})
	
	</script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
	
	var status = document.getElementById("status").value;
	if(status == "success"){
		swal("Welcome","Account created successfully","success");
		var audio = new Audio('assets/success-audio.mpeg');
		audio.play();
	}
	

	</script>


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>