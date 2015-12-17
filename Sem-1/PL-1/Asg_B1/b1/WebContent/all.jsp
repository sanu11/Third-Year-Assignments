<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
    <%@ page import ="javax.sql.*" %>
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

ResultSet rs=st.executeQuery("select avg(qty) from insertbook");
while (rs.next())
{
out.println("avg of qty is -->"+rs.getString("avg(qty)"));	


}

ResultSet rrs1=st.executeQuery("select count(qty) from insertbook");
while(rrs1.next())
{
out.println("----count of book table is-->"+rrs1.getString("count(qty)"));
}

%>


</body>
</html>