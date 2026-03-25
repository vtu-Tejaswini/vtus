<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Examination in Progress</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --deep-purple: #613DC1;
            --mauve-pink: #D883B7;
            --light-mauve: #F5E8F0;
            --soft-white: #FCFAFD;
        }

        body {
            background-color: var(--light-mauve);
            font-family: 'Inter', sans-serif;
            color: #333;
        }

        .quiz-header {
            background: linear-gradient(135deg, var(--deep-purple), var(--mauve-pink));
            color: white;
            padding: 40px 0;
            margin-bottom: -50px;
            border-bottom-left-radius: 50% 20px;
            border-bottom-right-radius: 50% 20px;
        }

        .question-card {
            background: white;
            border: none;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 4px 15px rgba(97, 61, 193, 0.05);
        }

        .question-text {
            font-size: 1.15rem;
            font-weight: 600;
            color: var(--deep-purple);
            margin-bottom: 20px;
        }

        /* Custom Radio Styling */
        .option-container {
            display: block;
            position: relative;
            padding: 12px 15px 12px 45px;
            margin-bottom: 12px;
            cursor: pointer;
            border: 1px solid #eee;
            border-radius: 10px;
            transition: all 0.2s ease;
        }

        .option-container:hover {
            background-color: var(--soft-white);
            border-color: var(--mauve-pink);
        }

        .option-container input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }

        .checkmark {
            position: absolute;
            top: 13px;
            left: 15px;
            height: 20px;
            width: 20px;
            background-color: #eee;
            border-radius: 50%;
        }

        .option-container input:checked ~ .checkmark {
            background-color: var(--deep-purple);
        }

        .option-container input:checked ~ .checkmark:after {
            display: block;
        }

        .option-container .checkmark:after {
            content: "";
            position: absolute;
            display: none;
            left: 7px;
            top: 4px;
            width: 6px;
            height: 10px;
            border: solid white;
            border-width: 0 2px 2px 0;
            transform: rotate(45deg);
        }

        .option-container input:checked + span {
            font-weight: 600;
            color: var(--deep-purple);
        }

        .btn-submit {
            background: var(--deep-purple);
            border: none;
            padding: 12px 40px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 30px;
            transition: transform 0.2s;
            box-shadow: 0 4px 15px rgba(97, 61, 193, 0.3);
        }

        .btn-submit:hover {
            background: #4e319b;
            transform: scale(1.05);
            color: white;
        }
    </style>
</head>
<body>

<div class="quiz-header text-center">
    <div class="container">
        <h1 class="fw-bold">Online Examination</h1>
        <p class="opacity-75">Please read each question carefully before selecting your answer.</p>
    </div>
</div>

<div class="container mt-5 pt-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <form action="/student/submitQuiz" method="post">
                <input type="hidden" name="quizId" value="${quizId}" />

                <c:forEach var="q" items="${questions}" varStatus="status">
                    <div class="question-card">
                        <div class="question-text">
                            <span class="badge bg-light text-primary me-2">Q${status.count}</span>
                            ${q.questionText}
                        </div>

                        <label class="option-container">
                            <input type="radio" name="q_${q.id}" value="A" required>
                            <span>${q.optionA}</span>
                            <span class="checkmark"></span>
                        </label>

                        <label class="option-container">
                            <input type="radio" name="q_${q.id}" value="B">
                            <span>${q.optionB}</span>
                            <span class="checkmark"></span>
                        </label>

                        <label class="option-container">
                            <input type="radio" name="q_${q.id}" value="C">
                            <span>${q.optionC}</span>
                            <span class="checkmark"></span>
                        </label>

                        <label class="option-container">
                            <input type="radio" name="q_${q.id}" value="D">
                            <span>${q.optionD}</span>
                            <span class="checkmark"></span>
                        </label>
                    </div>
                </c:forEach>

                <div class="text-center pb-5">
                    <button type="submit" class="btn btn-submit text-white">Finish and Submit Quiz</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>