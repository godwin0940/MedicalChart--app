<%-- 
    Document   : dashboard.jsp
    Created on : 2 Jan 2026, 3:22:16?pm
    Author     : GODWIN
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Dashboard</title>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/dashboard.css">
</head>
<body>

<div class="dashboard-container">
    <h2>Patient Dashboard</h2>

    <div class="top-links">
        <a href="addPatient.jsp"> Add Patient</a>
        <a href="search.jsp">Search Patient</a>
        <a href="logout.jsp" class="logout">Logout</a>
    </div>

    <%
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/medicaldb","root","godsgif456");

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM patient");

            while(rs.next()){
    %>

    <div class="patient-card">
        <h3><%=rs.getString("name")%></h3>
        <p>BP : <%=rs.getInt("bp")%></p>
        <p>Heart : <%=rs.getInt("heart")%></p>
        <p>Fever : <%=rs.getFloat("fever")%> °C</p>

        <div class="actions">
            <a href="update.jsp?name=<%=rs.getString("name")%>">Update</a>
            <a href="delete?name=<%=rs.getString("name")%>"
               onclick="return confirm('Delete this patient?')"
               class="delete">Delete</a>
        </div>
    </div>

    <%
            }
            con.close();
        }catch(Exception e){
            out.println(e);
        }
    %>
</div>

</body>
</html>