<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --deep-purple: #613DC1;
            --mauve-pink: #D883B7;
            --bg-soft: #F9F7FD;
        }

        body {
            background-color: var(--bg-soft);
            font-family: 'Inter', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        .result-card {
            background: white;
            border: none;
            border-radius: 24px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(97, 61, 193, 0.1);
            max-width: 500px;
            width: 90%;
            text-align: center;
        }

        /* Circular Progress */
        .score-circle {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: conic-gradient(
                var(--deep-purple) ${ (score/total) * 100 }%, 
                #e9ecef 0
            );
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            position: relative;
        }

        .score-circle::before {
            content: "";
            position: absolute;
            width: 125px;
            height: 125px;
            background: white;
            border-radius: 50%;
        }

        .score-text {
            position: relative;
            font-size: 2rem;
            font-weight: 800;
            color: var(--deep-purple);
        }

        .status-badge {
            display: inline-block;
            padding: 8px 20px;
            border-radius: 50px;
            font-weight: 600;
            margin-bottom: 20px;
            background-color: ${(score/total >= 0.5) ? '#e6fcf5' : '#fff5f5'};
            color: ${(score/total >= 0.5) ? '#087f5b' : '#c92a2a'};
        }

        .btn-dashboard {
            background: linear-gradient(135deg, var(--deep-purple), var(--mauve-pink));
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 12px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .btn-dashboard:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(216, 131, 183, 0.4);
            color: white;
        }
    </style>
</head>
<body>

<div class="result-card">
    <h2 class="fw-bold mb-4">Quiz Completed!</h2>

    <div class="score-circle">
        <div class="score-text">
            ${score}<span style="font-size: 1rem; color: #999;">/${total}</span>
        </div>
    </div>

    <div class="status-badge">
        <c:choose>
            <c:when test="${score/total >= 0.8}">Excellent Work! 🌟</c:when>
            <c:when test="${score/total >= 0.5}">Good Effort! 👍</c:when>
            <c:otherwise>Keep Practicing! 📚</c:otherwise>
        </c:choose>
    </div>

    <p class="text-muted mb-4">
        You answered <strong>${score}</strong> out of <strong>${total}</strong> questions correctly. 
        Your percentage is <strong>${ (score/total) * 100 }%</strong>.
    </p>

    <div class="d-grid">
        <a href="/student/dashboard" class="btn-dashboard">Back to Dashboard</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>