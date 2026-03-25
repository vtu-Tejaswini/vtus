package com.project.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Quiz {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String title;

	private String description;
}