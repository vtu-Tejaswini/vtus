package com.fsad;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;
import java.util.Map;

@RestController
public class AuthController {

    @PostMapping("/register")
    public ResponseEntity<String> register(@Valid @RequestBody User user) {
        return ResponseEntity.ok("User registered: " + user.getName());
    }

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody Map<String, String> credentials) {
        String username = credentials.get("username");
        String password = credentials.get("password");
        if("admin".equals(username) && "password".equals(password)) {
            return ResponseEntity.ok("JWT-TOKEN-DUMMY-12345");
        }
        return ResponseEntity.status(401).body("Invalid credentials!");
    }
}