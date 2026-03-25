package com.project.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dto.QuizDto;
import com.project.entity.Question;
import com.project.entity.Quiz;
import com.project.repository.QuestionRepo;
import com.project.repository.QuizRepo;
import com.project.service.QuizService;

@Service
public class QuizServiceImpl implements QuizService {

	@Autowired
	private QuizRepo quizRepo;

	@Autowired
	private QuestionRepo questionRepo;

	@Override
	public Quiz saveQuiz(Quiz quiz) {
		return quizRepo.save(quiz);
	}

	@Override
	public List<QuizDto> getAllQuizzes() {

		List<Quiz> quizzes = quizRepo.findAll();

		return quizzes.stream().map(q -> {
			QuizDto dto = new QuizDto();
			dto.setId(q.getId());
			dto.setTitle(q.getTitle());
			dto.setDescription(q.getDescription());

			// temporary (we'll update when questions module is ready)
			dto.setQuestionCount(0);

			return dto;
		}).collect(Collectors.toList());
	}

	@Override
	public Quiz getQuizById(Long id) {
		return quizRepo.findById(id).orElse(null);
	}

	@Override
	public List<Question> getByQuizId(Long quizId) {
		// Use the questionRepo which already has findByQuiz_Id
		return questionRepo.findByQuiz_Id(quizId);
	}
}