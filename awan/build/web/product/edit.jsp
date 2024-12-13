<%-- 
    Document   : edit
    Created on : 8 Dec 2024, 20.54.21
    Author     : Alma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.JDBC, java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Barang</title>
    </head>
    <body>
        <h2>Edit Barang</h2>
        
        <% 
 
            String id = request.getParameter("id");
            String nama = "";
            String stok = "";

            JDBC db = new JDBC();

            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String nama_now = request.getParameter("nama");
                String stok_now = request.getParameter("stok");
                
                if (db.isConnected) {
                    try {
                        String up_query = "UPDATE barang SET nama = ?, stok = ? WHERE id = ?";
                        db.runPreparedQuery(up_query, nama_now, stok_now, id);
                    } catch (Exception e) {
                        out.println("<p>" + e.getMessage() + "</p>");
                    } finally {
                        db.disconnect();
                    }
                } else {
                    out.println("<p>" + db.message + "</p>");
                }
            }

            if (id != null && db.isConnected) {
                try {
                    String sel_query = "SELECT * FROM barang WHERE id = ?";
                    ResultSet rs = db.getPreparedData(sel_query, id);

                    if (rs.next()) {
                        nama = rs.getString("nama");
                        stok = rs.getString("stok");
                    }
                } catch (Exception e) {
                    out.println("<p>" + e.getMessage() + "</p>");
                } finally {
                    db.disconnect();
                }
            }
        %>
        
        <form method="post" action="edit.jsp?id=<%= id %>">
            <label>ID:</label>
            <input type="text" name="id" value="<%= id %>" readonly /><br />
            
            <label>Nama Barang:</label>
            <input type="text" name="nama" value="<%= nama %>" required /><br />
            
            <label>Stok:</label>
            <input type="number" name="stok" value="<%= stok %>" required /><br />
            
            <input type="submit" value="Update" />
        </form>
    </body>
</html>
