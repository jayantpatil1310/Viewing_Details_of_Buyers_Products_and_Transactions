<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Buyers</title>
</head>
<body>
    <h2>Buyers List</h2>
    <table border="1">
        <tr><th>Name</th><th>Email</th><th>Phone</th><th>Address</th></tr>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("buyers");
            while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("address") %></td>
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
