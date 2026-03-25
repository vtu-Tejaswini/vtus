package com.project.entity;

import jakarta.persistence.*;

@Entity
public class Result {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String studentEmail;
	private Long quizId;
	private int score;
	private int totalQuestions;

	// getters & setters
}