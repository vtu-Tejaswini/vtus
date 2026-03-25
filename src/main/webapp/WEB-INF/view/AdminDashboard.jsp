<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Admin Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2b1055, #7597de);
        }

        .container {
            padding: 2rem;
            color: white;
        }

        h1 {
            text-align: center;
            margin-bottom: 2rem;
        }

        /* Cards */
        .card-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-bottom: 2rem;
        }

        .card {
            background: white;
            color: #2b1055;
            padding: 1.5rem;
            border-radius: 1rem;
            width: 200px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            margin: 10px;
        }

        .card h2 {
            margin: 0;
        }

        /* Buttons */
        .actions {
            text-align: center;
            margin-bottom: 2rem;
        }

        .btn {
            background: #7597de;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin: 5px;
            font-size: 1rem;
            font-weight: 600;
        }

        .btn:hover {
            background: #5a7ed4;
        }

        /* Table */
        table {
            width: 100%;
            background: white;
            border-radius: 1rem;
            overflow: hidden;
            color: #333;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background: #2b1055;
            color: white;
        }

        tr:nth-child(even) {
            background: #f2f2f2;
        }

        .logout {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .message {
            text-align: center;
            margin-bottom: 1rem;
            font-weight: bold;
        }

        .success {
            color: #00ffcc;
        }
    </style>
</head>

<body>

<div class="container">

    <!-- Logout -->
    <a href="${pageContext.request.contextPath}/admin/logout" class="btn logout">Logout</a>

    <h1>Admin Dashboard</h1>

    <!-- Success Message -->
    <c:if test="${not empty success}">
        <div class="message success">${success}</div>
    </c:if>

    <!-- 🔥 Stats -->
    <div class="card-container">
        <div class="card">
            <h2>${totalQuizzes}</h2>
            <p>Quizzes</p>
        </div>

        <div class="card">
            <h2>${totalStudents}</h2>
            <p>Students</p>
        </div>

        <div class="card">
            <h2>${totalAttempts}</h2>
            <p>Attempts</p>
        </div>

        <div class="card">
            <h2>${avgScore}</h2>
            <p>Avg Score</p>
        </div>
    </div>

    <!-- 🔘 Actions -->
    <div class="actions">
        <a href="${pageContext.request.contextPath}/admin/createQuiz">
            <button class="btn">Create Quiz</button>
        </a>

        <a href="${pageContext.request.contextPath}/admin/dashboard">
            <button class="btn">Refresh</button>
        </a>
    </div>

    <!-- 📋 Quiz Table -->
    <table>
        <tr>
            <th>Quiz Title</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>

        <c:if test="${empty quizList}">
            <tr>
                <td colspan="3">No quizzes available</td>
            </tr>
        </c:if>

        <c:forEach var="quiz" items="${quizList}">
            <tr>
                <td>${quiz.title}</td>
                <td>${quiz.description}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/addQuestions?quizId=${quiz.id}">
                        <button class="btn">Add Questions</button>
                    </a>
                </td>
            </tr>
        </c:forEach>

    </table>

</div>

</body>
</html>