<%@page import="com.blog.helper.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.banner-background{
clip-path: polygon(30% 0, 70% 0, 100% 0%, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
}
</style>
<%@include file="allLinks.jsp" %>
</head>
<body>
<!--  navbar -->
<%@include file="navbar.jsp" %>

<!-- banner  -->

<div class="container-fluid p-0 m-0 pb-3">

<div class="jumbotron primary-background text-white">
<div class="container">
<h3 class="display-3 "> Welcome, to TechBlog </h3>
<p>A programming language is a system of notation for writing computer programs. A programming language is usually described in terms of its syntax (form) and semantics (meaning). These are usually defined by a formal language </p>
<p> A language usually has at least one implementation in the form of a compiler or interpreter, allowing programs written in the language to be executed.
Programming language theory is the subfield of computer science that studies the design, implementation, analysis, characterization, and classification of programming languages.</p>

<button class="btn btn-outline-light btn-lg"><span class="	fa fa-external-link"></span> Start! Its Free </button>
<a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="	fa fa-user-circle"></span> Login </a>

</div>
</div>
</div>

<!-- Cards  -->

<div class="container ">

   <div class="row mb-2">
   
   <div  class="col-md-4">
      <div class="card">
  <div class="card-body">
    <h5 class="card-title"> Java Programming </h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white"> Read more </a>
  </div>
</div>
   </div>
   
   <div  class="col-md-4">
      <div class="card">
  <div class="card-body">
    <h5 class="card-title"> Java Programming </h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white"> Read more </a>
  </div>
</div>
   </div>
   
   <div  class="col-md-4">
      <div class="card">
  <div class="card-body">
    <h5 class="card-title"> Java Programming </h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white"> Read more </a>
  </div>
</div>
   </div> 
</div>

<div class="row mb-2">
   
   <div  class="col-md-4">
      <div class="card">
  <div class="card-body">
    <h5 class="card-title"> Java Programming </h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white"> Read more </a>
  </div>
</div>
   </div>
   
   <div  class="col-md-4">
      <div class="card">
  <div class="card-body">
    <h5 class="card-title"> Java Programming </h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white"> Read more </a>
  </div>
</div>
   </div>
   
   <div  class="col-md-4">
      <div class="card">
  <div class="card-body">
    <h5 class="card-title"> Java Programming </h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white"> Read more </a>
  </div>
</div>
   </div> 
</div>
  
</div>




 <!-- 
<%-- <% Connection con=DatabaseConnection.getConnection(); 
 %>  --%>
<h1> <%-- <%= con  %> --%> </h1>  
-->
</body>
</html>