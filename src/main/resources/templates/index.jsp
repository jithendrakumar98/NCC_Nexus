<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>NCC NEXUS</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;  
      font-family: 'Archivo Black', sans-serif;
    }

    body, html {
  height: 100%;
  background-repeat: no-repeat;
  background: white;
  position: relative;
  overflow: hidden; /* Prevent vertical and horizontal scrolling */
}


    #particles-js {
      width: 100%;
      height: 100%;
      background-size: cover;
      background-position: 50% 50%;
      position: fixed;
      top: 0px;
      z-index: 1;
    }

    .title {
      position: relative;
      z-index: 2;
      text-align: center;
      margin-top: 10vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .ncc,
    .nexus {
      font-size: 12rem;
      text-shadow: 10px 10px 20px rgba(0, 0, 0, 0.8);
    }

    .ncc {
      color: #4472C4;
      border: 10px solid #4472C4;
      border-radius: 12px 0px 0px 12px;
      padding: 10px 20px;
    }

    .nexus {
      background-color: #4472C4;
      color: white;
      border-radius: 0px 12px 12px 0px;
      padding: 20px 20px;
    }

    /* Form styling */
    #login-btn {
      position: absolute;
      bottom: 140px; /* Positioned towards the bottom with a gap */
      width: 100%;
      display: flex;
      justify-content: center; /* Centering form horizontally */
      z-index: 2;
    }

    form {
      display: flex;
      justify-content: center; /* Center form content */
      align-items: center;
      flex-direction: column; /* Stack the button vertically */
      width: 300px; /* Set the width of the form */
      background-color: rgba(255, 255, 255, 0.8); /* Slight background for the form */
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      z-index: 2;
    }

    input[type="submit"] {
      padding: 15px 30px;
      font-size: 1.5rem;
      color: white;
      background-color: #4472C4;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      width: 100%;
      transition: background-color 0.3s ease, transform 0.3s ease;
      border-radius: 40px;
    }

    input[type="submit"]:hover {
      background-color: #335a9f;
      transform: translateY(-3px);
    }

  </style>
  <link href="https://fonts.googleapis.com/css?family=Archivo+Black&display=swap" rel="stylesheet">
</head>
<body>

<div id="particles-js"></div>

<div class="title">
  <span class="ncc">NCC</span>
  <span class="nexus">NEXUS</span>
</div>

<div id="login-btn">
  <form action="/login">
    <input type="submit" value="LOGIN">
  </form>
</div>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script>
  window.onload = function() {
    var script = document.createElement('script');
    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js';
    script.onload = function() {
      particlesJS('particles-js', {
        "particles": {
          "number": {
            "value": 200,
            "density": {
              "enable": true,
              "value_area": 500
            }
          },
          "color": {
            "value": "#4472C4"
          },
          "shape": {
            "type": "circle",
            "stroke": {
              "width": 0,
              "color": "#000000"
            },
            "polygon": {
              "nb_sides": 5
            },
            "image": {
              "width": 100,
              "height": 100
            }
          },
          "opacity": {
            "value": 0.5,
            "random": false,
            "anim": {
              "enable": false,
              "speed": 1,
              "opacity_min": 0.1,
              "sync": false
            }
          },
          "size": {
            "value": 8,
            "random": true,
            "anim": {
              "enable": false,
              "speed": 60,
              "size_min": 0.1,
              "sync": false
            }
          },
          "line_linked": {
            "enable": true,
            "distance": 150,
            "color": "#4472C4",
            "opacity": 0.7,
            "width": 1
          },
          "move": {
            "enable": true,
            "speed": 6,
            "direction": "none",
            "random": false,
            "straight": false,
            "out_mode": "out",
            "attract": {
              "enable": false,
              "rotateX": 600,
              "rotateY": 1200
            }
          }
        },
        "interactivity": {
          "detect_on": "canvas",
          "events": {
            "onhover": {
              "enable": true,
              "mode": "repulse"
            },
            "onclick": {
              "enable": true,
              "mode": "push"
            },
            "resize": true
          },
          "modes": {
            "grab": {
              "distance": 400,
              "line_linked": {
                "opacity": 1
              }
            },
            "bubble": {
              "distance": 400,
              "size": 30,
              "duration": 2,
              "opacity": 8,
              "speed": 3
            },
            "repulse": {
              "distance": 100
            },
            "push": {
              "particles_nb": 4
            },
            "remove": {
              "particles_nb": 2
            }
          }
        },
        "retina_detect": true,
        "config_demo": {
          "hide_card": false,
          "background_color": "#ff0000",
          "background_image": "",
          "background_position": "50% 50%",
          "background_repeat": "no-repeat",
          "background_size": "cover"
        }
      });
    };
    document.head.appendChild(script);
  };
</script>

</body>
</html>
