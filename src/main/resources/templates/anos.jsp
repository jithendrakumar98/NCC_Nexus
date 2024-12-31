<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ANOs</title>
    <style>
        /* Basic Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
    text-align: center;
    padding: 20px;
    background-color: #4472C4; /* Updated color */
    color: white;
    margin: 0;
    position: relative; /* To position the stars correctly */
}

h1::before,
h1::after {
    font-size: 30px; /* Adjust the size of the star */
    color: gold; /* Gold color for the star */
    position: absolute;
    top: 50%;
    transform: translateY(-50%); /* Vertically center the stars */
}

h1::before {
    left: 10px; /* Position the left star */
}

h1::after {
    right: 10px; /* Position the right star */
}


        #addAnoForm {
        display: none;
        margin: 20px;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }

    label {
        font-weight: bold;
    }

    .form-row {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        gap: 20px; /* Increased gap to add space between fields */
        margin-bottom: 20px; /* Add space between form rows */
    }

    .form-row div {
        flex: 1 1 calc(50% - 10px); /* Allows two columns and ensures space */
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    select {
        width: 100%; /* Make input fields take up full width */
        padding: 8px;
        margin-bottom: 15px; /* Margin between fields */
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="button"],
    button[type="submit"],
    button[type="button"] {
        padding: 10px 15px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
        margin-top: 10px;
    }

    button[type="submit"]:hover,
    button[type="button"]:hover {
        background-color: #45a049;
    }

    /* Adjust button styling */
    button[type="submit"],
    button[type="button"] {
        width: auto; /* Adjusted to fit button size */
        display: inline-block; /* Ensure they are on the same line if needed */
    }

        /* Table Styling */
        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4472C4; /* Updated color */
            color: white;
        }

        /* Button Styling */
        input[type="button"] {
            background-color: #008CBA;
        }

        input[type="button"]:hover {
            background-color: #007B8A;
        }

        /* Modal Styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 60px;
            padding-left: 20px;
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border-radius: 8px;
            width: 80%;
            max-height: 70%;
            overflow-y: auto;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Search box in Modal */
        #rankSearch {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .rank-item {
            padding: 8px;
            cursor: pointer;
        }

        .rank-item:hover {
            background-color: #f1f1f1;
        }

    </style>

    <script>
        // Show form on "Add ANO" button click
        function showForm() {
            document.getElementById('addAnoButton').style.display = 'none';
            document.getElementById('addAnoForm').style.display = 'block';
        }

        // Hide form on "Cancel" button click
        function hideForm() {
            document.getElementById('addAnoForm').style.display = 'none';
            document.getElementById('addAnoButton').style.display = 'inline';
        }

        // Validate Regimental Number to ensure NCC/ is readonly and only 8 characters after that
        function validateRegimentalNumber() {
            var regNumField = document.getElementById('anoUsername');
            var value = regNumField.value;
            
            // Ensure it starts with "NCC/"
            if (value.indexOf("NCC/") !== 0) {
                regNumField.value = "NCC/" + value.slice(4);  // Add NCC/ if not present
            }

            // Limit to 8 characters after NCC/
            if (value.length > 12) {
                regNumField.value = value.slice(0, 12); // Max 12 characters (including NCC/)
            }
        }

        // Show the Rank selection modal
        function showRankModal() {
            document.getElementById("rankModal").style.display = "block";
        }

        // Close the Rank selection modal
        function closeRankModal() {
            document.getElementById("rankModal").style.display = "none";
        }

        // Filter ranks as the user types
        function filterRanks() {
            var input = document.getElementById("rankSearch");
            var filter = input.value.toLowerCase();
            var rankItems = document.getElementsByClassName("rank-item");

            for (var i = 0; i < rankItems.length; i++) {
                var rankName = rankItems[i].textContent || rankItems[i].innerText;
                if (rankName.toLowerCase().indexOf(filter) > -1) {
                    rankItems[i].style.display = "";
                } else {
                    rankItems[i].style.display = "none";
                }
            }
        }

        // Select the rank from the modal
        function selectRank(rank) {
            document.getElementById("anoRank").value = rank;
            closeRankModal();
        }
    </script>
</head>
<body>
    <h1>ANOs List</h1>

    <!-- Add ANO Button -->
    <form id="addAnoButton">
        <input type="button" value="Add ANO" onclick="showForm()">
    </form>

    <!-- Add ANO Form -->
    <div id="addAnoForm">
        <form action="/ano/addAno" method="post" th:object="${ano}">
            <div class="form-row">
                <div>
                    <label for="anoName">Name:</label>
                    <input type="text" id="anoName" name="name" required>
                </div>
                <div>
                    <label for="anoUsername">Regimental Number:</label>
                    <input type="text" id="anoUsername" name="username" value="NCC/" required oninput="validateRegimentalNumber()">
                </div>
            </div>
            <div class="form-row">
                <div>
                    <label for="anoRank">Rank:</label>
                    <input type="text" id="anoRank" name="rank" onclick="showRankModal()" readonly required>
                </div>
                <div>
                 <label for="anoCollege">College:</label>
            <select id="anoCollege" name="college" required>
                <option value="" disabled selected>Select a College</option>
                <option th:each="clg : ${clgs}" th:value="${clg.name}" th:text="${clg.name}"></option>
            </select>
                   
                </div>
            </div>
            <div class="form-row">
                <div>
                    <label for="anoEmail">Email:</label>
                    <input type="email" id="anoEmail" name="email" required>
                </div>
                <div>
                    <label for="anoNumber">Number:</label>
                    <input type="text" id="anoNumber" name="number" required>
                </div>
            </div>
            <div class="form-row">
                <div>
                    <label for="anoBranch">Force:</label>
                    <select id="anoBranch" name="branch" required>
                    <option value="" disabled selected>Select a Wing</option>
                        <option value="ARMY">ARMY</option>
                        <option value="NAVY">NAVY</option>
                        <option value="AIR FORCE">AIR FORCE</option>
                    </select>
                </div>
                <div>
                    <label for="anoPassword">Password:</label>
                    <input type="password" id="anoPassword" name="password" required>
                </div>
                <input type="text" id="role" name="role" value="ANO" style="display: none;">
                
            </div>
            <button type="submit">Submit</button>
            <button type="button" onclick="hideForm()">Cancel</button>
        </form>
    </div>

    <!-- ANOs Table -->
    <table border="1">
        <thead>
            <tr>
                <th>S.No</th>
                <th>NAME</th>
                <th>REGIMENTAL<br>NUMBER</th>
                <th>RANK</th>
                <th>COLLEGE</th>
                <th>EMAIL</th>
                <th>NUMBER</th>
                <th>FORCE</th>
                <th>PASSWORD</th>
                <th>View Cadets</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="ano, status : ${anos}">
                <td th:text="${status.index + 1}"></td>
                <td th:text="${ano.name}"></td>
                <td th:text="${ano.username}"></td>
                <td th:text="${ano.rank}"></td>
                <td th:text="${ano.college}"></td>
                <td th:text="${ano.email}"></td>
                <td th:text="${ano.number}"></td>
                <td th:text="${ano.branch}"></td>
                <td th:text="${ano.password}"></td>
                <td>
            <form th:action="@{'/ano/viewCadets/' + ${ano.id} }">
            <input type="submit" class="full-width-button" value="View Cadets">
            </form>
            </td>
            
            </tr>
        </tbody>
    </table>

    <!-- Rank Selection Modal -->
    <div id="rankModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeRankModal()">&times;</span>
            <input type="text" id="rankSearch" onkeyup="filterRanks()" placeholder="Search for rank..." />
           <div id="rankList">
    <div class="rank-item" onclick="selectRank('Lieutenant (Lt) (Army)')">Lieutenant (Lt) (Army)</div>
    <div class="rank-item" onclick="selectRank('Sub Lieutenant (SLt) (Navy)')">Sub Lieutenant (SLt) (Navy)</div>
    <div class="rank-item" onclick="selectRank('Pilot Officer (Plt Off) (Air Force)')">Pilot Officer (Plt Off) (Air Force)</div>
    <div class="rank-item" onclick="selectRank('Captain (Cpt) (Army)')">Captain (Cpt) (Army)</div>
    <div class="rank-item" onclick="selectRank('Lieutenant (Lt) (Navy)')">Lieutenant (Lt) (Navy)</div>
    <div class="rank-item" onclick="selectRank('Flying Officer (Fg Off) (Air Force)')">Flying Officer (Fg Off) (Air Force)</div>
    <div class="rank-item" onclick="selectRank('Major (Maj) (Army)')">Major (Maj) (Army)</div>
    <div class="rank-item" onclick="selectRank('Lieutenant Commander (Lt Cdr) (Navy)')">Lieutenant Commander (Lt Cdr) (Navy)</div>
    <div class="rank-item" onclick="selectRank('Flight Lieutenant (Flt Lt) (Air Force)')">Flight Lieutenant (Flt Lt) (Air Force)</div>
    <div class="rank-item" onclick="selectRank('Lieutenant Colonel (Lt Col) (Army)')">Lieutenant Colonel (Lt Col) (Army)</div>
    <div class="rank-item" onclick="selectRank('Commander (Cdr) (Navy)')">Commander (Cdr) (Navy)</div>
    <div class="rank-item" onclick="selectRank('Squadron Leader (Sqn Ldr) (Air Force)')">Squadron Leader (Sqn Ldr) (Air Force)</div>
    <div class="rank-item" onclick="selectRank('Colonel (Col) (Army)')">Colonel (Col) (Army)</div>
</div>

        </div>
    </div>
</body>
</html>