<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cadets</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #4472C4;
        }

        #addCadetButton input[type="button"] {
            background-color: #4472C4;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }

        #addCadetButton input[type="button"]:hover {
            background-color: #365f9e;
        }

        /* Modal styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed;
            z-index: 1; /* Sit on top */
            left: 0;
            top: 10%; /* Position the modal near the top */
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            background-color: rgba(0, 0, 0, 0.5); /* Background dimming */
        }

        .modal-content {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            margin: 0 auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 80%; /* Reduced width for the modal */
            max-width: 550px; /* Maximum width */
            box-sizing: border-box;
            max-height: 90%; /* Set max-height for modal */
            overflow-y: auto; /* Enable vertical scrolling */
        }

        .modal-content label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        /* Make the text fields uniform in width */
        .modal-content input[type="text"],
        .modal-content input[type="password"],
        .modal-content input[type="email"],
        .modal-content input[type="number"],
        .modal-content select {
            width: 100%; /* Full width for text fields */
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px; /* Smaller font size for inputs */
            box-sizing: border-box; /* Ensure padding is included in width */
        }

        .modal-content button[type="submit"],
        .modal-content button[type="button"] {
            background-color: #4472C4;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            width: 100%;
            margin-top: 10px;
        }

        .modal-content button[type="submit"]:hover,
        .modal-content button[type="button"]:hover {
            background-color: #365f9e;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #4472C4;
            color: white;
        }

        .full-width-button {
            background-color: #4472C4;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 5px;
            width: 100%;
            margin-bottom: 5px;
        }

        .full-width-button:hover {
            background-color: #365f9e;
        }
                .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background-color: #e9e9e9;
    color: #fff;
}


.nav-links {
    list-style: none;
    display: flex;
    margin: 0;
    padding: 0;
    
}

.nav-links li {
    margin: 0 15px;
}

.nav-links a {
    text-decoration: none;
    color: #4472c4;
    font-size: 1.2rem;
    transition: color 0.3s;
}

.nav-links a:hover {
    color: rgb(0, 0, 0);
}
.navbar{
    height: 50px;
}
.ncc {
      color: #4472C4;
      border: 7px solid #4472C4;
      border-radius: 12px 0px 0px 12px;
      padding: 10px 20px;
      font-size: 1.5rem;
    }

    .nexus {
      background-color: #4472c4;
      color: #e9e9e9;
      border-radius: 0px 12px 12px 0px;
      padding: 17px 20px;
      margin-left: -10px;
      font-size: 1.5rem;
    }
    </style>
    <script>
        // Function to open the modal
        function showForm() {
            document.getElementById('modal').style.display = 'block';
        }

        // Function to close the modal
        function closeForm() {
            document.getElementById('modal').style.display = 'none';
        }

        // Function to handle the regimental number
        function updateRegimentalNumber() {
            const prefix = "AP**S**";  
            let regNum = document.getElementById('cadetRegimentalNumber').value;

            regNum = regNum.replace(/[^0-9]/g, ''); 
            if (regNum.length > 6) {
                regNum = regNum.slice(0, 6); 
            }
            document.getElementById('cadetRegimentalNumber').value = prefix + regNum;
        }
    </script>
</head>
<body>
<nav class="navbar">
        <div class="title">
            <span class="ncc">NCC</span>
            <span class="nexus">NEXUS</span>
          </div>
          
        <ul class="nav-links">
        	<li><a href="/home">Home</a></li>
        	<li><a href="/cadet/cadets">Cadets</a></li>
        	<li><a href="/camp/camps">Camps</a></li>
            <li><a href="/attendance/attendanceRegister">Attendance Register</a></li>
        </ul>
    </nav>

    <h1>Cadets</h1>

    <!-- Add Cadet Button -->
    <form id="addCadetButton">
        <input type="button" value="Add Cadet" onclick="showForm()">
    </form>

    <!-- Modal for Add Cadet Form -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <form action="/cadet/addCadet" method="post" th:object="${cadet}">
                <label for="cadetName">Name:</label>
                <input type="text" id="cadetName" name="name" required>

                <label for="cadetRegimentalNumber">Regimental Number:</label>
                <input type="text" id="cadetRegimentalNumber" name="username" 
                       value="AP**S**" maxlength="13" oninput="updateRegimentalNumber()" required placeholder="Enter 6 digits">

                 <label for="cadetBatch">Batch:</label>
            <select id="cadetBatch" name="batch" required>
                <option value="" disabled selected>Select a Batch:</option>
                <option th:each="b : ${abs}" th:value="${b.name}" th:text="${b.name}"></option>
            </select>
                   

                <label for="cadetGender">Gender:</label>
                <select id="cadetGender" name="gender" required>
                    <option value=" " disabled selected>Select Gender:</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>

                <label for="cadetEmail">Email:</label>
                <input type="email" id="cadetEmail" name="email" required>

                <label for="cadetNumber">Number:</label>
                <input type="number" id="cadetNumber" name="number" required>

                <label for="cadetPassword">Password:</label>
                <input type="password" id="cadetPassword" name="password" required>
                <input type="text" id="role" name="role" value="CADET" style="display: none;">
                <input type="text" id="rank" name="rank" value="Cdt" style="display: none;">

                <button type="submit">Submit</button>
                <button type="button" onclick="closeForm()">Cancel</button>
            </form>
        </div>
    </div>

    <!-- Cadets Table -->
    <table>
        <thead>
            <tr>
                <th>S.No</th>
                <th>NAME</th>
                <th>REGIMENTAL<br>NUMBER</th>
                <th>Rank</th>
                <th>Attendance</th>
                <th>Number</th>
                <th>Password</th>
                <th>Actions</th>
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
                <td th:text="${cdt.password}"></td>
                <td>
                    <form th:action="@{'/cadet/promote/' + ${cdt.username} }">
                        <input type="submit" class="full-width-button" value="PROMOTE">
                    </form>
                    <form th:action="@{'/cadet/demote/' + ${cdt.username} }">
                        <input type="submit" class="full-width-button" value="DEMOTE">
                    </form>
                    <form th:action="@{'/cadet/view/' + ${cdt.username} }">
                        <input type="submit" class="full-width-button" value="VIEW">
                    </form>
                    
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>