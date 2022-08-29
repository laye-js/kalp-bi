<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="connexion.css">
    <script src="jquery-3.1.1.min.js"></script>
    <title>Document</title>
   
</head>
<body>
    <% 
				    if(session.getAttribute("infos_conn")!=null){
				    	%>
				    	<div  class="infox" ><h1>INFORMATIONS INCORRECTS</h1></div>
				    	
	<% 			 
	                 session.removeAttribute("infos_conn");        
				}
				    
				    
    
    %>
    
    <div class="container1">

       
       <h1> LOG IN</h1>
       

       <form action="login" method="post">

           <div class="tbox">
                    <input type="text" placeholder="NUMERO" name="numero" value="" required="required">
           </div>

           <div class="tbox">
            <input type="password" placeholder="MOT DE PASSE" name="mdp" value="" required="required">
            </div>
            
            <input class="btn" type="submit" value="LOG IN">
         
       </form>

       <!-- <a class="b1" href="#">MOT DE PASSE OUBLIE?</a> -->
       <a  class="b1" href="#">CREER UN COMPTE</a>
    </div>   




    <div class="container2">

       
        <h1 id="2">VEUILLEZ RENSEIGNER TOUS LES CHAMPS</h1>
        
 
        <form id="inscription" action="insertion" method="post">
            
            <div class="tbox">
                <input type="text" placeholder="PRENOM" name="prenom" value="" required="required">
            </div>

            
            <div class="tbox">
                <input type="text" placeholder="nom" name="nom" value="" required="required">
            </div>
 
            <div class="tbox">
                     <input type="text" placeholder="NUMERO" name="numero" value="" required>
            </div>
 
            <div class="tbox">
             <input type="password" placeholder="MOT DE PASSE" name="mdp" value="" required="required"/>
            </div>
             <div class="tbox">
             <input type="password" placeholder="CONFIRMER MOT DE PASSE" name="mdp1"   value="" required="required"  >
            </div>
            
             
             <input class="btn" type="submit" value="CREER COMPTE" >
          
        </form>
       
     </div> 
     <script type="text/javascript">
                $(document).ready(function(){
                  
                	   $(".container2").hide();
                       $("#verifpass").hide();
                	
                    
                    
                    $(".b1").click(function(){
                        $(".container2").show();
                        $(".container1").hide();
                    });
                    
                  
              
                  
                    
                   
                    
                    
                })

     </script>  

</body>
</html>