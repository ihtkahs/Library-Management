<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="dashboard.css">
    <script>
        function loadContent(page) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", page, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("content").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>

    <div class="sidebar">
        <h2>Welcome, <%= session.getAttribute("fname") %></h2>
        <ul>
            <li><a href="#" onclick="loadContent('search.jsp')">🔍 Search Books</a></li>
            <li><a href="#" onclick="loadContent('borrowed.jsp')">📚 Borrowed Books</a></li>
            <li><a href="#" onclick="loadContent('return.jsp')">🔄 Return Books</a></li>
            <li><a href="#" onclick="loadContent('fines.jsp')">💰 Fines & Payments</a></li>
            <li><a href="logout.jsp">🚪 Logout</a></li>
        </ul>
    </div>

    <div class="content" id="content">
        <h1>Dashboard</h1>
        <p>Welcome to your library dashboard.</p>
    </div>

</body>
</html>