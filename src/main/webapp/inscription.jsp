<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="inscription.css">
 <script src="jquery-3.1.1.min.js"></script>
</head>
<body>

      <div class="container">

       
        <h1 >VEUILLEZ RENSEIGNER TOUS LES CHAMPS</h1>
        
 
        <form  action="insertion" method="post">
            
            <div class="tbox">
                <input type="text" placeholder="PRENOM" name="prenom" value=<%=request.getAttribute("prenom")%> required>
            </div>

            
            <div class="tbox">
                <input type="text" placeholder="nom" name="nom" value=<%=request.getAttribute("nom")%> required="required">
            </div>
 
            <div class="tbox">
                     <input type="number" placeholder="NUMERO" name="numero" value=<%=request.getAttribute("numero")%> required="required"  min="1" max="800000000" >
            </div>
 
            <div class="tbox">
             <input type="password" placeholder="MOT DE PASSE" name="mdp"  value=<%=request.getAttribute("mdp")%> required="required"/>
            </div>
            
             <div class="tbox">
             <input style="color:red;" type="password" placeholder="CONFIRMER MOT DE PASSE" name="mdp1" value="" required="required"/>
            </div>
            
            
             
             <input class="btn" type="submit" value="CREER COMPTE" >
          
        </form>

        
     </div> 
 

</body>

</html>