package com.project.service;

import java.util.List;
import com.project.entity.Question;
import com.project.dto.QuestionDto;

public interface QuestionService {

	Question saveQuestion(Question question);

	List<QuestionDto> getQuestionsByQuiz(Long quizId);

	int getQuestionCountByQuiz(Long quizId);

	List<Question> getByQuizId(Long quizId);

}