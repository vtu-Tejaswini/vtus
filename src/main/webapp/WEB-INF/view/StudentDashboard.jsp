<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Quizzes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; }
        .quiz-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 12px;
        }
        .quiz-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
        }
        .btn-start {
            background-color: #6c63ff;
            color: white;
            border-radius: 8px;
            padding: 8px 20px;
            font-weight: 600;
        }
        .btn-start:hover { background-color: #5751d9; color: white; }
        .navbar-brand { font-weight: 600; color: #6c63ff !important; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand" href="#">Exam Portal</a>
    </div>
</nav>

<div class="container">
    <div class="text-center mb-5">
        <h2 class="fw-bold">Available Quizzes</h2>
        <p class="text-muted">Select a topic and challenge yourself!</p>
    </div>

    <div class="row g-4">
        <c:forEach var="quiz" items="${quizList}">
            <div class="col-md-4">
                <div class="card h-100 shadow-sm quiz-card">
                    <div class="card-body d-flex flex-column">
                        <div class="mb-2">
                            <span class="badge bg-light text-primary border">Quiz</span>
                        </div>
                        <h4 class="card-title fw-semibold">${quiz.title}</h4>
                        <p class="card-text text-secondary flex-grow-1">${quiz.description}</p>
                        
                        <div class="mt-3">
                            <a href="/student/startQuiz?quizId=${quiz.id}" class="text-decoration-none">
                                <button class="btn btn-start w-100">Start Quiz</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    
    <c:if test="${empty quizList}">
        <div class="alert alert-info text-center mt-5">
            No quizzes are currently available. Please check back later!
        </div>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>