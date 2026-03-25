package com.project.service;

import com.project.dto.StudentDto;

public interface StudentService {

	StudentDto saveStudent(StudentDto studentDto);

	StudentDto getByEmail(String email);

	boolean validate(String email, String password);
}