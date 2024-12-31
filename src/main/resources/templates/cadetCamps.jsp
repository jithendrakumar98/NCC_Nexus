<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Camps</title>
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

        #addCampButton {
            text-align: center;
            margin: 20px 0;
        }

        #addCampButton input {
            background-color: #4472C4;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
            text-transform: uppercase;
            font-weight: bold;
        }

        #addCampButton input:hover {
            background-color: #365f91;
        }

        #addCampForm {
            display: none;
            margin-top: 20px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        #addCampForm label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        #addCampForm select, #addCampForm button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        #addCampForm button {
            background-color: #4472C4;
            color: white;
            border: none;
            cursor: pointer;
            text-transform: uppercase;
            font-weight: bold;
        }

        #addCampForm button:hover {
            background-color: #365f91;
        }

        #addCampForm button[type="button"] {
            background-color: #ccc;
            color: #333;
        }

        #addCampForm button[type="button"]:hover {
            background-color: #bbb;
        }
    </style>
    <script>
        function showForm() {
            document.getElementById('addCampButton').style.display = 'none';
            document.getElementById('addCampForm').style.display = 'block';
        }

        function hideForm() {
            document.getElementById('addCampForm').style.display = 'none';
            document.getElementById('addCampButton').style.display = 'inline';
        }
    </script>
</head>
<body>
    <h1>Camps List</h1>

    <!-- Add Camp Button -->
    <form id="addCampButton">
        <input type="button" value="Apply Camp" onclick="showForm()">
    </form>

    <!-- Add Camp Form -->
    <div id="addCampForm">
        <form action="/camps/applyCamp" method="post" th:object="${campid}">
            <label for="camps">Camps:</label>
            <select id="camps" name="id" required>
                <option value="" disabled selected>Select Camp</option>
                <option th:each="camp : ${acamps}" th:value="${camp.id}" th:text="${camp.name}"></option>
            </select>
            <button type="submit">Submit</button>
            <button type="button" onclick="hideForm()">Cancel</button>
        </form>
    </div>

    <!-- Camps Table -->
    <table>
        <thead>
            <tr>
                <th>S.No</th>
                <th>Name</th>
                <th>Place</th>
                <th>Start</th>
                <th>End</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="camp, status : ${camps}">
                <td th:text="${status.index + 1}"></td>
                <td th:text="${camp.name}"></td>
                <td th:text="${camp.place}"></td>
                <td th:text="${campext[status.index][0]}"></td>
                <td th:text="${campext[status.index][1]}"></td>
                <td th:text="${campext[status.index][2]}"></td>
            </tr>
        </tbody>
    </table>
</body>
</html>