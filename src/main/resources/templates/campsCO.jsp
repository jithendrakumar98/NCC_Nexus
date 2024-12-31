<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Camps</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #ddd;
            width: 80%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            position: absolute;
            top: 0;
            right: 15px;
            padding: 10px;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        #addCampButton {
            text-align: center;
        }

        button {
            padding: 10px 15px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .dropdown {
            margin-top: 20px;
            position: relative;
            display: inline-block;
        }

        .dropdown button {
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        .dropdown button:hover {
            background-color: #0056b3;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            border: 1px solid #ddd;
            width: 100%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            max-height: 200px;
            overflow-y: auto;
        }

        .dropdown-content label {
            padding: 10px;
            display: block;
            cursor: pointer;
        }

        .dropdown-content label:hover {
            background-color: #f1f1f1;
        }

        .show {
            display: block;
        }

        .selected-items {
            margin-top: 10px;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            display: inline-block;
            width: 100%;
            border-radius: 5px;
        }

        .selected-items div {
            padding: 5px;
            margin: 5px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            display: inline-block;
        }

        #limitedVacancyField {
            display: none;
            margin-top: 20px;
            border: 1px solid #ddd;
            padding: 10px;
            background-color: #fff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        table, th, td {
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
            padding: 10px;
        }

        td {
            padding: 10px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Input Styles */
        input[type="text"], input[type="date"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        input[type="radio"] {
            margin-right: 10px;
        }

        label {
            font-weight: bold;
        }

        form {
            width: 100%;
        }

        .form-group {
            margin-bottom: 15px;
        }

    </style>

    <script>
        // Function to open the modal
        function showCampForm() {
            document.getElementById('campModal').style.display = 'block';
        }

        // Function to close the modal
        function closeCampForm() {
            document.getElementById('campModal').style.display = 'none';
        }

        function toggleVacancyField(value) {
            const vacancyField = document.getElementById('limitedVacancyField');
            if (value === 'Limited') {
                vacancyField.style.display = 'block';
            } else {
                vacancyField.style.display = 'none';
                document.querySelectorAll('#limitedVacancyField input[type="number"]').forEach(input => {
                    input.value = ''; // Clear input fields
                });
            }
        }

        function toggleDropdown() {
            const dropdown = document.getElementById("options");
            dropdown.classList.toggle("show");
        }

        window.onclick = function (event) {
            if (event.target == document.getElementById('campModal')) {
                closeCampForm();  // Close the modal if the user clicks outside of it
            }
        }

        function handleCheckboxChange() {
            const selectedItems = document.querySelector('.selected-items');
            selectedItems.innerHTML = ''; // Clear existing items
            document.querySelectorAll('.dropdown-content input[type="checkbox"]:checked').forEach(checkbox => {
                const selectedItem = document.createElement('div');
                selectedItem.innerText = checkbox.value;
                selectedItems.appendChild(selectedItem);
            });
        }
    </script>
</head>
<body>
    <h1>Camps List</h1>

    <!-- Add Camp Button -->
    <form >
        <button type="button" onclick="showCampForm()">Add Camp</button>
    </form>

    <!-- Add Camp Modal -->
    <div id="campModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeCampForm()">&times;</span>
            <form action="/camp/addCamp" th:object="${camp}" method="post">
                <div class="form-group">
                    <label for="campName">Name:</label>
                    <input type="text" id="campName" name="name" required>
                </div>

                <div class="form-group">
                    <label for="place">Place:</label>
                    <input type="text" id="place" name="place" required>
                </div>

                <div class="form-group">
                    <label for="campStart">Start Date:</label>
                    <input type="date" id="campStart" name="startDate" required>
                </div>

                <div class="form-group">
                    <label for="campEnd">End Date:</label>
                    <input type="date" id="campEnd" name="endDate" required>
                </div>

                <div class="form-group dropdown">
                    <button type="button" onclick="toggleDropdown()">Select Batches:</button>
                    <div id="options" class="dropdown-content">
                        <label th:each="btc : ${batches}">
                            <input type="checkbox" name="batches" th:value="${btc.name}" onchange="handleCheckboxChange()">
                            <span th:text="${btc.name}"></span>
                        </label>
                    </div>
                </div>
                <div class="selected-items"></div>

                <div class="form-group">
                    <label>Vacancies:</label>
                    <input type="radio" id="openVacancy" name="type" value="Open" onclick="toggleVacancyField(this.value)" required>
                    <label for="openVacancy">Open</label>
                    <input type="radio" id="limitedVacancy" name="type" value="Limited" onclick="toggleVacancyField(this.value)">
                    <label for="limitedVacancy">Limited</label>
                </div>

                <div id="limitedVacancyField">
                    <table>
                        <thead>
                            <tr>
                                <th>College</th>
                                <th>Vacancy</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr th:each="college : ${colleges}">
                                <td th:text="${college.name}"></td>
                                <td><input type="number" name="vacancies" min="0" placeholder="Enter Vacancy" required></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="form-group">
                    <button type="submit">Submit</button>
                    <button type="button" onclick="closeCampForm()">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Camps Table -->
    <table>
        <thead>
            <tr>
                <th>S.no</th>
                <th>Name</th>
                <th>Place</th>
                <th>Start</th>
                <th>End</th>
                <th>Status</th>
                <th>Cadets</th>
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
                <td>
                    <form th:action="@{'/camp/cadets/' + ${camp.id}}">
                        <input type="submit" value="Cadets">
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>