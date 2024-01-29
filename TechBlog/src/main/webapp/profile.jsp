<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.helper.DatabaseConnection"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.entities.Message"%>
<%@page import="com.blog.entities.User" %>
<%@page import ="com.blog.entities.Category" %>
<%@page errorPage="error_page.jsp" %>

<%
 User user= (User) session.getAttribute("currentUser");
if(user==null){
	
	response.sendRedirect("login.jsp");
}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allLinks.jsp" %>
<style>
body{
background-image: url("images/bg.jpeg");
background-size: cover;
background-attachment:fixed;
}
</style>
</head>
<body>
<!-- Navbar Start -->

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-star"></span> Techblogs </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#"> <span class="fa fa-home"></span>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#"><span class="	fa fa-address-card-o"></span> Contacts </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#"> About </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#" data-bs-toggle="modal" data-bs-target="#add-post-model"><span class="fa fa-asterisk"></span> Do Post</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          <span class="	fa fa-check-square-o"></span>   Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Programming Language</a></li>
            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Data Structure</a></li>
          </ul>
        </li>
      </ul>
       <ul class="navbar-nav mr-right">
        <li class="nav-item">
          <a class="nav-link active" href="#!" data-bs-toggle="modal" data-bs-target="#profile-model"><span class="fa fa-user-circle"></span> <%= user.getName() %>  </a>
        </li>
       <li class="nav-item">
          <a class="nav-link active" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout  </a>
        </li>
       </ul>  
    </div>
  </div>
</nav>
<!-- Navbar End -->

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

<!-- main body of the page  -->

<main>
<div class="container">
<div class="row mt-4">
<!-- first colm -->
<div class="col-md-4">
<!-- Categories -->
<div class="list-group">
  <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active" aria-current="true">
    All Posts
  </a>
  <!-- categories -->
  <%
  PostDao d = new PostDao(DatabaseConnection.getConnection());
  ArrayList<Category> list1 = d.getAllCategories();
  for(Category cc:list1)
  {
	%>
	<a href="#" onclick="getPosts(<%=cc.getCid() %>,this)" class=" c-link list-group-item list-group-item-action"> <%= cc.getName() %> </a>
	<%  
	  
  }
  %>
  
</div>

</div>

<!-- second col -->
<div class="col-md-8">
<!-- posts -->
  <div class="container text-center" id="loader">
    <i class="fa fa-refresh fa-4x fa-spin"> </i>
    <h3 class="mt-2"> Loading....</h3>
  </div>

<div class="container-fluid" id="post-container">
        
</div>

</div>

</div>

</div>

</main>

<!-- end main body of the page  -->
<!--  Start of Profile Model  -->


<!-- Modal -->
<div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel"> TechBlog</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        <img  src="pics/<%= user.getProfile() %> " class="img-fluid" style="border-radius:50%;max-width: 150px;;">
        <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
        <!-- Details.... -->
        
       <div id="profile-details"> 
        <table class="table">
  <tbody>
    <tr>
      <th scope="row">ID:</th>
      <td> <%= user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Email: </th>
      <td> <%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender:</th>
      <td> <%=user.getGender() %></td>
     </tr>
     
     <tr>
      <th scope="row">Status:</th>
      <td> <%=user.getAbout() %></td>
     </tr>
     
     <tr>
      <th scope="row">Register on:</th>
      <td> <%=user.getDateTime().toString() %></td>
     </tr>
  </tbody>
</table>
</div>

<!--  Profile Edit  -->

<div id="profile-edit" style="display:none;">
<h3 class="mt-2"> Please Edit Carefully</h3>
<form action="EditServlet" method="post" enctype="multipart/form-data">
<table class="table">
<tr>
<td>ID: </td>
<td> <%=user.getId() %> </td>
</tr>

<tr>
<td>Name: </td>
<td> <input type="text" class="form-control" name="user_name" value="<%=user.getName() %>" > </td>
</tr>

<tr>
<td>Email: </td>
<td> <input type="email" class="form-control" name="user_email" value="<%=user.getEmail() %>" > </td>
</tr>

<tr>
<td>Password: </td>
<td> <input type="password" class="form-control" name="user_password" value="<%=user.getPassword() %>" > </td>
</tr>

<tr>
<td>Gender: </td>
<td> <%=user.getGender().toUpperCase() %> </td>
</tr>

<tr>
<td>About: </td>
<td>
<textarea class="form-control" name= "user_about" rows="3" cols=""> <%=user.getAbout() %>
</textarea>
</td>
</tr>

<tr>
<td>New Profile: </td>
<td>
  <input type="file" name="image" class="form-control">
 </td>
</tr>

</table>

<div class="container">
  <button type="submit" class="btn btn-outline-primary"> Save</button>
</div>
</form>
</div>
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary"> EDIT </button>
      </div>
    </div>
  </div>
</div>
<!-- End of profile model -->

<!--  Add Post Model -->

<!-- Modal -->
<div class="modal fade" id="add-post-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"> Provide the post details..</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    
        <form id="add-post-form" action="AddPostServlet" method="post">
        
    <div class="form-group">
      <select class="form-control" name="cid" >
      <option selected disabled > ---Select Category---</option>
      <%
      
        PostDao postd =new PostDao(DatabaseConnection.getConnection());
        ArrayList<Category> list=postd.getAllCategories();
        for(Category c:list)
        {
      %>
      <option value="<%=c.getCid() %>"> <%=c.getName() %></option>
      <%
        }      
      %>
      </select>
      </div>
      
        <div class="form-group mt-3"> 
        <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
        </div>
        
        <div class="form-group">
        <textarea name="pContent" class="form-control mt-3" placeholder="Enter Your Content" style="height:200px;"></textarea>
        </div>
        
        <div class="form-group">
        <textarea name="pCode" class="form-control mt-3" placeholder="Enter Your Program" style="height:200px;"></textarea>
        </div>
        
        <div class="form-group mt-3">
        <label> Select your pic </label>
        <br>
         <input type="file" name="pic" >
        </div>
        
        <div class="container text-center">
         <button type="submit" class="btn btn-outline-primary"> Post </button>
        </div>
        </form>
      </div>
     
    </div>
  </div>
</div>
<!-- End Post Model -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
 
    <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if(data.trim()!== 'data'){
        		    		swal("Good job!", "saved successfully", "success");
                            }else{
            		    		swal("Something went wrong ..try again ");

                            }
                          },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
        		    		swal("Something went wrong ..try again ");

                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
        
        <!-- LOADING Post using ajax -->
        <script>
        
         function getPosts(catId, temp){
        	 $("#loader").show();
        	 $("#post-container").hide()
        	 $(".c-link").removeClass('active')
        	 
        		$.ajax({
            		url:"load_posts.jsp",
            		data:{cid:catId},
            		success: function (data, textstatus, jqXHR){
    					console.log(data);
    					$("#loader").hide();
    					$("#post-container").show();
    					$('#post-container').html(data);
    					$(temp).addClass('active')
    				}
            	})
         }
        $(document).ready(function (e){
        	let allPostRef=$('.c-link')[0]
        	getPosts(0,allPostRef)
        	
        })
        
        </script>

<%-- <%= user.getName() --%>
<!-- <br>  -->
<%-- <%= user.getEmail() --%>
<!-- <br>  -->
<%-- <%= user.getAbout() --%> 
</body>
</html>