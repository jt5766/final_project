package kh.final_project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.repositories.AdminDAO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

}
