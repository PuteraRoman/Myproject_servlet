<%@ page import="com.softserve.itacademy.model.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read existing Task</title>

    <style>
        body{
            display: flex;
            justify-content: space-evenly;
            flex-wrap: wrap;
            flex-direction: column;
            align-content: space-around;
            align-items: center;
        }
        td{
            color: #020285;
        }
        .edit__header{
            color: #020285;
        }
    </style>

</head>
<body>

    <%@include file="header.html"%>
        <h1 class="edit__header">Read existing Task </h1>
    <%
        Task task = (Task)request.getAttribute("task");
    %>

<table>
    <tr>
        <td>
            Id:
        </td>
        <td><b>
            <%=task.getId()%>
            </b>
        </td>
    </tr>
    <tr>
        <td>
            Title:
        </td>
        <td><b>
            <%=
                task.getTitle()
            %>
            </b>
        </td>
    </tr>
    <tr>
        <td>
            Priority:
        </td>
        <td><b>
            <%=
                task.getPriority()
            %>
            </b>
        </td>
    </tr>
</table>



</body>
</html>
