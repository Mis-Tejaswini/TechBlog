<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="com.blog.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page </title>
<%@include file="allLinks.jsp" %>
</head>
<body>

<!--  navbar -->
<%@include file="navbar.jsp" %>


<main class="d-flex align-items-center primary-background  banner-background" style= "height:80vh">
<div class="container">
<div class="row">
  <div class="col-md-4 offset-md-4">
    
    <div class="card">
    <div class="card-header primary-background text-white text-center">
    <span class="fa fa-user-plus fa-3x"></span>
    <br>
    <p> login here</p> 
    </div>
    
    <%
    Message m= (Message)session.getAttribute("msg");

    if(m!=null){
    	%>
     <div class="alert <%= m.getCssClass() %>" role="alert">
     <%=m.getContent() %>
    </div>
    
    <% 
    session.removeAttribute("msg");
    }
    
    %>
    
    <div class="card-body">
    
    <form action="LoginServlet" method="POST">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
  </div>
  <!--   <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div> 
  -->
  
  <div class="container text-center">
  <button type="submit" class="btn btn-primary">Submit</button>
  </div>
</form>
    </div>
    
    <div class="card-">
    
    </div>
    
    </div>
  
  </div>
</div>
</div>

</main>
</body>
</html>