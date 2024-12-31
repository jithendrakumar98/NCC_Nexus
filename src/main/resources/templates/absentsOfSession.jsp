<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NCC NEXUS</title>
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

    .btn-show {
        background-color: #4472C4;
        color: white;
        border: none;
        padding: 8px 16px;
        cursor: pointer;
        border-radius: 4px;
        text-transform: uppercase;
    }

    .btn-show:hover {
        background-color: #365f91;
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

<h1>[[${ar.session}]]([[${date}]]) - Absents</h1>
<table>
    <thead>
        <tr>
            <th>S.no</th>
            <th>Name</th>
            <th>Regimental<br>Number</th>
            <th>Number</th>
            <th>Rank</th>
            <th>View</th>
        </tr>
    </thead>
    <tbody>
        <tr th:each="cadet, status : ${cadets}">
            <td th:text="${status.index + 1}"></td>
            <td th:text="${cadet.name}"></td>
            <td th:text="${cadet.username}"></td>
            <td th:text="${cadet.number}"></td>
            <td th:text="${cadet.rank}"></td>
            <td>
                <div class="action-buttons">
                    <form>
                        <input type="submit" class="btn-show" value="VIEW">
                    </form>
                </div>
            </td>
        </tr>
    </tbody>
</table>
</body>
</html>