<%@ page contentType="text/html" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Student Details</title>
</head>
<body>

<h2>Student Details</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <td>${student.getId()}</td>
        </tr>
        <tr>
            <th>Name</th>
            <td>${student.getName()}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>${student.getEmail()}</td>
        </tr>
        <tr>
            <th>Date Of Birth</th>
            <td>${student.getDateOfBirth()}</td>
        </tr>
        <tr>
            <th>Gender</th>
            <td>${student.getGender()}</td>
        </tr>
        <tr>
            <th>Quota</th>
            <td>${student.getQuota()}</td>
        </tr>
        <tr>
            <th>Country</th>
            <td>${student.getCountry()}</td>
        </tr>
    </table>
    <br>
    <a href="${pageContext.request.contextPath}/students">Back to List</a>

</body>
</html>