<%@ page contentType="text/html" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>
<head>
    <title>Students List</title>
</head>
<body>

<h2>List of Students</h2>

<table border="0">
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
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td><a href="${pageContext.request.contextPath}/students/${student.id}">Details</a></td>
                <td><a href="${pageContext.request.contextPath}/students/${student.id}/edit">Edit</a></td>
                <td><a href="${pageContext.request.contextPath}/students/${student.id}/delete">Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
