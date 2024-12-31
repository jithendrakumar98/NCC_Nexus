<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: Raleway, sans-serif;
    }

    body {
      background:white;
      margin: 0; 
  padding: 0;
  overflow: hidden; 
  width: 100vw; 
  height: 100vh;
    }

    .container {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 70vh;
      z-index: 2;
    }

    .screen {
      background: linear-gradient(90deg, #2b4d88, #7394cc);
      position: relative;
      height: 520px;
      width: 400px;
      border-radius: 0px 12px 12px 0px;
      box-shadow: 0px 0px 24px #2b4d88;
    }

    .screen__content {
      z-index: 1;
      position: relative;
      height: 100%;
    }

    .screen__background {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      z-index: 0;
      -webkit-clip-path: inset(0 0 0 0);
      clip-path: inset(0 0 0 0);
    }

    .screen__background__shape {
      transform: rotate(45deg);
      position: absolute;
    }

    .screen__background__shape1 {
      height: 520px;
      width: 520px;
      background: #FFF;
      top: -50px;
      right: 120px;
      border-radius: 0 72px 0 0;
    }

    .screen__background__shape2 {
      height: 220px;
      width: 220px;
      background: #4472C4;
      top: -172px;
      right: 0;
      border-radius: 32px;
    }

    .screen__background__shape3 {
      height: 540px;
      width: 190px;
      background: linear-gradient(270deg, #4472C4, #6793df);
      top: -24px;
      right: 0;
      border-radius: 32px;
    }

    .screen__background__shape4 {
      height: 400px;
      width: 200px;
      background: #6793df;
      top: 420px;
      right: 50px;
      border-radius: 60px;
    }

    .login {
      width: 320px;
      padding: 30px;
      padding-top: 156px;
    }

    .login__field {
      padding: 20px 0px;
      position: relative;
    }

    

    .login__input {
      border: none;
      border-bottom: 6px solid #4472C4;
      background: none;
      padding: 10px;
      padding-left: 24px;
      font-weight: 1000;
      
      width: 95%;
      transition: .2s;
      color: #4472C4;
    }

    .login__input:active,
    .login__input:focus,
    .login__input:hover {
      outline: none;
      border-bottom-color: #4472C4;
    }

    .login__submit {
      background: #fff;
      font-size: 14px;
      margin-top: 30px;
      padding: 16px 20px;
      border-radius: 26px;
      border: 5px solid #D4D3E8;
      text-transform: uppercase;
      font-weight: 1000;
      display: flex; 
  justify-content: center; 
  align-items: center;
      width: 100%;
      color: #4472C4;
      box-shadow: 0px 2px 2px #4472C4;
      cursor: pointer;
      transition: .2s;
    }

    .login__submit:active,
    .login__submit:focus,
    .login__submit:hover {
      border-color: #4472C4;
      outline: none;
    }

    .login__input::placeholder {
  color: #4472C4;; 
  font-weight: 1000; 
}


    .main-container {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  gap: 0px;
  z-index: 2;
}

.title {
  z-index: 2;
  text-align: center;
  display: flex;
  flex-direction: column;
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
  border-radius: 12px 0px 0px 0px;
  padding: 10px 133px;
}

.nexus {
  background-color: #4472C4;
  color: white;
  border-radius: 0px 0px 0px 12px;
  padding: 20px 20px;
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

    
  </style>
    <link href="https://fonts.googleapis.com/css?family=Archivo+Black&display=swap" rel="stylesheet">
</head>
<body>
    <div id="particles-js"></div>
    <div class="main-container">
        <div class="title">
          <span class="ncc">NCC</span>
          <span class="nexus">NEXUS</span>
        </div>
        <div class="container">
          <div class="screen">
            <div class="screen__content">
              <form action="/login" method="post" class="login">
                <div class="login__field">
                  <input type="text" class="login__input" placeholder="username" id="username" name="username">
                </div>
                <div class="login__field">
                  <input type="password" class="login__input" placeholder="password" id="password" name="password">
                </div>
                <button class="button login__submit">
                  <span class="button__text">LOGIN</span>
                </button>
              </form>
            </div>
            <div class="screen__background">
              <span class="screen__background__shape screen__background__shape4"></span>
              <span class="screen__background__shape screen__background__shape3"></span>
              <span class="screen__background__shape screen__background__shape2"></span>
              <span class="screen__background__shape screen__background__shape1"></span>
            </div>
          </div>
        </div>
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
