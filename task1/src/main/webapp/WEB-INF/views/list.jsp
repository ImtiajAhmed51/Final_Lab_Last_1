<%@ page contentType="text/html" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>
<head>
    <title>Students List</title>
    <style>
      .students-table {
        width: 100%;
        border-collapse: collapse;
      }
      .students-table th, .students-table td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: left;
      }
      .students-table th {
        background-color: #04AA6D;
        color: white;
      }
      .students-table tr:nth-child(even) {
        background-color: #f2f2f2;
      }
      .students-table tr:hover {
        background-color: #ddd;
      }
    </style>
</head>
<body>

<h2>List of Students</h2>

<table class="students-table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Details</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.getId()}</td>
                <td>${student.getName()}</td>
                <td><a href="${pageContext.request.contextPath}/students/${student.getId()}">Details</a></td>
                <td><a href="${pageContext.request.contextPath}/students/${student.getId()}/edit">Edit</a></td>
                <td><a href="${pageContext.request.contextPath}/students/${student.getId()}/delete">Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    <a href="${pageContext.request.contextPath}">Back to Home</a>

</body>
</html>
