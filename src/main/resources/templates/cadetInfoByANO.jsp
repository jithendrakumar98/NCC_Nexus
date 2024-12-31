<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadet Info</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
        color: #333;
    }
    h1 {
        text-align: center;
        margin: 20px 0;
        color: #4CAF50;
    }
    .info-section {
        width: 90%;
        max-width: 800px;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .info-section h2 {
        border-bottom: 2px solid #4472c4;
        padding-bottom: 5px;
        color: #4472c4;
    }
    .info-details {
        margin-bottom: 20px;
        line-height: 1.8;
    }
    .info-details span {
        font-weight: bold;
        color: #555;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 12px 15px;
        text-align: center;
        border: 1px solid #ddd;
    }
    th {
        background-color: #4472c4;
        color: white;
        text-transform: uppercase;
        font-size: 14px;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:nth-child(odd) {
        background-color: #fff;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .footer {
        text-align: center;
        margin: 20px 0;
        font-size: 12px;
        color: #888;
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

<div class="info-section">

    <h2>Cadet Information</h2>
    <div class="info-details">
        <p><span>Name:</span> [[${cadet.name}]]</p>
        <p><span>Regimental Number:</span> [[${cadet.username}]]</p>
        <p><span>Rank:</span> [[${cadet.rank}]]</p>
        <p><span>Email:</span> [[${cadet.email}]]</p>
        <p><span>Number:</span> [[${cadet.number}]]</p>
        <p><span>Batch:</span> [[${cadet.batch}]]</p>
        <p><span>Password:</span> [[${cadet.password}]]</p>
    </div>
</div>

<div class="info-section">
    <h2>Attendance Information</h2>
    <div class="info-details">
        <p><span>Percentage:</span> [[${per}]]</p>
        <p><span>Total:</span> [[${total}]]</p>
        <p><span>Present:</span> [[${p}]]</p>
        <p><span>Absent:</span> [[${ab}]]</p>
    </div>
    <table>
        <thead>
            <tr>
                <th>S.No</th>
                <th>Session</th>
                <th>Date</th>
                <th>Present/Absent</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="ar, status : ${ar}">
                <td th:text="${status.index + 1}"></td>
                <td th:text="${ar.session}"></td>
                <td th:text="${pa[status.index][1]}"></td>
                <td th:text="${pa[status.index][0]}"></td>
            </tr>
        </tbody>
    </table>
</div>

<div class="info-section">
    <h2>Camps</h2>
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
</div>
</body>
</html>