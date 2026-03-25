package com.project.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.entity.AdminEntity;
import com.project.entity.Question;
import com.project.entity.Quiz;
import com.project.service.AdminService;
import com.project.service.QuestionService;
import com.project.service.QuizService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private QuizService quizService;

	@Autowired
	private QuestionService questionService;

	// =========================
	// 🔹 LOGIN PAGE
	// =========================
	@GetMapping("/login")
	public String showLoginPage() {
		return "LoginPage";
	}

	// =========================
	// 🔹 HANDLE LOGIN
	// =========================
	@PostMapping("/login")
	public String loginAdmin(@RequestParam String email, @RequestParam String password, HttpSession session,
			Model model) {

		if (adminService.validateAdmin(email, password)) {
			session.setAttribute("loggedInAdmin", email);
			return "redirect:/admin/dashboard";
		} else {
			model.addAttribute("errorMessage", "Invalid credentials");
			return "LoginPage";
		}
	}

	// =========================
	// 🔹 SIGNUP PAGE
	// =========================
	@GetMapping("/signup")
	public String showSignupPage(Model model) {
		model.addAttribute("admin", new AdminEntity());
		return "SignupPage";
	}

	// =========================
	// 🔹 HANDLE SIGNUP
	// =========================
	@PostMapping("/signup")
	public String registerAdmin(@ModelAttribute AdminEntity admin, Model model) {

		if (adminService.getAdminByEmail(admin.getEmail()) != null) {
			model.addAttribute("errorMessage", "Email already exists");
			return "SignupPage";
		}

		adminService.saveAdmin(admin);
		return "redirect:/admin/login";
	}

	// =========================
	// 🔹 DASHBOARD (FIXED)
	// =========================
	@GetMapping("/dashboard")
	public String adminDashboard(HttpSession session, Model model) {

		if (session.getAttribute("loggedInAdmin") == null) {
			return "redirect:/admin/login";
		}

		// 🔥 Send quiz list
		model.addAttribute("quizList", quizService.getAllQuizzes());

		// 🔥 Stats (basic for now)
		model.addAttribute("totalQuizzes", quizService.getAllQuizzes().size());
		model.addAttribute("totalStudents", 0);
		model.addAttribute("totalAttempts", 0);
		model.addAttribute("avgScore", "0%");

		return "AdminDashboard";
	}

	// =========================
	// 🔹 CREATE QUIZ PAGE (FIXED URL)
	// =========================
	@GetMapping("/createQuiz")
	public String createQuizPage() {
		return "createQuiz";
	}

	// =========================
	// 🔹 SAVE QUIZ
	// =========================
	@PostMapping("/saveQuiz")
	public String saveQuiz(@RequestParam String title, @RequestParam String description, RedirectAttributes ra) {

		Quiz quiz = new Quiz();
		quiz.setTitle(title);
		quiz.setDescription(description);

		quizService.saveQuiz(quiz);

		ra.addFlashAttribute("success", "Quiz Created Successfully!");

		return "redirect:/admin/createQuiz";
	}

	// =========================
	// 🔹 ADD QUESTION PAGE
	// =========================
	@GetMapping("/addQuestions")
	public String addQuestionPage(@RequestParam Long quizId, Model model) {
		model.addAttribute("quizId", quizId);
		return "addQuestions";
	}

	// =========================
	// 🔹 SAVE QUESTION
	// =========================
	@PostMapping("/saveQuestion")
	public String saveQuestion(@RequestParam Long quizId, @RequestParam String questionText,
			@RequestParam String optionA, @RequestParam String optionB, @RequestParam String optionC,
			@RequestParam String optionD, @RequestParam String correctAnswer, @RequestParam String hint) {

		Quiz quiz = quizService.getQuizById(quizId);

		Question q = new Question();
		q.setQuestionText(questionText);
		q.setOptionA(optionA);
		q.setOptionB(optionB);
		q.setOptionC(optionC);
		q.setOptionD(optionD);
		q.setCorrectAnswer(correctAnswer);
		q.setHint(hint);
		q.setQuiz(quiz);

		questionService.saveQuestion(q);

		return "redirect:/admin/addQuestions?quizId=" + quizId;
	}

	// =========================
	// 🔹 LOGOUT
	// =========================
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/login";
	}
}