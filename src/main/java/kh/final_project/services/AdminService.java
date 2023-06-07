package kh.final_project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.CategoryType;
import kh.final_project.repositories.AdminDAO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

	public void selectGenreType() {
		CategoryType cy = new CategoryType();
		cy.setCode(1002);
		adminDAO.selectGenreType(cy);
	}

}
