<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance</title>
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
        color: #4472C4;
    }
    .summary {
        margin: 20px auto;
        padding: 15px;
        width: 90%;
        max-width: 600px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .summary span {
        display: block;
        margin-bottom: 10px;
        font-size: 16px;
    }
    .summary .percentage {
        font-size: 18px;
        font-weight: bold;
        color: #4472C4;
    }
    table {
        width: 90%;
        max-width: 800px;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #4472C4;
        color: white;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .footer {
        text-align: center;
        margin: 20px 0;
        font-size: 14px;
        color: #777;
    }
</style>
</head>
<body>
<h1>Attendance Report</h1>
<div class="summary">
    <span>Total: [[${total}]]</span>
    <span>Present: [[${pr}]]</span>
    <span>Absent: [[${ab}]]</span>
    <span class="percentage">Percentage: [[${per}]]%</span>
</div>
<table>
    <thead>
        <tr>
            <th>S.no</th>
            <th>Session</th>
            <th>Date</th>
            <th>P/A</th>
        </tr>
    </thead>
    <tbody>
        <tr th:each="ar, status : ${ar}">
            <td th:text="${status.index + 1}"></td>
            <td th:text="${ar.session}"></td>
            <td th:text="${arext[status.index][1]}"></td>
            <td th:text="${arext[status.index][0]}"></td>
        </tr>
    </tbody>
</table>

</body>
</html>