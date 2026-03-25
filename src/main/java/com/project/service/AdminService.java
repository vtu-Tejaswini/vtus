package com.project.service;

import com.project.entity.AdminEntity;

public interface AdminService {

	AdminEntity saveAdmin(AdminEntity admin);

	boolean validateAdmin(String email, String password);

	AdminEntity getAdminByEmail(String email);
}