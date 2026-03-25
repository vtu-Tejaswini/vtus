package com.fsad;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Autowired;

@RestController
public class EmployeeMvcController {
	@Autowired
	EmployeeService employeeService;
	
	@GetMapping("/mvc/employee")
	public String getEmployeeMvc() {
		Employee emp = employeeService.getEmployee();
		return "MVC Flow -> ID: "+emp.getId()+" Name: "+emp.getName();
	}
}
