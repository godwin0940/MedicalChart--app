/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.medical;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/save")
public class SavePatientServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String name = req.getParameter("name");
        int bp = Integer.parseInt(req.getParameter("bp"));
        int heart = Integer.parseInt(req.getParameter("heart"));
        float fever = Float.parseFloat(req.getParameter("fever"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/medicaldb",
                "root","godsgif456"
            );

            Statement st = con.createStatement();
            st.executeUpdate(
                "INSERT INTO patient VALUES('"+name+"',"+bp+","+heart+","+fever+")"
            );

      
            HttpSession s = req.getSession();
         

            con.close();

           
            res.sendRedirect("dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}