$(document).ready(function(){
	 let editStatus=false;
	  $('#edit-profile-button').click(function(){
	//	alert("button click..")
	
	if(editStatus== false){
	$("#profile-details").hide()
	
	$("#profile-edit").show();
	editStatus=true;
	$(this).text("Back")
	}else{
		
	$("#profile-details").show(
		
	)
	$("#profile-edit").hide();
	editStatus=false;
	$(this).text("EDIT")

	}
	
	})
 });
 /* --now add post js 
 

 $(document).ready(function(e){
	 //
	 $("#add-post-form").on("submit", function(event){
		 // this code gets called when form is submitted.....
		 event.preventDefault();
		 console.log("you have click on submit..");
		 let form=new FormData(this);
		 
		 //now requesting to server....
		 $.ajax({
			 url:"AddPostServlet",
			 type:"POST",
			 data:form,
			 success:function(data, textStatus, jqXHR){
				 //success....
				 console.log(data);
				 if(data.trim()=='done'){
			    swal("Good job!", "Saved Successfully", "success");
				 }
				 else{
			 swal("Error!!", "Something went wrong try again...", "error");

				 }
			 },
			 error: function(jqXHR, textStatus, errorThrown){
				 //error.....
			swal("Error!!", "Something went wrong try again...", "error");
          },
			processData:false,
			contentType:false
			 
		 })
	 })
 })*/
 
function doLike(pid, uid)
{
	
console.log(pid +","+ uid)
const d={
	uid:uid,
	pid:pid,
	operation:'like'
}
$.ajax({
	url:"LikeServlet",
	data:d,
    success: function (data, textStatus, jqXHR) {
		console.log(data);
		
	if(data.trim()!=='true'){
		let c=$(".like-counter").html();
		c++;
		$('.like-counter').html(c);
	}
	},
    error: function (jqXHR, textStatus, errorThrown) {
		console.log(data);
	}
})
	
}