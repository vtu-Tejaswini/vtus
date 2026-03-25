package com.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.entity.Question;
import com.project.entity.Quiz;

@Repository
public interface QuizRepo extends JpaRepository<Quiz, Long> {

}