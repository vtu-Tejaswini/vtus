package com.project.dto;

import lombok.Data;

@Data
public class QuizDto {
	private Long id;
	private String title;
	private String description; // Removed the "quizdto :" text
	private int questionCount;
}
