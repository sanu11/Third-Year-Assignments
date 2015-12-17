<%@page import="javax.xml.bind.ParseConversionEvent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
	<%@ page import="javax.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Statement st;
Connection con;

con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/b1", "root", "nachi_w");
st = con.createStatement();

String bbookname,aauthorname,qtystr;
int qq;

bbookname=request.getParameter("bookname");
aauthorname=request.getParameter("authorname");
qtystr=request.getParameter("quantity");
qq=Integer.parseInt(qtystr);


out.println("bookname is-->"+bbookname+"<br>");
out.println("authorname is -->"+aauthorname);


int done = st.executeUpdate("insert into insertbook values('"+bbookname+"','"+aauthorname+"','"+qq+"')");
if(done>0)
{
	%>
<br>

<%
out.println("values inserted");	
}


%>

<table border="1">

<%

ResultSet rs= st.executeQuery("select *from insertbook");
%>

<tr>
<th>bookname</th>
<th>author</th>
<th>qty</th>

</tr>

<%
while(rs.next())
{
%>

<tr>
<td><%= rs.getString("bookname") %></td>
<td><%= rs.getString("authorname") %></td>
<td><%= rs.getInt("qty") %></td>
</tr>

<%
}
%>









</table>





</body>
</html>