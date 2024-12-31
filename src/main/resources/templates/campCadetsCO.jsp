<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cadets</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #4472C4;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4472C4;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

    </style>
</head>
<body>
    <h1>Cadets List</h1>

    <table>
        <thead>
            <tr>
                <th>S.No</th>
                <th>NAME</th>
                <th>REGIMENTAL<br>NUMBER</th>
                <th>Rank</th>
                <th>Number</th>
                <th>College</th>
                <th>ANO</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="cdt, status : ${cadets}">
                <td th:text="${status.index + 1}"></td>
                <td th:text="${cdt.name}"></td>
                <td th:text="${cdt.username}"></td>
                <td th:text="${cdt.rank}"></td>
                <td th:text="${cdt.number}"></td>
                <td th:text="${cdt.college}"></td>
                <td th:text="${cdt.superior}"></td>
            </tr>
        </tbody>
    </table>
</body>
</html>