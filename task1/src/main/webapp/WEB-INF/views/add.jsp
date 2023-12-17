<%@ page contentType="text/html" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Add Student</title>
</head>
<body>
    <h2>Add Student Form</h2>



    <form:form action="store" method="post" modelAttribute="student">
        <table>
            <tr>
                <td>Name:</td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
               <td>Date Of Birth</td>
               <td>
                    <form:input type="date" path="dateOfBirth" id="dateOfBirth"/>
                    <form:errors path="dateOfBirth"/>
               </td>

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
                    <input type="submit" value="Add Student" />
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>