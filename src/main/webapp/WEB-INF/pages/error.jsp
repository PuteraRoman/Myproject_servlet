<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>

    <style>
        <%@include file="../styles/main.css"%>
    </style>

</head>
<body>
<%@include file="header.html"%>
<br> <br>

<h1>
    Error
</h1>
<p><%= request.getAttribute("errorMessage") %></p>







</body>
</html>
