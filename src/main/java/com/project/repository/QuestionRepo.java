package com.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.entity.Question;

@Repository
public interface QuestionRepo extends JpaRepository<Question, Long> {

	List<Question> findByQuiz_Id(Long quizId);
}