package com.kalpébi;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/insertion")
public class Insertion  extends HttpServlet{
 
	private static final long serialVersionUID = 1L;
	public void service(HttpServletRequest request ,  HttpServletResponse response) throws ServletException, IOException {
    	 String prenom= request.getParameter("prenom");  
         String nom=request.getParameter("nom"); 
         int numero=Integer.parseInt(request.getParameter("numero"));
         String mdp=request.getParameter("mdp"); 
         String mdp1=request.getParameter("mdp1");
        
         request.setAttribute("prenom", prenom);
         request.setAttribute("nom", nom);
         request.setAttribute("numero", numero);
         request.setAttribute("mdp", mdp);
         request.setAttribute("mdp1", mdp1);
         
         RequestDispatcher rd = request.getRequestDispatcher("connection.jsp");
         rd.forward(request, response);
         if(!(mdp.equals(mdp1))){
         RequestDispatcher rf = request.getRequestDispatcher("inscription.jsp");
         rf.forward(request, response);
    }
  
}
}



