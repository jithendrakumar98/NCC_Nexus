<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cadets</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }

        .ano-info {
            font-size: 18px;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #eaf2f8;
            border-left: 5px solid #3498db;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        thead {
            background-color: #3498db;
            color: #fff;
        }

        th, td {
            padding: 10px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            font-weight: bold;
            text-transform: uppercase;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        td {
            color: #2c3e50;
        }

        th:nth-child(3), td:nth-child(3) {
            text-align: center;
        }

    </style>
</head>
<body>
<!-- ANO Information -->
    <div class="ano-info">
        <strong>ANO:</strong> [[${ano}]]
    </div>
    <h1>Cadets Information</h1>
    <!-- Cadets Table -->
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