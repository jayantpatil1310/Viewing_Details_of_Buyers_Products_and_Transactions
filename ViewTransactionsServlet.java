package servlet;

import db.DBConnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewTransactionsServlet")
public class ViewTransactionsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (Connection con = DBConnection.getConnection()) {
            out.println("✅ Connected to DB<br>");

            Statement stmt = con.createStatement();
            String sql = "SELECT t.id, b.name AS buyer_name, p.name AS product_name, " +
             "t.date, t.payment_method " +
             "FROM transactions t " +
             "JOIN buyers b ON t.buyer_id = b.id " +
             "JOIN products p ON t.product_id = p.id";

            ResultSet rs = stmt.executeQuery(sql);

            if (!rs.isBeforeFirst()) {
                out.println("⚠️ No transactions found.");
                return;
            }

            out.println("✅ Transactions found. Forwarding to JSP...<br>");
            request.setAttribute("transactions", rs);
            RequestDispatcher rd = request.getRequestDispatcher("transactions.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            out.println("❌ Error occurred:<br>");
            e.printStackTrace(out);  // print full error in browser
        }
    }
}
