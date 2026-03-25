package com.fsad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	@GetMapping("/employee")
	public String getEmployee() {
		Employee emp = employeeService.getEmployee();
		return "ID: "+ emp.getId()+" Name: "+emp.getName();
}

}
