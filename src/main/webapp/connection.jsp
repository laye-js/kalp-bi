<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>  
         
         
         
        
         
<%

          

          
        	 if(request.getAttribute("prenom") !=null  &&  request.getAttribute("nom") !=null && request.getAttribute("numero") != null  &&  request.getAttribute("mdp") !=null && request.getAttribute("mdp1") !=null  ){
        	   int numero   = (int)(request.getAttribute("numero"));           
        	   String sql1="select * from client where numero=? ";
        	   String url = "jdbc:mysql://localhost:3306/Ablaye";
               String username = "root";
               String password= "" ;
               Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection(url,username,password);
               PreparedStatement st1 = con.prepareStatement(sql1);
               st1.setInt(1, numero);
               ResultSet rs1=st1.executeQuery();
        	   if (!(rs1.next()) ){
        	   
				        	   if( request.getAttribute("mdp").equals( (request.getAttribute("mdp1") )) ){
				        	            	               
				        	            	                    String prenom = request.getAttribute("prenom").toString();
				        	            	                     String nom   = request.getAttribute("nom").toString() ;
				        	            	                     String mdp  =  request.getAttribute("mdp").toString(); 
				        	            	                             
									        	                
									        	                  String sql2 = "insert into client(prenom,nom,numero,mdp,solde) VALUES(?,?,?,?,?)";
									        	                 
									        	                  PreparedStatement st2 = con.prepareStatement(sql2);
									        	                  st2.setString(1, prenom);
									        	                  st2.setString(2, nom);
									        	                  st2.setInt(3, numero);
									        	                  st2.setString(4, mdp);
									        	                  st2.setInt(5, 0);
									        	                  int rs2 = st2.executeUpdate(); 
									        	                  
									        	                 
									        	                  response.sendRedirect("connection.jsp?inscription=reussie");
									        	                  
				        	              }
           
					        	    
					        	           else{
					        	        	   
					        	            	  %>
					        	            	  <%@ include file="inscription.jsp"  %>   
					        	             <% 
					        	            }
        	              
                                	              
        	              
        	   }
        	   else{
        		   %>
								
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
								                     <input type="number" placeholder="NUMERO EXISTANT" name="numero" value="" required="required"  min="1" max="800000000" >
								            </div>
								 
								            <div class="tbox">
								             <input type="password" placeholder="MOT DE PASSE" name="mdp"  value=<%=request.getAttribute("mdp")%> required="required"/>
								            </div>
								            
								             <div class="tbox">
								             <input style="color:red;" type="password" placeholder="CONFIRMER MOT DE PASSE" name="mdp1" value=<%=request.getAttribute("mdp1")%> required="required"/>
								            </div>
								            
								            
								             
								             <input class="btn" type="submit" value="CREER COMPTE" >
								          
								        </form>
								
								        
								     </div> 
								 
								
								</body>
								
								</html>
        	<% 	   
        	   }
         
        	   
        }   
        	              
        else{
        	
        	    if(request.getParameter("inscription") != null){
         	    out.println("<script language='javascript'>");
                out.println("alert('INSCRIPTION REUSSIE');");
                out.println("</script>"); 
                
            }
        	    session.removeAttribute("inscription");
        	  %> 
        	  
        	    <%@ include file="formulaire.jsp" %>
       <% 
       }

    	   
       
%>


  
