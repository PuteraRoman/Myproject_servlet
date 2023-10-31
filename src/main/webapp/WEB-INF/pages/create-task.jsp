<%@ page import="com.softserve.itacademy.model.Priority" %>
<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new Task</title>

    <style>
        <%@include file="../styles/main.css"%>
        .create__header{
            color: #020285;
        }
        .name{
            color: #020285;
        }
        .priority{
            color: #020285;
        }
        .buttom{
            color: white;
            border-color: #020285;
            background-color: #020285;
        }
        .buttom:hover{
            color: aqua;
        }
        body{
            display: flex;
            justify-content: space-evenly;
            flex-wrap: wrap;
            flex-direction: column;
            align-content: space-around;
            align-items: center;
        }
        #title{
            color: #020285;
        }
    </style>

</head>



<body>

    <%@include file="header.html"%>
    <form action="/create-task" method="post">
        <h2 class="create__header">Create new Task</h2>
        <% String errorMessage = (String) request.getAttribute("taskExists");  %>
        <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
        <p><%= errorMessage %></p>
        <% } %>

    <table>
        <tr>
            <td>
                <p class="name">Name:</p>
            </td>

            <td>
                <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                <input type="text" id="title" name="title" placeholder="<%= request.getParameter("title")%>">
                <% } else {%>
                <input type="text" id="title" name="title">
                <% } %>
            </td>
        <tr>
            <td>
                <p class="priority">Priority:</p>
            </td>
            <td>
                <select class="priority" name="priority">
                    <option value="LOW">Low</option>
                    <option value="MEDIUM">Medium</option>
                    <option value="HIGH">High</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <input class="buttom" type="submit" value="Create">
            </td>
            <td>
                <input class="buttom" type="reset" value="Clear">
            </td>
        </tr>

    </table>
    </form>

</body>
</html>
