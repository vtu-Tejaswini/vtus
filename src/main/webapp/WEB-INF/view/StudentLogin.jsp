<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login | Exam Portal</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --bg-gradient: linear-gradient(45deg, #e9defa 0%, #fbfcdb 100%);
            --accent-primary: #7c4dff;
            --accent-secondary: #f48fb1;
            --glass: rgba(255, 255, 255, 0.7);
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--bg-gradient);
            font-family: 'Plus Jakarta Sans', sans-serif;
            margin: 0;
            overflow: hidden;
            perspective: 1000px;
        }

        /* --- Animated 3D Background Shapes (No Images Needed) --- */
        .orb {
            position: absolute;
            border-radius: 50%;
            filter: blur(40px);
            z-index: 0;
            animation: move 20s infinite alternate;
        }
        .orb-1 { width: 400px; height: 400px; background: #d1c4e9; top: -10%; left: -10%; }
        .orb-2 { width: 300px; height: 300px; background: #ffcdd2; bottom: -5%; right: -5%; animation-delay: -5s; }
        .orb-3 { width: 250px; height: 250px; background: #bbdefb; top: 40%; left: 60%; animation-delay: -10s; }

        @keyframes move {
            from { transform: translate(0, 0) scale(1); }
            to { transform: translate(50px, 100px) scale(1.2); }
        }

        /* --- Floating 3D CSS Objects --- */
        .cube {
            position: absolute;
            width: 60px; height: 60px;
            background: linear-gradient(var(--accent-primary), var(--accent-secondary));
            opacity: 0.4;
            animation: rotate 10s infinite linear;
            z-index: 0;
        }
        .cube-1 { top: 15%; right: 15%; }
        .cube-2 { bottom: 15%; left: 10%; width: 40px; height: 40px; animation-duration: 15s; }

        @keyframes rotate {
            0% { transform: rotateX(0) rotateY(0) rotateZ(0); }
            100% { transform: rotateX(360deg) rotateY(360deg) rotateZ(360deg); }
        }

        /* --- The Glass-Neumorphic Card --- */
        .main-card {
            background: var(--glass);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.4);
            border-radius: 40px;
            padding: 3.5rem;
            width: 100%;
            max-width: 480px;
            z-index: 10;
            box-shadow: 20px 20px 60px rgba(0, 0, 0, 0.05), 
                        -20px -20px 60px rgba(255, 255, 255, 0.8);
            transform-style: preserve-3d;
            transition: transform 0.1s ease-out;
        }

        .header h2 {
            font-weight: 800;
            background: linear-gradient(to right, var(--accent-primary), var(--accent-secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: -1px;
        }

        /* --- Sunken Neumorphic Inputs --- */
        .input-wrapper {
            background: rgba(255, 255, 255, 0.5);
            border-radius: 20px;
            margin-bottom: 1.5rem;
            box-shadow: inset 4px 4px 8px rgba(0,0,0,0.05), 
                        inset -4px -4px 8px rgba(255,255,255,0.9);
            transition: 0.3s;
            border: 1px solid transparent;
        }

        .input-wrapper:focus-within {
            border-color: var(--accent-primary);
            background: white;
            transform: translateY(-2px);
        }

        .input-group-text {
            background: transparent !important;
            border: none !important;
            color: var(--accent-primary);
            padding-left: 1.5rem;
        }

        .form-control {
            background: transparent !important;
            border: none !important;
            padding: 18px 15px !important;
            font-size: 1rem;
            color: #444;
        }

        /* --- The Magnetic Button --- */
        .btn-register {
            background: linear-gradient(135deg, var(--accent-primary), var(--accent-secondary));
            border: none;
            border-radius: 20px;
            padding: 16px;
            font-weight: 700;
            color: white;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-top: 1rem;
            box-shadow: 0 10px 20px rgba(124, 77, 255, 0.3);
            transition: 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .btn-register:hover {
            transform: scale(1.03);
            box-shadow: 0 15px 30px rgba(124, 77, 255, 0.5);
            color: white;
        }

        .login-link a {
            color: var(--accent-primary);
            text-decoration: none;
            font-weight: 800;
            position: relative;
        }
        .login-link a::after {
            content: '';
            position: absolute;
            width: 0; height: 2px; bottom: -2px; left: 0;
            background: var(--accent-secondary);
            transition: 0.3s;
        }
        .login-link a:hover::after { width: 100%; }

    </style>
</head>
<body>

    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    <div class="orb orb-3"></div>
    <div class="cube cube-1"></div>
    <div class="cube cube-2"></div>

    <div class="main-card" id="card">
        <div class="header text-center mb-5">
            <h2>Portal Entry</h2>
            <p class="text-muted">Unlock your potential. Step inside.</p>
        </div>

        <form action="${pageContext.request.contextPath}/student/login" method="post">
            <div class="row">
                <div class="col-md-6 mb-1">
                    <div class="input-wrapper d-flex align-items-center">
                        <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                        <input type="text" name="firstName" class="form-control" placeholder="First" required>
                    </div>
                </div>
                <div class="col-md-6 mb-1">
                    <div class="input-wrapper d-flex align-items-center">
                        <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                        <input type="text" name="lastName" class="form-control" placeholder="Last" required>
                    </div>
                </div>
            </div>

            <div class="input-wrapper d-flex align-items-center">
                <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
                <input type="email" name="email" class="form-control" placeholder="Institutional Email" required>
            </div>

            <div class="input-wrapper d-flex align-items-center mb-4">
                <span class="input-group-text"><i class="fa-solid fa-shield-halved"></i></span>
                <input type="password" name="password" class="form-control" placeholder="Security Token (Pass)" required minlength="6">
            </div>

            <button type="submit" class="btn btn-register w-100">Initialize Access</button>
        </form>

        <div class="login-link text-center mt-4">
            <span class="text-muted small">Recognized member?</span> 
            <a href="${pageContext.request.contextPath}/student/signup" class="ms-1">Login Here</a>
        </div>
    </div>

    <script>
        const card = document.getElementById('card');
        document.addEventListener('mousemove', (e) => {
            let xAxis = (window.innerWidth / 2 - e.pageX) / 25;
            let yAxis = (window.innerHeight / 2 - e.pageY) / 25;
            card.style.transform = `rotateY(${xAxis}deg) rotateX(${yAxis}deg)`;
        });

        // Reset on mouse leave
        document.addEventListener('mouseleave', () => {
            card.style.transform = `rotateY(0deg) rotateX(0deg)`;
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>