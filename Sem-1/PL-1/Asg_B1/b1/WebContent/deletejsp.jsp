<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Statement st;
Connection con;
Class.forName("com.mysql.jdbc.Driver");

con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/b1","root","nachi_w");
st=con.createStatement();

String bname,aname,q;
bname = request.getParameter("deletename");
aname = request.getParameter("authorname");

int flag=st.executeUpdate("delete from insertbook where bookname = '"+bname+"'");
%>


</body>
</html>