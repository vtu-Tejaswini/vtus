package com.project.service;

import java.util.List;

import com.project.entity.Question;
import com.project.entity.Quiz;
import com.project.dto.QuizDto;

public interface QuizService {

	Quiz saveQuiz(Quiz quiz);

	List<QuizDto> getAllQuizzes();

	Quiz getQuizById(Long id);

	List<Question> getByQuizId(Long quizId);

}