<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="envoie.css">
</head>
<body>
				<% 
		
		                  response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate"); //HTTP 1.1
		                  response.setHeader("Pragma","no-cache");  //HTTP 1.0
		                  response.setHeader("Expires","0");  //Proxies
		                
		                   if(session.getAttribute("prenom") == null){
		             	   response.sendRedirect("connection.jsp");
		             	   
                }
				
				%>

    <div class="navbar">
        <p class="logo">KALPÉBI </p>
        <ul>
           
            <li><a href="banque.jsp">consulter compte</a></li>
    
            
        </ul>
    </div>
      <% 
				    if(session.getAttribute("infos_env")!=null){
				    	%>
				    	<div  class="infox" ><p class="infos">INFORMATIONS INCORRECTS</p></div>
				    	
	<% 			 
	                 session.removeAttribute("infos_env");        
				}
				    
				    
    
    %>
<div class="fieldset">
    <form action="requetes" method="post">
        <br><br>
        <input type="hidden" name="num" value=<%=session.getAttribute("numero")%>  required><br><br>
        <input type="text" placeholder="numero destinataire" name="num2" ><br><br>
        <input type="number" placeholder="Solde" name="solde" required="required" min="1" max="1000000" required"><br><br>
        <input type="submit" class="btn" value="valider">
    </form>
</div>
 
  
</body>
</html>