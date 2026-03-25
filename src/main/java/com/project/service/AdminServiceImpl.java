package com.project.service;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.entity.AdminEntity;
import com.project.repository.AdminRepo;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepo adminRepo;

	@Override
	public AdminEntity saveAdmin(AdminEntity admin) {
		admin.setId(UUID.randomUUID().toString());
		return adminRepo.save(admin);
	}

	@Override
	public boolean validateAdmin(String email, String password) {
		Optional<AdminEntity> adminOpt = adminRepo.findByEmail(email);
		return adminOpt.isPresent() && adminOpt.get().getPassword().equals(password);
	}

	@Override
	public AdminEntity getAdminByEmail(String email) {
		return adminRepo.findByEmail(email).orElse(null);
	}
}