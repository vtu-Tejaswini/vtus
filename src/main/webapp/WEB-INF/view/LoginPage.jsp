<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
    <%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background: linear-gradient(135deg, #2b1055, #7597de);
      font-family: Arial, sans-serif;
    }

    .login-container {
      background: white;
      padding: 2rem;
      border-radius: 1.5rem;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
      width: 300px;
      text-align: center;
    }

    .login-container h2 {
      margin-bottom: 1.5rem;
      color: #2b1055;
    }

    .input-group {
      display: flex;
      flex-direction: column;
      margin-bottom: 1rem;
      text-align: left;
    }

    .input-group label {
      font-weight: 600;
      margin-bottom: 5px;
      color: #333;
    }

    .input-group input {
      padding: 10px;
      border-radius: 8px;
      border: 1px solid #ccc;
      outline: none;
      font-size: 1rem;
      transition: border-color 0.2s ease;
    }

    .input-group input:focus {
      border-color: #7597de;
      box-shadow: 0 0 5px rgba(117, 151, 222, 0.5);
    }

    .btn {
      background: #7597de;
      color: white;
      padding: 10px;
      width: 100%;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-size: 1rem;
      font-weight: 600;
      transition: background 0.2s ease, transform 0.2s ease;
    }

    .btn:hover {
      background: #5a7ed4;
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(90, 126, 212, 0.3);
    }

    .extra-links {
      margin-top: 1rem;
      font-size: 0.9rem;
    }

    .extra-links a {
      color: #7597de;
      text-decoration: none;
    }

    .extra-links a:hover {
      text-decoration: underline;
    }

    .error-message {
      color: red;
      margin-bottom: 1rem;
      font-size: 0.9rem;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Login</h2>

    <!-- Login form -->
    <form action="${pageContext.request.contextPath}/admin/login" method="post">
      <div class="input-group">
        <label for="email">Email id</label>
        <input type="text" id="email" name="email" placeholder="Enter email" required>
      </div>
      <div class="input-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter password" required>
      </div>

      <!-- Error message -->
      <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
      </c:if>

      <button type="submit" class="btn">Login</button>
    </form>

    <div class="extra-links">
      <p><a href="#">Forgot Password?</a></p>
      <p>Don't have an account? <a href="${pageContext.request.contextPath}/admin/signup">Sign Up</a></p>
    </div>
  </div>
</body>
</html>
