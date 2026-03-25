package com.fsad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

@Service
public class StudentService {
	
	@Autowired
	StudentRepository studentRepository;
	
	public Student saveStudent(Student student) {
		return studentRepository.save(student);
	}
	
	public List<Student> getAllStudents(){
		return studentRepository.findAll();
	}
	
	public Student getStudentById(int id) {
		return studentRepository.findById(id).orElse(null);
	}
	
	public void deleteStudent(int id) {
		studentRepository.deleteById(id);
	}
	
	public Student updateStudent(int id, Student updatedStudent) {
		updatedStudent.setId(id);
		return studentRepository.save(updatedStudent);
	}
	public List<Student> getStudentsByDepartment(String department) {
	    return studentRepository.findByDepartment(department);
	}

	public List<Student> getStudentsByName(String name) {
	    return studentRepository.findByName(name);
	}
	public Page<Student> getPaginatedStudents(int page, int size, String sortBy) {
	    return studentRepository.findAll(PageRequest.of(page, size, Sort.by(sortBy)));
	}

}
