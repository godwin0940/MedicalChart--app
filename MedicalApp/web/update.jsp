<%-- 
    Document   : update.jsp
    Created on : 2 Jan 2026, 7:36:31?pm
    Author     : GODWIN
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Update Patient</title>
<link rel="stylesheet"
      href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<%
String name = request.getParameter("name");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/medicaldb","root","godsgif456");

Statement st = con.createStatement();
ResultSet rs =
st.executeQuery("SELECT * FROM patient WHERE name='"+name+"'");

rs.next();
%>

<div class="card">
<h2>Update Patient</h2>

<form action="update" method="post">
<input type="hidden" name="name" value="<%=name%>">

<input type="number" name="bp"
 value="<%=rs.getInt("bp")%>" required>

<input type="number" name="heart"
 value="<%=rs.getInt("heart")%>" required>

<input type="text" name="fever"
 value="<%=rs.getFloat("fever")%>" required>

<button type="submit">Update</button>
</form>
</div>

<% con.close(); %>

</body>
</html>
