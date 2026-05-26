<%-- 
    Document   : logout.jsp
    Created on : 4 Jan 2026, 8:34:40 pm
    Author     : GODWIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.invalidate();
response.sendRedirect("login.jsp");
%>