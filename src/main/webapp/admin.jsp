<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="admin.css">
    <script src="jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<%

	         if(request.getParameter("login") != null && request.getParameter("mdp") != null){
	             if(request.getParameter("login").equals("login")&&request.getParameter("mdp").equals("passer"))
	             {
	           %>
	            	      
											            	 <br><br><br>
										    <center><h1>Admin page</h1></center>
										    
										       <div class="bloc">
										           <div class="circle1"></div>
										           
										       </div>
										       <p>Effectuer retrait</p>
										       <div class="circle2"></div>
										           
										    </div>
										    <p class="p2"> Effectuer dépot</p>
										     <% 
														    if(session.getAttribute("infos_env")!=null){
														    	%>
														    	<div  class="infox" ><p class="infos">INFORMATIONS INCORRECTS</p></div>
														    	
											<% 			 
											                 session.removeAttribute("infos_env");        
														}
										     if(session.getAttribute("depot")!=null){
											    	%>
											    	<script>alert("depot effectué avec succes")</script>
											    	
								<% 			 
								                 session.removeAttribute("infos_env");        
											}    
														    
										    
										    %>
										         
										   
										    <div class="fieldset">
										    
										        <form action="retrait" method="post">
										            <br><br>
										            <input type="text" placeholder="numero retireur" name="num" required="required"><br><br>
										            <input type="text" placeholder="code" name="code" required="required"><br><br><br>
										            <input type="submit" class="btn" value="valider" required="required">
										        </form>
										    </div>
										    <div class="fieldset2">
										        <form action="depot" method="post">
										            <br><br>
										            <input type="text" placeholder="numero deposant" name="num" required="required"><br><br>
										            <input type="text" placeholder="solde" name="solde" required="required"><br><br><br>
										            <input type="submit" class="btn" value="valider">
										        </form>
										    </div>
										    <div class="cross">X</div>
										    <script>
										        $(".fieldset").hide();
										        $(".cross").hide();
										        $(".fieldset2").hide();
										        $(".circle1").click(
										            function(){
										                $(".circle1").hide();
										                $(".circle2").hide();
										                $(".bloc").hide();
										                $(".fieldset").show();
										                $(".cross").show();
										            }
										        );
										        $(".circle2").click(
										            function(){
										                $(".circle1").hide();
										                $(".circle2").hide();
										                $(".bloc").hide();
										                $(".fieldset2").show();
										                $(".cross").show();
										            }
										        );
										        $(".cross").click(
										            function(){
										                $(".circle1").show();
										                $(".circle2").show();
										                $(".bloc").show();
										                $(".fieldset2").hide();
										                $(".fieldset").hide();
										                $(".cross").hide();
										            }
										        );
										    </script>
	            	
	           <%  	 
	             } 
	             else{
	            	 session.setAttribute("admin","authentifier");
	            	 response.sendRedirect("adminconn.jsp");
	             }
	           	 
	         }   
	         else{
	        	 response.sendRedirect("adminconn.jsp");
	         }
   
%>
 
</body>
</html>