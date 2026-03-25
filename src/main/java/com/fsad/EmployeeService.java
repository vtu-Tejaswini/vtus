package com.fsad;
import org.springframework.stereotype.Component;
@Component
public class EmployeeService {
	public Employee getEmployee() {
		return new Employee(1,"John Doe");
	}
}
