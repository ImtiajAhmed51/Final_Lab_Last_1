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
                <td><form:input path="name" id="name"/></td>
                <form:errors path="name"/>
            </tr>
            <tr>
                <td>Email:</td>
                <td><form:input path="email" id="email"/></td>
                <form:errors path="email"/>
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
                    <form:radiobutton path="gender" id="gender" value="MALE" label="Male" />
                    <form:radiobutton path="gender" id="gender" value="FEMALE" label="Female" />
                    <form:errors path="gender"/>
                </td>
            </tr>
            <tr>
                <td>Quota:</td>
                <td><form:input path="quota" id="quota"/></td>
                 <form:errors path="quota"/>
            </tr>
            <tr>
                <td>Country:</td>
                <td><form:input path="country" id="quota"/></td>
                <form:errors path="country"/>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Add Student" />
                </td>
            </tr>
        </table>
    </form:form>
    <a href="${pageContext.request.contextPath}">Back to Home</a>
</body>
</html>