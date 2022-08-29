<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
body{
 background-color:rgb(17, 161, 245);
 color:white;
font-family:Arial, Helvetica, sans-serif;

}
p{
color:white;
font-family:Arial, Helvetica, sans-serif;
}
</style>
</head>
<body>
<%
int num=703510473;
String url="jdbc:mysql://localhost:3306/Ablaye";
String username="root";
String password="";
Class.forName("com.mysql.jdbc.Driver");
String sql="select * from transactions where numero_exp=?";

Connection con=DriverManager.getConnection(url,username,password);
PreparedStatement st= con.prepareStatement(sql);
st.setInt(1,num);
ResultSet rs= st.executeQuery();


while(rs.next()){
	

%>

<center><p>expediteur:</p><%=rs.getInt("numero_exp") %></center>

<center><p>receveur:</p><%=rs.getInt("numero_dest") %></center>
<center><p>solde:</p><%=rs.getInt("solde") %></center>
<hr>
<%} %>

<hr>
</body>
</html>