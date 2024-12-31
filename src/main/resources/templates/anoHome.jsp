<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>NEXUS@ANO</title>
    <style>
        #startAttendanceForm {
            display: none;
            margin-top: 20px;
        }
         .dropdown {
            position: relative;
            display: inline-block;
        }.dropdown-content {
            display: none;
        }
       .dropdown-content label {
            display: block;
            cursor: pointer;
        }
      .show {
            display: block;
        }
        .yes{
        	display:none;
        }
        .no{
        	display:block;
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
        function showStartAttendanceForm() {
            document.getElementById('startAttendanceButton').style.display = 'none';
            document.getElementById('startAttendanceForm').style.display = 'block';
        }

        function hideStartAttendanceForm() {
            document.getElementById('startAttendanceForm').style.display = 'none';
            document.getElementById('startAttendanceButton').style.display = 'inline';
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

    <!-- Start Attendance Button -->
    <form id="startAttendanceButton" th:class="${st}">
        <input type="button" value="Start Attendance" onclick="showStartAttendanceForm()">
    </form>
    
    <form action="/attendance/currentAbsents" th:class="${stt}">
        <input type="submit" value="Resume Attendance">
    </form>

    <!-- Dynamic Start Attendance Form -->
    <div id="startAttendanceForm">
        <form action="/attendance/startAttendance" method="post" th:object="${attStartDetails}">
        
       <div class="dropdown">
        
        <button type="button" onclick="toggleDropdown()">Select Batches:</button>
        <div id="options" class="dropdown-content">
 	<label th:each="btc : ${batches}">
        <input type="checkbox" name="batches" th:value="${btc.name}">
        <span th:text="${btc.name}"></span>
    </label>            
        </div>
    </div>
    <div class="selected-items"></div>
    
    <label for="purpose">Session Purpose:</label>
    <input type="text" id="purpose" name="session" value="Parade" required>
            
            <button type="submit">Submit</button>
            <button type="button" onclick="hideStartAttendanceForm()">Cancel</button>
        </form>
        
     
    </div>
    <script>
        function toggleDropdown() {
            const dropdown = document.getElementById("options");
            dropdown.classList.toggle("show");
        }

        window.onclick = function (event) {
            if (!event.target.closest('.dropdown')) {
                const dropdowns = document.getElementsByClassName("dropdown-content");
                for (let i = 0; i < dropdowns.length; i++) {
                    let openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }

        document.querySelectorAll('.dropdown-content input[type="checkbox"]').forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                const text = this.value;
                const selectedItems = document.querySelector('.selected-items');
                const existingItem = selectedItems.querySelector(`[data-value="${text}"]`);

                if (this.checked) {
                    if (!existingItem) {
                        const selectedItem = document.createElement('div');
                        selectedItem.setAttribute('data-value', text);
                        selectedItem.innerText = text;
                        selectedItems.appendChild(selectedItem);
                    }
                } else {
                    if (existingItem) {
                        existingItem.remove();
                    }
                }
            });
        });
    </script>
</body>
</html>
