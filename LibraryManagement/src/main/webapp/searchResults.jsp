<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        font-family: Arial, sans-serif;
    }
    
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    
    th {
        background-color: #4CAF50;
        color: white;
        font-weight: bold;
    }
    
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
    tr:hover {
        background-color: #ddd;
    }
    
    button {
        padding: 5px 10px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }
    
    button:hover {
        opacity: 0.8;
    }
    
    .borrow-btn {
        background-color: #008CBA;
        color: white;
    }
    
    .disabled-btn {
        background-color: #aaa;
        color: white;
        cursor: not-allowed;
    }
</style>


<%
    String url = "jdbc:mysql://localhost:3306/library";
    String user = "root";
    String password = "Shakthi2004#";

    String keyword = request.getParameter("keyword");
    String category = request.getParameter("category");

    if (keyword == null || keyword.trim().isEmpty() || category == null) {
        out.println("<p>Please enter a valid search keyword.</p>");
        return;
    }

    String column = "title";
    if ("author".equals(category)) column = "author";
    else if ("category".equals(category)) column = "category";

    try (
        Connection conn = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM books WHERE " + column + " LIKE ?")
    ) {
        stmt.setString(1, "%" + keyword + "%");

        try (ResultSet rs = stmt.executeQuery()) {
            if (!rs.isBeforeFirst()) {
                out.println("<p>No books found.</p>");
            } else {
                out.println("<table border='1'>");
                out.println("<tr><th>Title</th><th>Author</th><th>Category</th><th>ISBN</th><th>Availability</th></tr>");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("title") + "</td>");
                    out.println("<td>" + rs.getString("author") + "</td>");
                    out.println("<td>" + rs.getString("category") + "</td>");
                    out.println("<td>" + rs.getString("isbn") + "</td>");
                    out.println("<td>" + rs.getString("availability") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
