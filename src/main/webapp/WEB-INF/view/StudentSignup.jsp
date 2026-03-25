<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration | Exam Portal</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --pastel-bg-start: #E6E6FA; /* Soft Lavender */
            --pastel-bg-end: #FFD1DC;   /* Pastel Pink */
            --violet-accent: #8B5CF6;
            --mauve-accent: #D883B7;
            --neu-base: #F0F0F3;       /* Neumorphic off-white */
            --neu-shadow-dark: #d1d9e6;
            --neu-shadow-light: #ffffff;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            /* Airy Pastel Gradient */
            background: linear-gradient(135deg, var(--pastel-bg-start) 0%, var(--pastel-bg-end) 100%);
            font-family: 'Plus Jakarta Sans', sans-serif;
            margin: 0;
            overflow: hidden;
            position: relative;
            padding: 20px;
        }

        /* ---------------------------------
           3D Floating Background Assets
        ---------------------------------- */
        .obj-3d {
            position: absolute;
            z-index: 0;
            opacity: 0.6;
            filter: drop-shadow(0 10px 15px rgba(0,0,0,0.1));
            animation: float 6s ease-in-out infinite;
        }

        /* 3D A+ Grade (Top Left) */
        .obj-a-plus {
            width: 150px; height: 150px;
            top: 10%; left: 10%;
            background: url('https://cdn-icons-png.flaticon.com/512/3135/3135810.png') no-repeat center;
            background-size: contain;
            animation-delay: 0s;
        }

        /* 3D Graduation Cap (Center Back) */
        .obj-grad-cap {
            width: 250px; height: 250px;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            background: url('https://cdn-icons-png.flaticon.com/512/3135/3135805.png') no-repeat center;
            background-size: contain;
            opacity: 0.2; /* Subtle background presence */
            animation: floatComplex 10s ease-in-out infinite;
        }

        /* 3D Open Book (Bottom Right) */
        .obj-book {
            width: 180px; height: 180px;
            bottom: 10%; right: 10%;
            background: url('https://cdn-icons-png.flaticon.com/512/3135/3135803.png') no-repeat center;
            background-size: contain;
            animation-delay: 2s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-30px) rotate(5deg); }
        }

        @keyframes floatComplex {
            0%, 100% { transform: translate(-50%, -50%) scale(1) rotate(0deg); }
            50% { transform: translate(-50%, -55%) scale(1.05) rotate(-5deg); }
        }

        /* ---------------------------------
           Neumorphic Signup Container
        ---------------------------------- */
        .signup-container {
            background: var(--neu-base);
            padding: 3rem;
            border-radius: 30px;
            width: 100%;
            max-width: 520px;
            z-index: 1;
            position: relative;
            /* Neumorphic Extrusion Effect */
            box-shadow: 10px 10px 20px var(--neu-shadow-dark),
                       -10px -10px 20px var(--neu-shadow-light);
            transition: all 0.3s ease;
        }

        .signup-container:hover {
            box-shadow: 15px 15px 30px var(--neu-shadow-dark),
                       -15px -15px 30px var(--neu-shadow-light);
        }

        .header h2 { font-weight: 700; color: var(--violet-accent); letter-spacing: -1px; }
        .header p { color: #666; font-size: 0.9rem; }

        /* Neumorphic Input Group */
        .input-group {
            background: var(--neu-base);
            border-radius: 12px;
            padding: 2px;
            /* Neumorphic Inset (Pressed) Effect */
            box-shadow: inset 4px 4px 6px var(--neu-shadow-dark),
                       inset -4px -4px 6px var(--neu-shadow-light);
            border: none;
        }
        .input-group:focus-within {
            box-shadow: inset 6px 6px 10px var(--neu-shadow-dark),
                       inset -6px -6px 10px var(--neu-shadow-light);
            transform: scale(1.01);
        }

        .input-group-text { background: transparent; border: none; color: var(--violet-accent); padding-left: 1rem; }
        
        .form-control {
            background: transparent;
            border: none;
            color: #333 !important;
            padding: 14px;
            font-size: 0.9rem;
        }
        .form-control::placeholder { color: #999; }
        .form-control:focus { background: transparent; box-shadow: none; }

        /* Button Styling */
        .btn-register {
            background: linear-gradient(135deg, var(--violet-accent), var(--mauve-accent));
            border: none;
            padding: 14px;
            border-radius: 12px;
            font-weight: 700;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 1rem;
            transition: 0.3s;
            box-shadow: 3px 3px 6px rgba(139, 92, 246, 0.3);
        }
        .btn-register:hover {
            box-shadow: 5px 5px 15px rgba(216, 131, 183, 0.4);
            transform: translateY(-2px);
            color: white;
        }

        /* Message Styling */
        .status-msg { border-radius: 10px; padding: 10px; font-size: 0.85rem; margin-bottom: 1.5rem; text-align: center;}
        .error-msg { background: #fff5f5; border: 1px solid #ffc9c9; color: #e03131; }
        .success-msg { background: #e6fcf5; border: 1px solid #c3fae8; color: #087f5b; }

        .login-link { margin-top: 1.5rem; font-size: 0.85rem; color: #666; }
        .login-link a { color: var(--violet-accent); text-decoration: none; font-weight: 700; border-bottom: 2px solid var(--mauve-accent); transition: 0.3s; }
        .login-link a:hover { color: var(--mauve-accent); }
    </style>
</head>
<body>

    <div class="obj-3d obj-a-plus"></div>
    <div class="obj-3d obj-grad-cap"></div>
    <div class="obj-3d obj-book"></div>

    <div class="signup-container">
        <div class="header text-center mb-4">
            <h2>Start Your Exam Journey</h2>
            <p>Create your student account to access tests and results.</p>
        </div>

        <c:if test="${not empty errorMessage}">
            <div class="status-msg error-msg"><i class="fa-solid fa-triangle-exclamation me-2"></i>${errorMessage}</div>
        </c:if>
        <c:if test="${not empty successMessage}">
            <div class="status-msg success-msg"><i class="fa-solid fa-circle-check me-2"></i>${successMessage}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/student/signup" method="post">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
                        <input type="text" name="firstName" class="form-control" placeholder="First Name" required>
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fa-solid fa-user-tag"></i></span>
                        <input type="text" name="lastName" class="form-control" placeholder="Last Name" required>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <div class="input-group">
                    <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
                    <input type="email" name="email" class="form-control" placeholder="Email Address (e.g., student@school.edu)" required>
                </div>
            </div>

            <div class="mb-4">
                <div class="input-group">
                    <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
                    <input type="password" name="password" class="form-control" placeholder="Create Password (min. 6 characters)" required minlength="6">
                </div>
            </div>

            <button type="submit" class="btn btn-register w-100">Get Registered</button>
        </form>

        <div class="login-link text-center">
            Already registered? <a href="${pageContext.request.contextPath}/student/login">Log In Instead</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>