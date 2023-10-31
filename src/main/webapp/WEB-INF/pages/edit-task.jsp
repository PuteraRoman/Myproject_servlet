<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page import="com.softserve.itacademy.model.Priority" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit existing Task</title>

    <style>
        <%@include file="../styles/main.css"%>
        .object__id{
            width: 20px;
            border:none;
            color: #020285;
        }
        .edit__header{
            color: #020285;
        }
        .edit__table{
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
        #title{
            color: #020285;
        }
        .edit__select{
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
        .edit__header{
            color: #020285;
        }
    </style>
    <%@include file="header.html"%>
</head>
<body>

    <form action="/edit-task" method="post">
        <h2 class="edit__header">Update Task</h2>
        <% String errorMessage = (String) request.getAttribute("taskExists");  %>
        <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
        <p><%= errorMessage %></p>
        <% } %>

        <%
            Task task =(Task) request.getAttribute("task");
        %>

        <table class="edit__table">
            <tr>
                <td>
                    <label class="header__edit" for="id">Id:</label>
                    <input class="object__id" type="text" id="id" name="id" value="<%=task.getId()%>" disabled>
                </td>

            </tr>

            <tr>
                <td>
                    <p>Name:</p>
                </td>

                <td>
                    <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                    <input type="text" id="title" name="title" placeholder="<%= request.getParameter("title")%>"value="<%=task.getTitle()%>">
                    <% } else {%>
                    <input type="text" id="title" name="title" value="<%=task.getTitle()%>">
                    <% } %>
                </td>
            <tr>
                <td>
                    <p>Priority:</p>
                </td>
                <td>
                    <select class="edit__select" name="priority" value="<%=task.getPriority()%>">
                        <option value="LOW">Low</option>
                        <option value="MEDIUM">Medium</option>
                        <option value="HIGH">High</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input class="buttom" type="submit" value="Update">
                </td>
                <td>
                    <input class="buttom" type="reset" value="Clear">
                </td>
            </tr>

        </table>
    </form>

</body>
</html>
