package com.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultDto {

	private String studentEmail;
	private Long quizId;
	private int score;
	private int totalQuestions;

	// getters & setters
}