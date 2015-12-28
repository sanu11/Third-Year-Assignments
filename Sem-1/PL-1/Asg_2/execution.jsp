<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<input type="submit"/>
</form>
</body>
</html>
-->
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
Statement stmt;
Connection conn;
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://192.168.5.101:3306/te3109db","te3109","te3109"); 
stmt= conn.createStatement(); 
ResultSet rs=stmt.executeQuery("select prof_name,dept_name,city,salary from professors natural join departments;"); 
%>

<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<%while (rs.next()) {%>
<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getInt(4)%></TD>
</TR>
<% } %>

<%
// close all the connections.
rs.close();
stmt.close();
conn.close();
%>