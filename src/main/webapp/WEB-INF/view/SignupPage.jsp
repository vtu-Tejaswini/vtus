<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Signup</title>

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
      width: 320px;
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
    }

    .btn:hover {
      background: #5a7ed4;
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

    .success-message {
      color: green;
      margin-bottom: 1rem;
      font-size: 0.9rem;
    }
  </style>
</head>

<body>
  <div class="login-container">
    <h2>Signup</h2>

    <!-- Error Message -->
    <c:if test="${not empty errorMessage}">
      <div class="error-message">${errorMessage}</div>
    </c:if>

    <!-- Success Message -->
    <c:if test="${not empty successMessage}">
      <div class="success-message">${successMessage}</div>
    </c:if>

    <!-- Signup Form -->
    <form action="${pageContext.request.contextPath}/admin/signup" method="post">

      <div class="input-group">
        <label>First Name</label>
        <input type="text" name="firstName" placeholder="Enter first name" required minlength="2">
      </div>

      <div class="input-group">
        <label>Last Name</label>
        <input type="text" name="lastName" placeholder="Enter last name" required minlength="2">
      </div>

      <div class="input-group">
        <label>Email</label>
        <input type="email" name="email" placeholder="Enter email" required>
      </div>

      <div class="input-group">
        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required minlength="4">
      </div>

      <button type="submit" class="btn">Register</button>
    </form>

    <div class="extra-links">
      <p>Already have an account?
        <a href="${pageContext.request.contextPath}/admin/login">Login</a>
      </p>
    </div>
  </div>
</body>
</html>