<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Running Attendance Session</title>
</head>
<body>
<table>
            <thead>
                <tr>
                    <th>S.no</th>
                    <th>Name</th>
                    
                </tr>
            </thead>
            <tbody>
                <tr th:each="batch, status : ${batches}">
                    <td th:text="${status.index + 1}"></td>
                    <td th:text="${batch}"></td>
                    
                </tr>
            </tbody>
        </table>
</body>
</html>