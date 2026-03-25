package com.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.entity.Result;

@Repository
public interface ResultRepo extends JpaRepository<Result, Long> {
}