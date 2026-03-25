package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.modelmapper.ModelMapper;

import com.project.dto.StudentDto;
import com.project.entity.Student;
import com.project.repository.StudentRepo;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentRepo repo;

	@Autowired
	private ModelMapper modelMapper;

	@Override
	public StudentDto saveStudent(StudentDto studentDto) {

		Student student = modelMapper.map(studentDto, Student.class);
		Student saved = repo.save(student);

		return modelMapper.map(saved, StudentDto.class);
	}

	@Override
	public StudentDto getByEmail(String email) {

		Student student = repo.findByEmail(email);

		if (student == null)
			return null;

		return modelMapper.map(student, StudentDto.class);
	}

	@Override
	public boolean validate(String email, String password) {

		Student student = repo.findByEmail(email);

		return student != null && student.getPassword().equals(password);
	}
}