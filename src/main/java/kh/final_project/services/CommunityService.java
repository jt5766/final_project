package kh.final_project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.CategoryType;
import kh.final_project.dto.BoardsDTO;
import kh.final_project.repositories.CommunityDAO;

@Service
public class CommunityService {

	@Autowired
	private CommunityDAO communityDAO;

	public List<CategoryType> getSelectTag() {
		List<CategoryType> list = communityDAO.getSelectTag();
		return list;
	}

	public int insertBoard(BoardsDTO communityDTO) {
		return communityDAO.insertBoard(communityDTO);
	}
}
