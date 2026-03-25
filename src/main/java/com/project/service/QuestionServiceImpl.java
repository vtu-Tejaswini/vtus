package com.project.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dto.QuestionDto;
import com.project.entity.Question;
import com.project.repository.QuestionRepo;
import com.project.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionRepo questionRepo;

	@Override
	public Question saveQuestion(Question question) {
		return questionRepo.save(question);
	}

	@Override
	public List<QuestionDto> getQuestionsByQuiz(Long quizId) {
		return questionRepo.findByQuiz_Id(quizId).stream().map(q -> {
			QuestionDto dto = new QuestionDto();
			dto.setId(q.getId());
			dto.setQuestionText(q.getQuestionText());
			dto.setOptionA(q.getOptionA());
			dto.setOptionB(q.getOptionB());
			dto.setOptionC(q.getOptionC());
			dto.setOptionD(q.getOptionD());
			dto.setHint(q.getHint());
			return dto;
		}).collect(Collectors.toList());
	}

	@Override
	public int getQuestionCountByQuiz(Long quizId) {
		// Efficiency Tip: Using .size() on a list is fine for small apps,
		// but for large data, you might later want a countByQuizId method in your Repo.
		return questionRepo.findByQuiz_Id(quizId).size();
	}

	@Override
	public List<Question> getByQuizId(Long quizId) {
		// Fill the TODO: Call the repo method you already defined
		return questionRepo.findByQuiz_Id(quizId);
	}
}