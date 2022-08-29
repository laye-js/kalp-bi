<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="banque.css">
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
                   
                   
                   if(session.getAttribute("envoi")!=null){
                	   
                	  
            		   out.println("<script language='javascript'>alert('envoie effectuer avec succes');</script>");
                	   
                   }
                   
                       session.removeAttribute("envoi");
         %>
 


    <div class="navbar">
        <p class="logo">KALPÉBI </p>
        <ul>
            <li><a href="envoie.jsp">envoyer</a></li>
            <li><a href="code.jsp">générer code</a></li>
            <li><a href="transaction.jsp">Transactions</a></li>
           
            <li><a href="logout">déconnexion</a></li>
        </ul>
    </div>
   
    <div class="box1">
        <center><h1>Bonjour</h1></center>
        <center><div class="user"><%= session.getAttribute("prenom") %> <%=session.getAttribute("nom") %></div></center>
            <div class="solde">Solde:</div>
            <div class="money"><%= session.getAttribute("solde")  %> fcfa</div>
    </div>
    <div class="box2">
        <div class="contvid">
            <video autoplay muted loop id="myVideo">
                <source src="pub.mp4" type="video/mp4">
              </video>
        </div>
            <div class="parole"><strong>Nous vous proposons un service de qualité</strong> <br>Nous sommes des proffesionelles <br>Nous sommes ravis de la confiance que vous avez envers notre service <br><br><strong>Vous aider à être ensemble</strong> <br>
                Nous cherchons tous des moyens de rester connectés. <br> Du paiement en ligne sécurisé de votre Timbre d'extrait ou de voter voiture <br> KALPÉBI vous aide de multiples façons. <br><br><strong>Envoyez de l'argent</strong><br>  en quelques secondes grâce à KALPÉBI <br>
                Remboursez rapidement, facilement et en toute sécurité. <br> Si quelqu'un est parti faire vos courses, <br> vous pouvez lui envoyer de l'argent en quelques secondes. <br> Envoyez de l'argent à vos amis gratuitement dans l’EEE*.
            </div>
        
       
    </div>
  

    
           
         
         
</body>
</html>