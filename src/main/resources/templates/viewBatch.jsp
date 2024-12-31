<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Batch Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
        color: #333;
    }
    h1 {
        text-align: center;
        margin: 20px 0;
        color: #4CAF50;
    }
    .batch-info {
        text-align: center;
        margin: 20px 0;
        font-size: 20px;
        font-weight: bold;
        color: #555;
    }
    table {
        width: 90%;
        max-width: 1200px;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 12px 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #4474c4;
        color: white;
        text-transform: uppercase;
        font-size: 14px;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:nth-child(odd) {
        background-color: #fff;
    }
    td {
        font-size: 14px;
        color: #555;
    }
    .footer {
        text-align: center;
        margin-top: 20px;
        font-size: 12px;
        color: #888;
    }
</style>
</head>
<body>
<div class="batch-info">
    [[${batch}]] - Cadets
</div>
<table>
    <thead>
        <tr>
            <th>S.No</th>
            <th>Name</th>
            <th>Regimental<br>Number</th>
            <th>Rank</th>
            <th>Attendance</th>
            <th>Number</th>
            <th>ANO</th>
            <th>Password</th>
        </tr>
    </thead>
    <tbody>
        <tr th:each="cdt, status : ${cadets}">
            <td th:text="${status.index + 1}"></td>
            <td th:text="${cdt.name}"></td>
            <td th:text="${cdt.username}"></td>
            <td th:text="${cdt.rank}"></td>
            <td th:text="${att[status.index]}"></td>
            <td th:text="${cdt.number}"></td>
            <td th:text="${cdt.superior}"></td>
            <td th:text="${cdt.password}"></td>
        </tr>
    </tbody>
</table>
</body>
</html>