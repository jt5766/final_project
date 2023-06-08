package kh.final_project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.CategoryType;
import kh.final_project.repositories.AdminDAO;
import kh.final_project.repositories.TypeDAO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private TypeDAO typeDAO;

	public void selectGenreType() {
		CategoryType cy = new CategoryType();
		cy.setCode(1002);
//		List<CategoryType> list = adminDAO.selectGenreType(cy);
//		for (CategoryType item : list) {
//			System.out.println(item);
//		}
	}

	public List<CategoryType> selectCategory(String tableName) {
		List<CategoryType> result = null;

		if (tableName.equals("EMAIL_TYPE")) {
			result = typeDAO.selectByEmailType();
		} else if (tableName.equals("GENRE_TYPE")) {
			result = typeDAO.selectByGenreType();
		} else if (tableName.equals("GALLERY_CARDS_SORT")) {
			result = typeDAO.selectByGallery_Cards_Sort();
		} else if (tableName.equals("GALLERY_CARDS_SEARCH")) {
			result = typeDAO.selectByGallery_Cards_Search();
		} else if (tableName.equals("GALLERY_CONTENTS_SORT")) {
			result = typeDAO.selectByGallery_Contents_Sort();
		} else if (tableName.equals("COMMUNITY_SORT")) {
			result = typeDAO.selectByCommunity_Sort();
		} else if (tableName.equals("COMMUNITY_SEARCH")) {
			result = typeDAO.selectByCommunity_Search();
		}

		return result;
	}

}
