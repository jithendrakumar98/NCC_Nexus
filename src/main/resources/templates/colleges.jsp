<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NCC Colleges</title>
        <style>
            /* Global Variables for Colors */
            :root {
                --ncc-blue: #4472C4;
                --ncc-khaki: #BDB76B;
                --ncc-gold: #CFB53B;
                --ncc-navy: #000080;
                --btn-edit: #28a745; /* Green */
                --btn-show: #007bff; /* Blue */
            }

            /* Global Styles */
            body {
                font-family: 'Helvetica Neue', Arial, sans-serif;
                background: linear-gradient(135deg, #f4f4f9, #e8e8e8);
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }

            /* Header Styles */
            h1 {
                text-align: center;
                padding: 20px;
                background: var(--ncc-blue);
                color: white;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin: 0;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                position: relative;
            }

            h1::before, h1::after {
                position: absolute;
                font-size: 24px;
                color: var(--ncc-gold);
                top: 50%;
                transform: translateY(-50%);
            }

            h1::before { left: 20px; }
            h1::after { right: 20px; }

            /* Top Controls Section */
            .top-controls {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px 10%;
            }

            #addCollegeButton input {
                background-color: var(--ncc-blue);
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                transition: all 0.3s ease;
            }

            #addCollegeButton input:hover {
                background-color: var(--ncc-navy);
                transform: translateY(-2px);
            }

            .search-controls {
                display: flex;
                gap: 10px;
                align-items: center;
            }

            .search-controls input[type="text"] {
                padding: 10px;
                width: 300px;
                border: 2px solid var(--ncc-khaki);
                border-radius: 4px;
                font-size: 16px;
                transition: border-color 0.3s ease;
            }

            .search-controls input[type="text"]:focus {
                border-color: var(--ncc-blue);
                outline: none;
            }

            .search-controls button {
                padding: 10px 20px;
                background-color: var(--ncc-blue);
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                transition: all 0.3s ease;
            }

            .search-controls button:hover {
                background-color: var(--ncc-navy);
                transform: translateY(-2px);
            }

            /* Add College Form */
            #addCollegeForm {
                display: none;
                margin: 20px auto;
                padding: 20px;
                max-width: 500px;
                background-color: white;
                border: 2px solid var(--ncc-khaki);
                border-radius: 8px;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }

            #addCollegeForm input, #addCollegeForm button {
                display: block;
                width: 100%;
                margin: 10px 0;
            }

            #addCollegeForm input {
                padding: 10px;
                border: 2px solid var(--ncc-khaki);
                border-radius: 4px;
                font-size: 16px;
            }

            #addCollegeForm button {
                padding: 10px;
                border: none;
                border-radius: 4px;
                font-weight: bold;
                transition: all 0.3s ease;
            }

            #addCollegeForm button[type="submit"] {
                background-color: var(--ncc-blue);
                color: white;
            }

            #addCollegeForm button[type="button"] {
                background-color: #dc3545;
                color: white;
            }

            #addCollegeForm button:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            /* Table Styles */
            table {
                width: 90%;
                margin: 20px auto;
                border-collapse: separate;
                border-spacing: 0;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
                background: white;
            }

            table th {
                background-color: var(--ncc-blue);
                color: white;
                padding: 15px;
                text-transform: uppercase;
            }

            table td {
                padding: 12px;
                border-bottom: 1px solid #ddd;
                text-align: center;
            }

            table tr:nth-child(even) {
                background-color: #f8f9fa;
            }

            table tr:hover {
                background-color: var(--ncc-khaki);
            }

            .action-buttons {
                display: flex;
                gap: 10px;
                justify-content: center;
            }

            .action-buttons form {
                margin: 0;
            }

            .action-buttons input {
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                font-weight: bold;
                color: white;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .action-buttons .btn-show {
                background-color: var(--btn-show);
            }

            .action-buttons .btn-show:hover {
                background-color: var(--btn-show-dark);
            }

            .action-buttons .btn-edit {
                background-color: var(--btn-edit);
            }

            .action-buttons .btn-edit:hover {
                background-color: #218838;
            }

            @media screen and (max-width: 768px) {
                .top-controls {
                    flex-direction: column;
                    gap: 15px;
                    padding: 10px;
                }

                table {
                    width: 100%;
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
            }
        </style>
        <script>
            /* Toggle Add College Form */
            function showForm() {
                document.getElementById('addCollegeForm').style.display = 'block';
            }

            function hideForm() {
                document.getElementById('addCollegeForm').style.display = 'none';
            }

            /* Search Functionality */
            function searchColleges() {
                const searchTerm = document.getElementById('searchInput').value.toLowerCase();
                const rows = document.querySelectorAll('tbody tr');
                rows.forEach(row => {
                    row.style.display = row.textContent.toLowerCase().includes(searchTerm) ? '' : 'none';
                });
            }

            function resetSearch() {
                document.getElementById('searchInput').value = '';
                searchColleges();
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
        	<li><a href="/college/colleges">Colleges</a></li>
        	<li><a href="/batch/batches">Batches</a></li>
            <li><a href="/ano/anos">ANOs</a></li>
            <li><a href="/camp/camps">Camps</a></li>
        </ul>
    </nav>
        <h1>NCC Colleges List</h1>

        <div class="top-controls">
            <div id="addCollegeButton">
                <input type="button" value="Add College" onclick="showForm()">
            </div>
            <div class="search-controls">
                <input type="text" id="searchInput" placeholder="Search colleges...">
                <button onclick="searchColleges()">Search</button>
                <button onclick="resetSearch()">Reset</button>
            </div>
        </div>

        <div id="addCollegeForm">
            <form action="/college/addClg" method="post" th:object="${clg}">
                <label for="collegeName">College Name:</label>
                <input type="text" id="collegeName" name="name" required>
                <button type="submit">Submit</button>
                <button type="button" onclick="hideForm()">Cancel</button>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>S.no</th>
                    <th>Name</th>
                    <th>Senior Division</th>
                    <th>Senior Wing</th>
                    <th>ANO</th>
                    <th>View</th>
                </tr>
            </thead>
            <tbody>
                <tr th:each="clg, status : ${clg}">
                    <td th:text="${status.index + 1}"></td>
                    <td th:text="${clg.name}"></td>
                    <td th:text="${clgex[status.index][0]}"></td>
                    <td th:text="${clgex[status.index][1]}"></td>
                    <td th:text="${clgex[status.index][2]}"></td>
                    <td>
                        <div class="action-buttons">
                            <form th:action="@{'/college/view/' + ${clg.name} }">
                                <input type="submit" class="btn-show" value="SHOW">
                            </form>
                            </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
    </html>