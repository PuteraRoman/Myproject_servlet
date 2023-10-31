<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>

    <style>
        <%@include file="../styles/main.css"%>
        .home__header{
            color: #020285;
        }
        body{
            display: flex;
            justify-content: space-evenly;
            flex-wrap: wrap;
            flex-direction: column;
            align-content: space-around;
            align-items: center;
        }
    </style>

</head>
<body>
    <%@include file="header.html"%>
    <h2 class="home__header">Welcome to awesome To-Do List!!!</h2>
</body>
</html>
