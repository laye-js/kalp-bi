<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String url="jdbc:mysql://localhost:3306/amba";
String username="root";
String password="";
String sql="Select * from person";
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(url,username,password);
Statement St= con.createStatement();
ResultSet rs= St.executeQuery(sql);
rs.next();
%>
id: <%=rs.getString(1) %>
name: <%=rs.getString(2) %>
</body>
</html>