<%-- 
    Document   : index
    Created on : Sep 17, 2022, 11:02:31 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Create User</h1>
        <form name="userLogin" method="POST" action="./CreateUserServlet">
            Full Name: <input type="text" name="full_name"> <br><br>
            Age: <input type="text" name="age"> <br><br>
            NIC: <input type="text" name="nic" > <br><br>
            Email: <input type="email" name="email" > <br><br>
            UserName: <input type="text" name="username" ><br><br>
            Password: <input type="password" name="password"><br><br>
            <input type="submit" value="Register" />
        </form>

        <h1>Login User</h1>
        <form name="login" method="POST" action="./LoginUserServlet">
            UserName: <input type="text" name="username" ><br><br>
            Password: <input type="password" name="password"><br><br>
            <input type="submit" value="Register" />
        </form>

        <h1>Management Login</h1>
        <form name="managementLogin" method="POST" action="./LoginManagementServlet">
            Username: <input type="text" name="username" ><br><br>
            Password: <input type="password" name="password"><br><br>
            <input type="submit" value="Login" />
        </form>
        <h1>Staff Create</h1>
        <form name="staffCreate" method="POST" action="./CreateStaffServlet">
            Full Name: <input type="text" name="full_name"> <br><br>
            Age: <input type="text" name="age"> <br><br>
            NIC: <input type="text" name="nic" > <br><br>
            Email: <input type="email" name="email" > <br><br>
            UserName: <input type="text" name="username" ><br><br>
            Password: <input type="password" name="password"><br><br>
            Grade: 
            <select name="grade">
                <option value="">Please Select</option>
                <option value="1">Grade 1</option>
                <option value="2">Grade 2</option>
            </select><br><br>
            <input type="submit" value="Register" />
        </form>
    </body>
</html>
