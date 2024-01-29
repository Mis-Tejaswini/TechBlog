<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.blog.dao.PostDao" %>
 <%@ page import="com.blog.helper.DatabaseConnection" %>
  <%@ page import="java.util.List" %>
   <%@ page import="com.blog.entities.Post" %>
   <%@page import="com.blog.dao.likeDao"%>
   <%@page import="com.blog.dao.UserDao"%>
      <%@ page import="com.blog.entities.User" %>  

<div class="row"> 
<%

User uuu= (User) session.getAttribute("currentUser");

Thread.sleep(1000);
PostDao d= new PostDao(DatabaseConnection.getConnection());

int cid= Integer.parseInt(request.getParameter("cid"));
List<Post> posts =null;
if(cid==0){
	 posts=d.getALLPosts();
}else{
	posts= d.getPostByCatId(cid);
}

if(posts.size()==0){
	out.println("<h3  class='display-3 text-center'>No Posts in this category..</h3>");
	return;
}

for(Post p:posts){
%>
<div class="col-md-6 mt-2">
<div class="card">
 <img src="blog_pics/<%=p.getpPic() %>" class="card-img-top" alt="card img ">
   <div class="card-body">
   <b> <%= p.getpTitle() %> </b>
   <p> <%=p.getpContent() %></p>
   </div>
   <div class="card-footer primary-background text-center">
   <a href= "show_blog_page.jsp?post_id=<%= p.getPid() %>" class=" btn btn-outline-light btn-sm"> Read More...</a>
   
   <%
     likeDao ld= new likeDao(DatabaseConnection.getConnection());
    %>
<a href= "#!" onclick="doLike(<%= p.getPid() %>, <%= uuu.getId() %>)" class=" btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"> <%= ld.countLikeOnPost(p.getPid()) %> </span></a>
<a href= "#!" class=" btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i> <span>20 </span></a>
   
   </div>
</div>
</div>
<%

}

%>
</div>