<%-- 
    Document   : login.jsp
    Created on : 4 Jan 2026, 8:18:17 pm
    Author     : GODWIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/login.css">
</head>
<body>

<div class="login-container">
    <h2>Medical App Login</h2>

    <form action="login" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Login</button>
    </form>

</div>

</body>
</html>

