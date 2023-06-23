package kh.final_project.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.CategoryType;
import kh.final_project.repositories.TypeDAO;

@Service
public class HomeService {
	@Autowired
	private TypeDAO typeDAO;

	public Map<String, List<CategoryType>> init() {
		Map<String, List<CategoryType>> result = new HashMap<String, List<CategoryType>>();
		result.put("gallery", typeDAO.selectByCategoryType());
		result.put("community", typeDAO.selectByBoardType());
		return result;
	}

}
