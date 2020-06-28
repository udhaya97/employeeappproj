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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  
  form {
	position: absolute;
	left: 400px;
	top: 150px;
	width: 40%;
	height:50%;
	border: 3px solid #4f411a;
}
  
  
  .error {color:red;}  
  
  tr{
  
  height: 10px;
  }
  
  </style>
</head>
 
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
   
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/EmployeeApp/listEmployee">Home</a></li>
        <li><a href="../about">About</a></li>
        <li><a href="../contact">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/EmployeeApp/"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>


<div align ="center">
<h1>Edit Employee</h1> 
<br>
       <form:form method="post" action="../saveEmployeetwo/${employee.empId}" modelAttribute="emplo">   
       
       <form:hidden path="empId"/> 
        <table >  
        <tr></tr>
         <tr> 
          
          <td>Employee Name : </td>   
          <td><form:input path="empName" value="${employee.empName}"/></td>  
            </tr>
            
         <tr>  
          <td></td><td><form:errors path="empName" cssClass="error"/></td>
         </tr>     
        
         <tr>
          <td>Salary :</td>    
          <td><form:input path="sal" value="${employee.sal}"/></td>  
         </tr>   
          <tr><td></td><td><form:errors path="sal" cssClass="error"/></td>
         </tr>    
         <tr><td></td><td></td></tr>
         <tr>    
          <td>Designation :</td>    
          <td><form:input path="designation" value="${employee.designation}"/></td>  
         </tr> 
          <tr><td></td><td><form:errors path="designation" cssClass="error"/></td>
         </tr>      
         <tr><td></td><td></td></tr>
         <tr>    
          <td>DOB :</td>    
          <td><form:input path="dob" value="${employee.dob}" type="date"/></td>  
         </tr>  
         <tr><td></td><td><form:errors path="dob" cssClass="error"/></td>
         </tr>  
         <tr><td></td><td></td></tr>
         <tr>    
          <td>CompanyName :</td>    
          <td><form:input path="companyName" value="${employee.companyName}"/></td>  
         </tr>  
          <tr><td></td><td><form:errors path="companyName" cssClass="error"/></td>
         </tr> 
        
        </table>    
        <div align="center"><button type="submit" class="btn btn-warning">Update</button></div>
       </form:form>   </div>
       
       
       <br>
       
</body>
</html>
