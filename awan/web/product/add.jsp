<%-- 
    Document   : add
    Created on : 8 Dec 2024, 20.53.55
    Author     : Alma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.JDBC"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="add.jsp"> 
            Nama ID: <input type="text" name="id" /><br /> 
            Nama Produk: <input type="text" name="nama" /><br /> 
            Nama Stok: <input type="text" name="stok" /><br /> 
            <input type="submit" value="Tambah" /> 
        </form>
        <%
            
            JDBC db = new JDBC(); 
            if (db.isConnected) { 
                String id = request.getParameter("id"); 
                String nama = request.getParameter("nama"); 
                String stok = request.getParameter("stok"); 
                db.runQuery("insert into barang (id, nama, stok) values ('" + id + "', '" + nama + "', '" + stok + "')"); 
                db.disconnect(); 

            } 
        %>
    </body>
</html>
