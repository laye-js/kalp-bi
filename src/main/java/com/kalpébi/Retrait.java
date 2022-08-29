package com.kalpébi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.catalina.connector.Response;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/retrait")
public class Retrait extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num=Integer.parseInt(request.getParameter("num"));
		int code=Integer.parseInt(request.getParameter("code"));
		
	
		
		
		String url="jdbc:mysql://localhost:3306/Ablaye";
		String username="root";
		String password="";
		String sql="select solde from client where numero=?";
		String sql3="select * from Code_retrait where code=?";
		String sql4="Delete from Code_retrait where code=?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st= con.prepareStatement(sql);
			st.setInt(1,num);
			ResultSet rs= st.executeQuery();
			rs.next();
			
			
			//HttpSession session= request.getSession();
			//session.setAttribute("solde", solde2);
			//session.setAttribute("num", num);
	
			PreparedStatement st3= con.prepareStatement(sql3);
			st3.setInt(1,code);
			ResultSet rs3= st3.executeQuery();
			rs3.next();
			int solde3=rs3.getInt("valeur");
			int solde2 =rs.getInt("solde")-solde3;
			
			if(num==rs3.getInt("numero")) {
			String sql2="Update client set solde=? where numero=? ";
				PreparedStatement st2=con.prepareStatement(sql2);
				
				st2.setInt(1,solde2 );
				st2.setInt(2,num );
				
				int rs2= st2.executeUpdate();
				
				   
				  PreparedStatement st4= con.prepareStatement(sql4);
					st4.setInt(1,code);
					int rs4= st4.executeUpdate();
				
		
		   PrintWriter out = response.getWriter();
		   out.println("<script> alert('retirer avec succes')</script>");
		   out.println("<a href='admin.jsp'>retour</a>");
		 
			}
			else {
				
				String k="numero invalide";
				
				
				response.sendRedirect("admin.jsp");
			}
			
			//response.sendRedirect("traiteur");
		} 
		catch (Exception e) {
			
			response.sendRedirect("admin.jsp");
		} 
		
	
}

}
