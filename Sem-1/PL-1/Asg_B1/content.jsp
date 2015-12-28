<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>SKY AWARDS</title>
 <link rel="shortcut icon" href="download.ico" />
  
        <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      @import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
	 background-repeat: no-repeat;
    background-attachment: fixed;
    background-image: url(oscar.jpg) ;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(20% - 50px);
	left: calc(20% - 0px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: calc(50% - 75px);
	left: calc(50% - 50px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=button]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover{
	opacity: 0.8;
}

.login input[type=button]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=button]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
    </style>

    
        <script src="js/prefixfree.min.js"></script>

    
  </head>

<body>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 
<%
if (request.getParameter("query 1") != null) 
{
	System.out.println("query 1");
%>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
<table border="5" style="width:300%;font-weight: bold;color:white;">
  <tr><th>TITLE</th><th>CHARACTER</th></tr>


<% 
Class.forName("com.mysql.jdbc.Driver"); 
// create connection
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/oscar","root","mysql"); 

Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select title,charac from movie inner join role using (movie_id);"); 
while(rs.next())
{
String title=rs.getString("title");
String charac=rs.getString("charac");

%>
<tr>
  <td><%=title%></td>
  <td><%=charac%></td>
</tr>

<%
}
%>
<FORM action="gui.html" method="post">
<P>
		<INPUT Type="submit"  Value="home" > 
		
</P>
</FORM>
</table>
</div>
<%
}
%>


<% 
if (request.getParameter("query 2") != null) 
{

%>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
<table border="5" style="width:300%;font-weight: bold;color:white;">
  <tr><th>TITLE</th><th>C_ID</th><th>CATEGORY</th></tr>


<% 
Class.forName("com.mysql.jdbc.Driver"); 
// create connection
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/oscar","root","mysql"); 

Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select title,c_id,category from movie left join movie_award using(movie_id) left join award_category using (c_id);"); 
while(rs.next())
{
String title=rs.getString("title");
int c_id=rs.getInt("c_id");
String cat=rs.getString("category");
%>
<tr>
  <td><%=title%></td>
  <td><%=c_id%></td>
  <td><%=cat%></td>
</tr>

<%
}
%>
<FORM action="gui.html" method="post">
<P>
		<INPUT Type="submit"  Value="home" > 
		
</P>
</FORM>
</table>
</div>
<%
}
%>


<%
if (request.getParameter("query 3") != null) 
{

%>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
<table border="5" style="width:300%;font-weight: bold;color:white;">
  <tr><th>A_ID</th><th>NAME</th><th>TITLE</th></tr>


<% 
Class.forName("com.mysql.jdbc.Driver"); 
// create connection
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/oscar","root","mysql"); 

Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select a_id,name,title from movie right join role using(movie_id) right join actor using (a_id);"); 
while(rs.next())
{
int a_id=rs.getInt("a_id");
String name=rs.getString("name");
String title=rs.getString("title");
%>
<tr>
 
  <td><%=a_id%></td>
  <td><%=name%></td>
  <td><%=title%></td>
 
</tr>

<%
}
%>
<FORM action="gui.html" method="post">
<P>
		<INPUT Type="submit"  Value="home" > 
		
</P>
</FORM>
</table>
</div>
<%
}
%>


<%
if (request.getParameter("query 4") != null) 
{

%>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
<table border="5" style="width:300%;font-weight: bold;color:white;">
  <tr><th>MOVIE_ID</th><th>TITLE</th><th>EARNINGS</th></tr>


<% 
Class.forName("com.mysql.jdbc.Driver"); 
// create connection
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/oscar","root","mysql"); 

Statement st= con.createStatement(); 
st.executeUpdate("update movie set earnings = earnings + 0.1*earnings where earnings >= 200;");
ResultSet rs=st.executeQuery("select * from movie;"); 
while(rs.next())
{
int id=rs.getInt("movie_id");
String title=rs.getString("title");
int earn=rs.getInt("earnings");
%>
<tr>
  <td><%=id%></td>
  <td><%=title %></td>
  <td><%=earn %></td>
</tr>

<%
}
%>
<FORM action="gui.html" method="post">
<P>
		<INPUT Type="submit"  Value="home" > 
		
</P>
</FORM>
</table>
</div>
<%
}
%>


<%
if (request.getParameter("query 5") != null) 
{

%>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
<table border="5" style="width:300%;font-weight: bold;color:white;">
  <tr><th>MOVIE_ID</th><th>TITLE</th></tr>


<% 
Class.forName("com.mysql.jdbc.Driver"); 
// create connection
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/oscar","root","mysql"); 

Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select distinct movie_id,title from movie_award inner join movie using (movie_id);"); 
while(rs.next())
{
int movie_id=rs.getInt("movie_id");
String title=rs.getString("title");
%>
<tr>
  <td><%=movie_id%></td>
  <td><%=title%></td>
</tr>

<%
}
%>
<FORM action="gui.html" method="post">
<P>
		<INPUT Type="submit"  Value="home" > 
		
</P>
</FORM>
</table>
</div>
<%
}
%>




<%
if (request.getParameter("query 6") != null) 
{

%>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
<table border="5" style="width:300%;font-weight: bold;color:white;">
  <tr><th>count_movies</th></tr>


<% 
Class.forName("com.mysql.jdbc.Driver"); 
// create connection
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/oscar","root","mysql"); 

Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select COUNT(*) as count_movies from movie where earnings < 100;"); 
while(rs.next())
{
int count=rs.getInt("count_movies");
%>
<tr>
  <td><%=count%></td>
  
</tr>

<%
}
%>
<FORM action="gui.html" method="post">
<P>
		<INPUT Type="submit"  Value="home" > 
		
</P>
</FORM>
</table>
</div>
<%
}
%>



<%
if (request.getParameter("query 7") != null) 
{

%>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
<table border="5" style="width:300%;font-weight: bold;color:white;">
  <tr><th>MOVIE_ID</th><th>TITLE</th><th>EARNINGS</th></tr>


<% 
Class.forName("com.mysql.jdbc.Driver"); 
// create connection
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/oscar","root","mysql"); 

Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from movie ORDER BY earnings;"); 
while(rs.next())
{
int id=rs.getInt("movie_id");
String title=rs.getString("title");
int earn=rs.getInt("earnings");
%>
<tr>
  <td><%=id%></td>
  <td><%=title %></td>
  <td><%=earn %></td>
</tr>
<%
}
%>
<FORM action="gui.html" method="post">
<P>
		<INPUT Type="submit"  Value="home" > 
		
</P>
</FORM>
</table>
</div>
<%
}
%>



<%
if (request.getParameter("query 8") != null) 
{

%>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
<table border="5" style="width:300%;font-weight: bold;color:white;">
  <tr><th>MOVIE_ID</th><th>TITLE</th><th>NOMINATIONS</th></tr>


<% 
Class.forName("com.mysql.jdbc.Driver"); 
// create connection
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/oscar","root","mysql"); 

Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select movie_id,title,count(c_id) as no_of_nominations from movie inner join movie_award using (movie_id) group by title;"); 
while(rs.next())
{
int id=rs.getInt("movie_id");
String title=rs.getString("title");
int earn=rs.getInt("no_of_nominations");
%>
<tr>
  <td><%=id%></td>
  <td><%=title %></td>
  <td><%=earn %></td>
</tr>
<%
}
%>
<FORM action="gui.html" method="post">
<P>
		<INPUT Type="submit"  Value="home" > 
		
</P>
</FORM>
</table>
</div>
<%
}
%>



<%
if (request.getParameter("query 9") != null) 
{
	System.out.println("query 9");
%>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
<table border="5" style="width:300%;font-weight: bold;color:white;">
  <tr><th>MOVIE_ID</th><th>TITLE</th><th>EARNINGS</th></tr>

<% 
Class.forName("com.mysql.jdbc.Driver"); 
// create connection
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/oscar","root","mysql"); 

Statement st= con.createStatement(); 
st.executeUpdate("create index earn on movie(earnings);");
ResultSet rs=st.executeQuery("select * from movie where earnings < 100;"); 
while(rs.next())
{
int id=rs.getInt("movie_id");
String title=rs.getString("title");
int earn=rs.getInt("earnings");
%>
<tr>
  <td><%=id%></td>
  <td><%=title %></td>
  <td><%=earn %></td>
</tr>
<%
}
%>
<FORM action="gui.html" method="post">
<P>
		<INPUT Type="submit"  Value="home" > 
		
</P>
</FORM>
</table>
</div>
<%
}
%>



<%
if (request.getParameter("query 10") != null) 
{

%>
<div class="body"></div>
<div class="grad"></div>
<div class="header">
<table border="5" style="width:300%;font-weight: bold;color:white;">
  <tr><th>MOVIE_ID</th><th>C_ID</th></tr>

<% 
Class.forName("com.mysql.jdbc.Driver"); 
// create connection
java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/oscar","root","mysql"); 

Statement st1= con1.createStatement(); 
st1.executeUpdate("create index composite2 on movie_award(c_id,movie_id desc);");
ResultSet rs=st1.executeQuery("select * from movie_award where c_id=1 and movie_id > 20;"); 
while(rs.next())	
{
int id=rs.getInt("movie_id");
int cid=rs.getInt("c_id");
%>
<tr>
  <td><%=id%></td>
  <td><%=cid %></td>
</tr>
<%
	}
%>
<FORM action="gui.html" method="post">
<P>
		<INPUT Type="submit"  Value="home" >		
</P>
</FORM>
</table>
</div>
<%
}
%>
<%
if (request.getParameter("query 11") != null) 
{
	System.out.println("query 11");
	%>
	<div class="body"></div>
<div class="grad"></div>
<div class="header">
	<FORM action="insert123.html" method="post">
	<P>
			<INPUT Type="submit"  Value="home" >		
	</P>
	</FORM>
	<%	
}
%>
</div>
</body>
</html>