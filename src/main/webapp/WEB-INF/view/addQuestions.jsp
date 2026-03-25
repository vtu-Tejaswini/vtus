<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Add Questions</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2b1055, #7597de);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 2rem;
            border-radius: 1.5rem;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #2b1055;
            margin-bottom: 1.5rem;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 1rem;
        }

        .input-group label {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .input-group input,
        .input-group textarea,
        .input-group select {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            outline: none;
        }

        .input-group input:focus,
        .input-group textarea:focus,
        .input-group select:focus {
            border-color: #7597de;
            box-shadow: 0 0 5px rgba(117,151,222,0.5);
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
            margin-top: 10px;
        }

        .btn:hover {
            background: #5a7ed4;
        }

        .back-btn {
            margin-top: 10px;
            background: #2b1055;
        }

    </style>
</head>

<body>

<div class="container">

    <h2>Add Question</h2>

    <form action="${pageContext.request.contextPath}/admin/saveQuestion" method="post">

        <!-- Hidden quizId -->
        <input type="hidden" name="quizId" value="${quizId}" />

        <div class="input-group">
            <label>Question</label>
            <textarea name="questionText" required></textarea>
        </div>

        <div class="input-group">
            <label>Option A</label>
            <input type="text" name="optionA" required>
        </div>

        <div class="input-group">
            <label>Option B</label>
            <input type="text" name="optionB" required>
        </div>

        <div class="input-group">
            <label>Option C</label>
            <input type="text" name="optionC" required>
        </div>

        <div class="input-group">
            <label>Option D</label>
            <input type="text" name="optionD" required>
        </div>

        <div class="input-group">
            <label>Correct Answer</label>
            <select name="correctAnswer" required>
                <option value="">-- Select Correct Answer --</option>
                <option value="A">Option A</option>
                <option value="B">Option B</option>
                <option value="C">Option C</option>
                <option value="D">Option D</option>
            </select>
        </div>

        <div class="input-group">
            <label>Hint</label>
            <input type="text" name="hint">
        </div>

        <button type="submit" class="btn">Save Question</button>

    </form>

    <!-- Back Button -->
    <a href="${pageContext.request.contextPath}/admin/dashboard">
        <button class="btn back-btn">Back to Dashboard</button>
    </a>

</div>

</body>
</html>