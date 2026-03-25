package com.fsad;

import jakarta.validation.constraints.*;

public class User {

    @NotBlank(message = "Name must not be empty")
    private String name;

    @Email(message = "Must be a valid email")
    private String email;

    @Min(value = 18, message = "Age must be at least 18")
    private int age;

    public String getName() { return name; }
    public String getEmail() { return email; }
    public int getAge() { return age; }

    public void setName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }
    public void setAge(int age) { this.age = age; }
}