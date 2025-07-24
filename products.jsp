<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>Products List</title></head>
<body>
    <h2>✅ Products List</h2>

    <%
        ResultSet rs = (ResultSet) request.getAttribute("products");
        if (rs == null) {
            out.println("❌ ResultSet is NULL.");
        } else {
    %>
    <table border="1">
        <tr>
            <th>Id</th><th>Name</th><th>Unit_Price</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getDouble("unit_price") %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        }  // end of null check
    %>
</body>
</html>
