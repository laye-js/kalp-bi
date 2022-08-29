package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class LoginDao {
	        String sql="select * from client where numero=? and mdp=?";
			String url = "jdbc:mysql://localhost:3306/Ablaye";
		    String username = "root";
		    String password= "" ;
		    
           public boolean check(int numero,String pass) {
        	   
			        	   try {
							                      Class.forName("com.mysql.jdbc.Driver");
							                      Connection con =DriverManager.getConnection(url,username,password);
							                      PreparedStatement st = con.prepareStatement(sql);
							                      st.setInt(1, numero);
							                      st.setString(2, pass);
							                      ResultSet rs = st.executeQuery();
							                      if(rs.next()) {
							                    	      return true;
							                      }
			           }
			        	   
			        	   
			           catch(Exception e) {
			        	              e.printStackTrace();	   
			           }
			        
			           return false;	   
			        	   
           }	   
}
