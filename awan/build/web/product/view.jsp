<%-- 
    Document   : view
    Created on : 8 Dec 2024, 20.54.39
    Author     : Alma
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.JDBC, java.sql.ResultSet"%>
<%@page import="classes.JDBC"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1>Daftar Barang</h1>
        <table width=”80%” height=”50%” border="1">
            <tr> 
                <th >ID</th> 
                <th >Nama</th> 
                <th >Stok</th> 
            </tr> 
            <tr>
                <% 
                    JDBC db = new JDBC(); 
                    if (db.isConnected) { 
                        ResultSet rs = db.getData("select * from barang"); 
                        while (rs.next()) { 
                            out.print("<tr>"); 
                            out.print("<td>" + rs.getInt("id") + "</td>"); 
                            out.print("<td>" +rs.getString("nama")+ "</td>"); 
                            out.print("<td>" +rs.getInt("stok")+ "</td>"); 
                            out.print("<td><a href='edit.jsp?id=" + rs.getInt("id") + "' class='btn btn-dark'>Edit</a></td>");
                            out.print("</tr>"); 
                        } 
                        db.disconnect(); 
                    } else { 
                        out.print(db.message+"<br />"); 
                    } 
                %>
            </tr> 
        </table>
        <a href="add.jsp" class="btn btn-dark">Add</a>
    </body>
</html>
