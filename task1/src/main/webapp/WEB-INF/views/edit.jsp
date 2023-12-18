<%@ page contentType="text/html" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Edit Student</title>
</head>
<body>
<h2>Edit Student Details</h2>
    <form:form modelAttribute="student" action="${pageContext.request.contextPath}/save" method="post">
         <table>
                <tr>
                    <td>ID:</td>
                    <td><form:input path="id" readonly="true" /></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><form:input path="name" /></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><form:input path="email" /></td>
                </tr>
                <tr>
                    <td>Date Of Birth:</td>
                    <td><form:input path="dateOfBirth" type="date" /></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <form:radiobutton path="gender" value="MALE" label="Male" />
                        <form:radiobutton path="gender" value="FEMALE" label="Female" />
                    </td>
                </tr>
                <tr>
                    <td>Quota:</td>
                    <td><form:input path="quota" /></td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td><form:input path="country" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Save"/>
                    </td>
                </tr>
            </table>
    </form:form>
    <a href="${pageContext.request.contextPath}/students">Back to List</a>

</body>
</html>