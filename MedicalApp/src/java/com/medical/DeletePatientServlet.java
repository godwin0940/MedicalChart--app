/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.medical;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/delete")
public class DeletePatientServlet extends HttpServlet {

protected void doGet(HttpServletRequest req, HttpServletResponse res)
throws IOException {

String name = req.getParameter("name");

try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/medicaldb","root","godsgif456");

Statement st = con.createStatement();

String sql =
"DELETE FROM patient WHERE name='"+name+"'";

st.executeUpdate(sql);
con.close();

res.sendRedirect("dashboard.jsp");

}catch(Exception e){
e.printStackTrace();
}
}
}