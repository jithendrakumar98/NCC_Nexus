<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Current Absents</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
        color: #333;
        line-height: 1.6;
    }

    h1 {
        color: #4472C4;
        text-align: center;
        margin-top: 20px;
    }

    .summary {
        text-align: center;
        margin: 20px 0;
        font-size: 1.1em;
    }

    .summary span {
        font-weight: bold;
    }

    .actions {
        text-align: center;
        margin-bottom: 20px;
    }

    .actions form {
        display: inline-block;
        margin: 5px;
    }

    .actions input[type="submit"] {
        background-color: #4472C4;
        color: #fff;
        border: none;
        padding: 10px 20px;
        font-size: 1em;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .actions input[type="submit"]:hover {
        background-color: #365a8c;
    }

    table {
        width: 90%;
        margin: 0 auto 30px auto;
        border-collapse: collapse;
        background: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    table thead th {
        background-color: #4472C4;
        color: white;
        padding: 10px;
        text-align: center;
        font-weight: bold;
    }

    table tbody td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .action-buttons input[type="submit"] {
        background-color: #4472C4;
        color: #fff;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 3px;
        transition: background-color 0.3s ease;
        font-size: 0.9em;
    }

    .action-buttons input[type="submit"]:hover {
        background-color: #365a8c;
    }

    .no-data {
        text-align: center;
        color: #888;
        margin: 20px 0;
    }
</style>
</head>
<body>
    <h1>Current Absents</h1>
    <div class="summary">
        [[${session.name}]] ([[${date}]])<br>
        <span>Total:</span> [[${t}]] &nbsp; | &nbsp; <span>No. of Present:</span> [[${p}]] &nbsp; | &nbsp; <span>No. of Absent:</span> [[${a}]]
    </div>

    <div class="actions">
        <form action="/attendance/currentPresents">
            <input type="submit" value="Presents">
        </form>
        <form action="/attendance/abort">
            <input type="submit" value="Abort">
        </form>
        <form action="/attendance/conclude">
            <input type="submit" value="Conclude">
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>S.No</th>
                <th>Regimental<br>Number</th>
                <th>Name</th>
                <th>Number</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="cdt, status : ${absents}">
                <td th:text="${status.index + 1}"></td>
                <td th:text="${cdt[status.index]}"></td>
                <td th:text="${cdt[status.index + 1]}"></td>
                <td th:text="${cdt[status.index + 2]}"></td>
                <td>
                    <div class="action-buttons">
                        <form th:action="@{'/attendance/present/' + ${cdt[status.index]}}">
                            <input type="submit" value="PRESENT">
                        </form>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>