<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<title>Employee APP</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {

position: absolute;
	left: 550px;
	top: 400px;
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

/*set border to the form*/
form {
	position: absolute;
	left: 400px;
	top: 150px;
	width: 43%;
	border: 5px solid green;
}
/*assign full width inputs*/
input[type=text], input[type=password] {
	width: 30%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid blue;
	box-sizing: border-box;
}
/*set a style for the buttons*/
button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 18px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 10%;
}
/* set a hover effect for the button*/
button:hover {
	opacity: 0.8;
}
/*set extra style for the cancel button*/
.cancelbtn {
	width: 10%;
	padding: 10px 18px;
	background-color: #f44336;
}
/*centre the display image inside the container*/
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}
/*set image properties*/
img.avatar {
	width: 40%;
	border-radius: 50%;
}
/*set padding to the container*/
.container {
	padding: 16px;
}
/*set the forgot password text*/
span.psw {
	float: right;
	padding-top: 16px;
}
/*set styles for span and cancel button on small screens*/
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>
				</ul>

			</div>
		</div>
	</nav>
	
	
	
	
<div align="center">
 <h4>${er}</h4>
	<h3>Login Page</h3></div>
	<form:form method="post" action="usercheck">
		<div class="container">
			<label><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="username" required> <br>

			<label><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="password" required> <br>

			<button type="submit">Login</button>
			<button type="button" class="cancelbtn">Cancel</button>



		</div>

	</form:form>
	
	<footer>
  <p>Employee CRUD App !<br>
  
</footer>

</body>

</html>