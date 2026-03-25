package com.project.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.entity.AdminEntity;

public interface AdminRepo extends JpaRepository<AdminEntity, String> {

	Optional<AdminEntity> findByEmail(String email);
}