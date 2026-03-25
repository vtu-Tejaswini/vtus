package com.fsad;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "Student")
public class Student {
	@Id
	@Column(name="id")
	private int id;
	@Column(name="name")
	private String name;
	@Column(name="department")
	private String department;
	public Student() {}
	public Student(int id, String name, String department) {
		this.id = id;
		this.name = name;
		this.department = department;
	}
	public int getId() {return id;}
	public String getName() {return name;}
	public String getDepartment() {return department;}
	
	public void setId(int id) {this.id = id;}
	public void setName(String name) {this.name = name;}
	public void setDepartment(String department) {this.department = department;}
	

}
