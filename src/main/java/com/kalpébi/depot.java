package com.kalpébi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/depot")
public class depot extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num=Integer.parseInt(request.getParameter("num"));
		
		int solde=Integer.parseInt(request.getParameter("solde"));
	
		
		
		String url="jdbc:mysql://localhost:3306/Ablaye";
		String username="root";
		String password="";
		String sql="select solde from client where numero=?";
		String sql2="Update client set solde=? where numero=? ";
		
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st= con.prepareStatement(sql);
			st.setInt(1,num);
			ResultSet rs= st.executeQuery();
			rs.next();
			
				int solde2 =rs.getInt("solde")+solde;
				PreparedStatement st2=con.prepareStatement(sql2);
				st2.setInt(1,solde2 );
				st2.setInt(2,num );
				int rs2= st2.executeUpdate();
				
			
				
		   PrintWriter out = response.getWriter();
		   out.println("succefulyy");
		   
HttpSession session = request.getSession();
           
           session.setAttribute("depot","true");
	      
	       
		 
		 response.sendRedirect("admin.jsp");
			
		} 
		catch (Exception e) {
			 HttpSession session = request.getSession();
			 session.setAttribute("infos_env","faux");
			   
				
			
			response.sendRedirect("admin.jsp");	
		} 
		
	
}
}



