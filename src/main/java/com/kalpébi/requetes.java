package com.kalpébi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/requetes")
public class requetes extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num=Integer.parseInt(request.getParameter("num"));
		int num2=Integer.parseInt(request.getParameter("num2"));
		int solde=Integer.parseInt(request.getParameter("solde"));
		int frais=(solde*1)/100;
	
		
		
		String url="jdbc:mysql://localhost:3306/Ablaye";
		String username="root";
		String password="";
		String sql="select solde from client where numero=?";
		String sql2="Update client set solde=? where numero=? ";
		String sql3="insert into transactions(numero_dest,numero_exp,solde) values(?,?,?)";
		String sql4="select solde from client where numero=?";
		String sql5="Update client set solde=? where numero=? ";
		String sql7="select solde from admin ";
		String sql6="Update admin set solde=? ";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st= con.prepareStatement(sql);
			st.setInt(1,num2);
			ResultSet rs= st.executeQuery();
			rs.next();
			
			PreparedStatement st4= con.prepareStatement(sql4);
			st4.setInt(1,num);
			ResultSet rs4= st4.executeQuery();
			rs4.next();
			
			
			if(rs4.getInt("solde")>solde) {
				int solde3 =rs4.getInt("solde")-solde;
			PreparedStatement st5= con.prepareStatement(sql5);
			st5.setInt(1,solde3);
			st5.setInt(2,num);
			int rs5= st5.executeUpdate();
			
				int solde2 =rs.getInt("solde")+(solde-frais);
				PreparedStatement st2=con.prepareStatement(sql2);
				st2.setInt(1,solde2 );
				st2.setInt(2,num2 );
				int rs2= st2.executeUpdate();
				
				
				PreparedStatement st3= con.prepareStatement(sql3);
				st3.setInt(1,num2);
				st3.setInt(2,num);
				st3.setInt(3,solde);
				int rs3= st3.executeUpdate();
			
				
				
				
				
				Statement st7= con.createStatement();
				
				ResultSet rs7= st7.executeQuery(sql7);
				rs7.next();
				
				int frais2=frais+rs7.getInt("solde");
				PreparedStatement st6= con.prepareStatement(sql6);
				st6.setInt(1,frais2);
				
				int rs6= st6.executeUpdate();
				
		  
			
		
		    HttpSession session = request.getSession();
		    session.setAttribute("solde", solde3);
		    session.setAttribute("envoi", "reussi");
			response.sendRedirect("banque.jsp");	
			}else {
				 HttpSession session = request.getSession();
		         session.setAttribute("infos_env","faux");
			   
				response.sendRedirect("envoie.jsp");	
			}
			
		} 
		catch (Exception e) {
			 HttpSession session = request.getSession();
	         session.setAttribute("infos_env","faux");
		   
			response.sendRedirect("envoie.jsp");		
		} 
		
	
}
}

