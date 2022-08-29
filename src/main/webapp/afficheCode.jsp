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
                   
                   if(session.getAttribute("code") != null){
                	 
         %>
 		
	

    <div class="navbar">
        <p class="logo">KALPÉBI </p>
        <ul>
            <li><a href="envoie.jsp">envoyer</a></li>
            
            <li><a href="transaction.jsp">Transactions</a></li>
            <li><a href="banque.jsp">consulter solde</a></li>
            <li><a href="logout">déconnexion</a></li>
        </ul>
    </div>
    
   <center><p>Votre Code est:</p></center>
    <center><p><%=session.getAttribute("code") %></p></center>
    <%
    session.removeAttribute("envoi");
                   }%>