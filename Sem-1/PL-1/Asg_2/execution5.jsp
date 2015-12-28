<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
Statement stmt;
Connection conn;
Class.forName("com.mysql.jdbc.Driver"); 
conn = DriverManager.getConnection("jdbc:mysql://192.168.5.101:3306/te3265db","te3265","te3265"); 
stmt= conn.createStatement(); 
ResultSet rs=stmt.executeQuery(" select prof_name from professors where dept_id is null;"); 
%>

<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<%while (rs.next()) {%>
<TH> <td>DEPT ID</td>
	<td> Number of working professionals</td>td>
</TH>
<TR>
<TD><%=rs.getInt(1)%></TD>
<TD><%=rs.getInt(2)%></TD>
</TR>
<% } %>

<%
// close all the connections.
rs.close();
stmt.close();
conn.close();
%>>