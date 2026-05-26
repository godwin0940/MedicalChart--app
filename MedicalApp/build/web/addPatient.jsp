<%-- 
    Document   : addPatient.jsp
    Created on : 2 Jan 2026, 3:20:52 pm
    Author     : GODWIN
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Patient</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/addpatient.css">
</head>
<body>

<div class="container">
    <h2>Add Patient Details</h2>

    <form action="<%=request.getContextPath()%>/save" method="post">
        <label>Patient Name</label>
        <input type="text" name="name" required>

        <label>Blood Pressure</label>
        <input type="number" name="bp" required>

        <label>Heart Rate</label>
        <input type="number" name="heart" required>

        <label>Fever (°C)</label>
        <input type="text" name="fever" required>

        <button type="submit">Save Patient</button>
    </form>

    <a class="back" href="dashboard.jsp">← Back to Dashboard</a>
</div>

</body>
</html>
