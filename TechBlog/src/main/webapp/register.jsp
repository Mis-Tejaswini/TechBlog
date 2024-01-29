<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page here</title>
<%@include file="allLinks.jsp" %>
</head>
<body>
<!--  navbar -->
<%@include file="navbar.jsp" %>
 <main class="primary-background p-5 banner-background">
 <div class="container">
 <div class="col-md-6 offset-md-3">
 <div class="card">
 <div class="card-header primary-background text-white  text-center">
 <span class="fa fa-3x fa-user-circle"></span>
 <br>
 <p> Register Here! </p>
 </div>
 
 <div class="card-body">
 <form id="reg-form" action="RegistersServlet" method="post">
   <div class="mb-3">
    <label for="exampleInputUser" class="form-label"> User Name </label>
    <input  name="user_name" type="text" class="form-control" id="exampleInputUser" aria-describedby="emailHelp" placeholder="Enter name">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
  </div>
   <div class="mb-3">
    <label for="gender" class="form-label"> Select Gender </label>
    <br>
    <input type="radio" id="gender" name="gender"> Male
    <input type="radio" id="gender" name="gender"> Female 
  </div>
  <div class="form-group">
  <textarea name="about" id="" class="form-control" rows="5" placeholder="Enter something about yourself...."></textarea>
  </div>
  <div class="mb-3 form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1"> Terms and Conditions</label>
  </div>
  <br>
  <div class="container text-center " id="loader" style= "display:none;">
    <span class="fa fa-refresh fa-spin fa-4x"> </span>
    <h4> Please wait...</h4>
  </div>

  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
</form>
 </div>
 
</div>
 
 </div>
 
 </div>
  </main>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
    	console.log("loaded...")
    	
    	$('#reg-form').on('submit', function(event){
    		event.preventDefault();
    		
    		let form=new FormData(this);
    		$("#submit-btn").hide();
    		$("#loader").show();
    		
    		//send register servlet:
    			
    			$.ajax({
    				url:"RegistersServlet",
    				type:'POST',
    				data:form,
    				success: function (data, textstatus, jqXHR){
    					console.log(data)
    					
    					$("#submit-btn").show();
    		    		$("#loader").hide();
    		    		
    		    		 if (data.trim()==='done'){
    		    		swal("Register Successfully.... we are going to Redirecting to login page")
    		    		.then((value) => {
    		    			window.location="login.jsp"
    		    		  //swal(`The returned value is: ${value}`);
    		    		});
    		    		 }else
                         {

                             swal(data);
                         }
    				},
    				error:function(jqXHR, textstatus, errorThrown){
                        $("#submit-btn").show();
    		    		$("#loader").hide();
    		    		swal("Something went wrong ..try again ");
    		    		
    				},
    				processData:false,
    				contentType:false
    				
    			});
    		
    	}); 
    });
  </script>
  
</body>
</html>