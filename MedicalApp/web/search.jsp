<%-- 
    Document   : search.jsp
    Created on : 2 Jan 2026, 3:38:08?pm
    Author     : GODWIN
--%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Patient</title>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/search.css">
</head>
<body>

<div class="search-container">
    <h2>Search Patient</h2>

    <form method="get">
        <input type="text" name="name" placeholder="Enter patient name" required>
        <button type="submit">Search</button>
    </form>

    <div class="result">
    <%
        String name = request.getParameter("name");

        if(name != null){
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/medicaldb","root","godsgif456");

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(
                    "SELECT * FROM patient WHERE name LIKE '%"+name+"%'");

                boolean found = false;

                while(rs.next()){
                    found = true;
    %>
                    <div class="patient-card">
                        <h3><%=rs.getString("name")%></h3>
                        <p>BP: <%=rs.getInt("bp")%></p>
                        <p>Heart: <%=rs.getInt("heart")%></p>
                        <p>Fever: <%=rs.getFloat("fever")%> °C</p>
                    </div>
    <%
                }

                if(!found){
                    out.println("<p class='not-found'>No patient found</p>");
                }

                con.close();
            }catch(Exception e){
                out.println(e);
            }
        }
    %>
    </div>

    <a href="dashboard.jsp" class="back">? Back to Dashboard</a>
</div>

</body>
</html>