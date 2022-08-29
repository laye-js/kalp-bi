package com.loginout;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/logout")
public class logout extends HttpServlet{
       public void service(HttpServletRequest request, HttpServletResponse response)throws IOException  {
    	  
    	   
    	   HttpSession session= request.getSession();
    	   session.removeAttribute("prenom");
    	   session.invalidate();
    	   response.sendRedirect("connection.jsp");
    		          
    	  
    	   
       }
}
