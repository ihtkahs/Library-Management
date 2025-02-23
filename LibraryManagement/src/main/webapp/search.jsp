<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    function searchBooks() {
        var keyword = document.getElementById("searchInput").value.trim();
        var category = document.getElementById("searchCategory").value;

        if (keyword === "") {
            document.getElementById("searchResults").innerHTML = "";
            return;
        }

        var xhr = new XMLHttpRequest();
        xhr.open("GET", "searchResults.jsp?keyword=" + encodeURIComponent(keyword) + "&category=" + encodeURIComponent(category), true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                document.getElementById("searchResults").innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }
</script>

<div id="searchContainer">
    <select id="searchCategory">
        <option value="title">Book Title</option>
        <option value="author">Author</option>
        <option value="category">Category</option>
    </select>
    <input type="text" id="searchInput" placeholder="Enter keyword..." onkeyup="searchBooks()">
    <button onclick="searchBooks()">Search</button>
</div>

<div id="searchResults">
    <!-- Search results will be displayed here -->
</div>
