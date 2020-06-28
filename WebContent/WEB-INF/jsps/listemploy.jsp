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
  
  
  
  .error {color:red;}  
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
        <li class="active"><a href="../listEmployee">Home</a></li>
        <li><a href="../about">About</a></li>
        <li><a href="../contact">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<div align="center">
<h1>Employees List</h1>  
<c:if test="${mess eq 'value null'}">

<div align="center">
<h3>No Exist Data Found ! Add new employee to Database :) </h3>

<a href="addEmployee">Add New Employee</a>  
</div>

</c:if>
<c:if test="${mess ne 'value null'}">
<form:form action="" method="GET" modelAttribute="lis">
<table border="2" width="50%" cellpadding="2">  



<tr><th>Id</th><th>EmployeeName</th><th>Salary</th><th>Designation</th><th>DOB</th><th>CompanyName</th><th>Edit</th><th>Delete</th></tr>  
   <c:forEach var="employee" items="${employees}">   
   <tr>  
   <td>${employee.empId}</td>  
   <td>${employee.empName}</td> 
    <td>${employee.sal}</td> 
   <td>${employee.designation}</td> 
   <td>${employee.dob}</td> 
   <td>${employee.companyName}</td>  
   <td><a href="updateEmployee/${employee.empId}">Edit</a></td>  
   <td><a href="deleteEmployee/${employee.empId}"
    onclick="if(!(confirm('Are you sure want to delete this Employee permanently?'))) return false"
     >Delete</a></td>  
   </tr>  
   </c:forEach>  
   </table>  
   
   <div id="pagination">

    <c:url value="/listEmployee" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/listEmployee" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/listEmployee" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>
   
  
   
   <br/>  
  
  <button type="button" class="btn btn-primary"><a href="addEmployee"><font color="white">Add New Employee</font></a></button> 
</form:form> </c:if></div>
</body>
</html>
