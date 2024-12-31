<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cadets</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        thead {
            background-color: #007bff;
            color: #fff;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            text-transform: uppercase;
            font-size: 14px;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        td {
            font-size: 14px;
        }

        th:nth-child(3), td:nth-child(3) {
            text-align: center;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>S.No</th>
                <th>NAME</th>
                <th>REGIMENTAL<br>NUMBER</th>
                <th>Rank</th>
                <th>Number</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="cdt, status : ${cadets}">
                <td th:text="${status.index + 1}"></td>
                <td th:text="${cdt.name}"></td>
                <td th:text="${cdt.username}"></td>
                <td th:text="${cdt.rank}"></td>
                <td th:text="${cdt.number}"></td>
            </tr>
        </tbody>
    </table>
</body>
</html>