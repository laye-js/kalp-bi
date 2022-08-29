<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="code.css">
    <title>Document</title>
</head>
<body>

				<% 
		
		                  response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate"); //HTTP 1.1
		                  response.setHeader("Pragma","no-cache");  //HTTP 1.0
		                  response.setHeader("Expires","0");  //Proxies
		                
		                   if(session.getAttribute("prenom") == null){
		             	   response.sendRedirect("connection.jsp");
                }
				
				
 
				    if(session.getAttribute("infos_env")!=null){
				    	%>
				    	<div  class="infox" ><p class="infos">INFORMATIONS INCORRECTS</p></div>
				    	
	<% 			 
	                 session.removeAttribute("infos_env");        
				}
				    
				    if(session.getAttribute("val")!=null){
				    	%>
				    	
				    <script>alert("montant supérieure à votre soldet")</script>	
	<% 			 
	                 session.removeAttribute("val");        
				}
				    
				    	    
    
    %>
    <div class="fieldset">
        <form action="code" method="post">
            <br><br>
            <input type="hidden" name="num" value=<%= session.getAttribute("numero") %> required><br><br>
            <input type="number" name="solde" placeholder="montant" required="required"><br><br>
            <input type="submit" class="btn" value="Générer code">
        </form>
    </div>
</body>
</html>