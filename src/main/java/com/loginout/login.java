package com.loginout;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.login.dao.LoginDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {
		
       public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	   
    	   
    	   String url = "jdbc:mysql://localhost:3306/Ablaye";
   	       String username = "root";
   	       String password= "" ;
    	   
    	   int numero= Integer.parseInt(request.getParameter("numero"));
    	   String mdp= request.getParameter("mdp");
    	   
    	   LoginDao dao = new LoginDao();
    	  
         
    	   
    	   if(dao.check(numero, mdp)) {
		    		     String sql2="select * from client where numero=? and mdp=? ";
		    		     try {
					    		    	  Class.forName("com.mysql.jdbc.Driver");
					                      Connection con1 =DriverManager.getConnection(url,username,password);
					                      PreparedStatement st1 = con1.prepareStatement(sql2);
					                      st1.setInt(1, numero);
					                      st1.setString(2, mdp);
					                      ResultSet rs1 = st1.executeQuery();
					                      rs1.next();
					                      String prenom=rs1.getString("prenom");
					                      String nom=rs1.getString("nom");
					                      int solde= rs1.getInt("solde");
					                      PrintWriter out =response.getWriter();
					                      out.println(nom);
					                       HttpSession session = request.getSession();
					                       
					     		           session.setAttribute("prenom", prenom);
						    		       session.setAttribute("nom", nom);
						    		       session.setAttribute("numero", numero);
						    		       session.setAttribute("solde",solde);
						    		       
						    		       response.sendRedirect("banque.jsp");
		    		     }
		    		     catch(Exception e) {
		    		    	         e.printStackTrace();
		    		     }
	                     
    		         
    	   }
    	   else {
    		   // if(numero!=null)
    		     HttpSession session = request.getSession();
		         session.setAttribute("infos_conn","faux");
    		   response.sendRedirect("connection.jsp");
    	   }
    	   
    	   
    	   
       }
}
