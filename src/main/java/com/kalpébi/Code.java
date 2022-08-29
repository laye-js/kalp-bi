package com.kalpébi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/code")
public class Code extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num=Integer.parseInt(request.getParameter("num"));
		Random rand =new Random();
		
		int code= rand.nextInt(10000000-1234+1)+1234;
		int solde=Integer.parseInt(request.getParameter("solde"));
	
		
		
		String url="jdbc:mysql://localhost:3306/Ablaye";
		String username="root";
		String password="";
		String sql="insert into Code_retrait(code,valeur,numero) values(?,?,?)";
		String sql2="select solde from client where numero=?";
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st2= con.prepareStatement(sql2);
			st2.setInt(1,num);
			ResultSet rs2= st2.executeQuery();
			rs2.next();
			if(rs2.getInt("solde")>solde) {
			PreparedStatement st= con.prepareStatement(sql);
			st.setInt(1,code);
			st.setInt(2,solde);
			st.setInt(3,num);
			int rs= st.executeUpdate();
			
			
	
				 
			
		
		   PrintWriter out = response.getWriter();
		   out.println("le code est: "+code);
		   HttpSession session = request.getSession();
           
           session.setAttribute("code",code);
	      
	       
		 
		 response.sendRedirect("afficheCode.jsp");
			}
			else {
				response.sendRedirect("code.jsp");
				;
				  HttpSession session = request.getSession();
		           
		           session.setAttribute("val","null");
				
			}
			
		} 
		catch (Exception e) {
			 HttpSession session = request.getSession();
			 session.setAttribute("infos_env","faux");
			   
				
			
			response.sendRedirect("code.jsp");	
		} 
		
		
}
}
