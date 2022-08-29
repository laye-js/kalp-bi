<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="connexion.css">
</head>
<body>
               <% 
				    if(session.getAttribute("admin")!=null){
				    	
				    	out.println("<script language='javascript'>alert('informations incorrects');</script>");
				    	
		 
	                 session.removeAttribute("admin");        
				}
				    
				    
    
    %>
    
    <div class="container1">

       
       <h1> LOG IN</h1>
       

       <form action="admin.jsp" method="post">

           <div class="tbox">
                    <input type="text" placeholder="LOGIN" name="login" value="" required="required">
           </div>

           <div class="tbox">
            <input type="password" placeholder="MOT DE PASSE" name="mdp" value="" required="required">
            </div>
            
            <input class="btn" type="submit" value="LOG IN">
         
       </form>

       
    </div>   




   
    

</body>
</html>