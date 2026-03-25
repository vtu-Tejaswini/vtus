<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Quiz</title>

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

        .container {
            background: white;
            padding: 2rem;
            border-radius: 1.5rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #2b1055;
            margin-bottom: 1.5rem;
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

        .input-group input,
        .input-group textarea {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            outline: none;
        }

        .input-group input:focus,
        .input-group textarea:focus {
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

        .back-link {
            margin-top: 1rem;
            display: block;
            font-size: 0.9rem;
        }

        .back-link a {
            color: #7597de;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        .message {
            margin-bottom: 1rem;
            font-size: 0.9rem;
            color: green;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Create Quiz</h2>

    <c:if test="${not empty success}">
        <div class="message">${success}</div>
    </c:if>

    <form action="/admin/saveQuiz" method="post">

        <div class="input-group">
            <label>Quiz Title</label>
            <input type="text" name="title" required>
        </div>

        <div class="input-group">
            <label>Description</label>
            <textarea name="description" rows="3" required></textarea>
        </div>

        <button type="submit" class="btn">Create Quiz</button>
    </form>

    <div class="back-link">
        <a href="/admin/dashboard">← Back to Dashboard</a>
    </div>

</div>

</body>
</html>