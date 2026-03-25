package com.fsad;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

@RestController
@RequestMapping("/students")
public class StudentController {

    @Autowired
    StudentService studentService;
    
    @GetMapping("/paginated")
    public Page<Student> getPaginatedStudents(
        @RequestParam int page,
        @RequestParam int size,
        @RequestParam String sortBy) {
        return studentService.getPaginatedStudents(page, size, sortBy);
    }

    @PostMapping
    public Student addStudent(@RequestBody Student student) {
        return studentService.saveStudent(student);
    }

    @GetMapping
    public List<Student> getAllStudents() {
        return studentService.getAllStudents();
    }

    @GetMapping("/{id}")
    public Student getStudentById(@PathVariable int id) {
        return studentService.getStudentById(id);
    }

    @DeleteMapping("/{id}")
    public String deleteStudent(@PathVariable int id) {
        studentService.deleteStudent(id);
        return "Student deleted successfully!";
    }

    @PutMapping("/{id}")
    public Student updateStudent(@PathVariable int id, @RequestBody Student student) {
        return studentService.updateStudent(id, student);
    }
    
    @GetMapping("/department/{department}")
    public List<Student> getByDepartment(@PathVariable String department) {
        return studentService.getStudentsByDepartment(department);
    }

    @GetMapping("/name/{name}")
    public List<Student> getByName(@PathVariable String name) {
        return studentService.getStudentsByName(name);
    }
    
    
}