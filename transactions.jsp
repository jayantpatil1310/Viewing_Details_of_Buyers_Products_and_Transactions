<%@ page import="java.sql.*" %>
<html>
<head><title>Transactions</title></head>
<body>
    <h2>Transactions List</h2>
    <table border="1">
        <tr>
            <th>Transaction ID</th>
            <th>Buyer Name</th>
            <th>Product Name</th>
            <th>Date</th>
            <th>Payment Method</th>
        </tr>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("transactions");
            if (rs != null) {
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("buyer_name") %></td>
            <td><%= rs.getString("product_name") %></td>
            <td><%= rs.getDate("date") %></td>
            <td><%= rs.getString("payment_method") %></td>
        </tr>
        <%
                }
            } else {
                out.println("<tr><td colspan='5'>No transactions found.</td></tr>");
            }
        %>
    </table>
</body>
</html>

