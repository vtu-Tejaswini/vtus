package com.project.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Question {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String questionText;

	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;

	private String correctAnswer; // A / B / C / D

	private String hint;

	@ManyToOne
	@JoinColumn(name = "quiz_id")
	private Quiz quiz;
}