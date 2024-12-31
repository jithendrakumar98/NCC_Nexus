<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Batches</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        color: #333;
    }

    h1 {
        color: #4472C4;
        text-align: center;
        margin-top: 20px;
    }

    #addBatchForm {
        display: none;
        margin: 20px auto;
        max-width: 500px;
        padding: 20px;
        background-color: white;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    form#addBatchButton {
        text-align: center;
        margin: 20px;
    }

    input[type="button"], button, input[type="submit"] {
        background-color: #4472C4;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 14px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="button"]:hover, button:hover, input[type="submit"]:hover {
        background-color: #365a8c;
    }

    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    table th, table td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }

    table th {
        background-color: #4472C4;
        color: white;
    }

    table tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    table tr:hover {
        background-color: #eef;
    }

    label {
        display: block;
        margin-bottom: 5px;
        color: #555;
        font-weight: bold;
    }

    input[type="text"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }

    .full-width-button {
        width: 100%;
        margin-bottom: 5px;
    }
    
   input[type="submit"].ACTIVE {
    background-color: red;
    color: white;
}

input[type="submit"].INACTIVE {
    background-color: green;
    color: white;
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
    function showForm() {
        document.getElementById('addBatchButton').style.display = 'none';
        document.getElementById('addBatchForm').style.display = 'block';
    }

    function hideForm() {
        document.getElementById('addBatchForm').style.display = 'none';
        document.getElementById('addBatchButton').style.display = 'inline';
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
    <h1>Batches</h1>

    <!-- Add Batch Button -->
    <form id="addBatchButton">
        <input type="button" value="Add Batch" onclick="showForm()">
    </form>

    <!-- Add Batch Form -->
    <div id="addBatchForm">
        <form action="/batch/addBatch" method="post" th:object="${batch}">
            <label for="batchName">Batch Name:</label>
            <div style="display: flex; align-items: center;">
                <span style="font-weight: bold;">Y</span>
                <input type="text" id="batchName" name="name" pattern="\d{2}" maxlength="2" required placeholder="##" style="margin-left: 5px; width: 50px;">
                
            <input type="text" id="status" name="status" value="ACTIVE" style="display: none;">
                
            </div>            
            <button type="submit">Submit</button>
            <button type="button" onclick="hideForm()">Cancel</button>
        </form>
    </div>

    <!-- Batch Table -->
    <table>
        <thead>
            <tr>
                <th>S.no</th>
                <th>Batch</th>
                <th>Status</th>
                <th></th>
                <th>Senior Division</th>
                <th>Senior Wing</th>
                <th>TOTAL</th>
                <th>Cadets List</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="batch, status : ${batches}">
                <td th:text="${status.index + 1}"></td>
                <td th:text="${batch.name}"></td>
                <td th:text="${batch.status}"></td>
                <td>
                    <form th:action="@{'/batch/alter/' + ${batch.name} }">
                        <input type="submit" value=" " th:class="${batch.status}">
                    </form>
                </td>  
                <td th:text="${bext[status.index][0]}"></td>
                <td th:text="${bext[status.index][1]}"></td>
                <td th:text="${bext[status.index][2]}"></td>
                <td>
                    <form th:action="@{'/batch/view/' + ${batch.name} }">
                        <input type="submit" class="full-width-button" value="VIEW">
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>