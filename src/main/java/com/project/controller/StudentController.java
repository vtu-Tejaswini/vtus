package com.project.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.project.dto.*;
import com.project.entity.Question;
import com.project.service.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private QuizService quizService;

	@Autowired
	private QuestionService questionService;

	@Autowired
	private ResultService resultService;

	// ================= LOGIN =================
	@GetMapping("/login")
	public String loginPage() {
		return "StudentLogin";
	}

	@PostMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {

		if (studentService.validate(email, password)) {
			session.setAttribute("student", email);
			return "redirect:/student/dashboard";
		}

		model.addAttribute("error", "Invalid credentials");
		return "StudentLogin";
	}

	// ================= SIGNUP =================
	@GetMapping("/signup")
	public String signupPage(Model model) {
		model.addAttribute("student", new StudentDto());
		return "StudentSignup";
	}

	@PostMapping("/signup")
	public String signup(@ModelAttribute StudentDto studentDto, Model model) {

		if (studentService.getByEmail(studentDto.getEmail()) != null) {
			model.addAttribute("error", "Email exists");
			return "StudentSignup";
		}

		studentService.saveStudent(studentDto);
		return "redirect:/student/login";
	}

	// ================= DASHBOARD =================
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {

		if (session.getAttribute("student") == null) {
			return "redirect:/student/login";
		}

		model.addAttribute("quizList", quizService.getAllQuizzes());
		return "StudentDashboard";
	}

	// ================= START QUIZ =================
	@GetMapping("/startQuiz")
	public String startQuiz(@RequestParam Long quizId, Model model) {

		List<Question> questions = questionService.getByQuizId(quizId);

		model.addAttribute("questions", questions);
		model.addAttribute("quizId", quizId);

		return "AttemptQuiz";
	}

	// ================= SUBMIT QUIZ =================
	@PostMapping("/submitQuiz")
	public String submitQuiz(@RequestParam Long quizId, @RequestParam Map<String, String> answers, HttpSession session,
			Model model) {

		List<Question> questions = questionService.getByQuizId(quizId);

		int score = 0;

		for (Question q : questions) {
			String selected = answers.get("q_" + q.getId());

			if (selected != null && selected.equals(q.getCorrectAnswer())) {
				score++;
			}
		}

		// 🔥 DTO usage
		ResultDto dto = new ResultDto();
		dto.setQuizId(quizId);
		dto.setStudentEmail((String) session.getAttribute("student"));
		dto.setScore(score);
		dto.setTotalQuestions(questions.size());

		resultService.save(dto);

		model.addAttribute("score", score);
		model.addAttribute("total", questions.size());

		return "ResultPage";
	}
}