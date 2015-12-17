<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update page</title>
</head>
<body>

<%
Class.forName("com.mysql.jdbc.Driver");
Statement st;
Connection con;
con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/b1","root","nachi_w");
st=con.createStatement();

String bname,aname,qstr,oldname;
bname=request.getParameter("ubookname");
aname=request.getParameter("authorname");
qstr=request.getParameter("qty");
oldname=request.getParameter("oldname");
out.println(bname);
int q=Integer.parseInt(qstr);

int flag=st.executeUpdate("update insertbook set bookname='"+bname+"',authorname='"+aname+"',qty='"+q+"' where bookname='"+oldname+"'");
%>
<table border="1">
<tr>
<th>bookname</th>
<th>authorname</th>
<th>qty</th>

</tr>

<%
ResultSet rs=st.executeQuery("select *from insertbook");
while(rs.next())
{
%>

<tr>
<td><%= rs.getString("bookname") %></td>
<td><%= rs.getString("authorname") %></td>
<td><%= rs.getString("qty")%></td>


</tr>
	

<%
}

%>



</table>
	


</body>
</html>