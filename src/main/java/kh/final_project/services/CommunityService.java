package kh.final_project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.BoardsDTO;
import kh.final_project.dto.CategoryType;
import kh.final_project.repositories.CommunityDAO;

@Service
public class CommunityService {

	@Autowired
	private CommunityDAO communityDAO;

	public List<CategoryType> getSelectTag() {
		List<CategoryType> list = communityDAO.getSelectTag();
		return list;
	}

	public int insertBoard(BoardsDTO boardsDTO) {
		return communityDAO.insertBoard(boardsDTO);
	}

	private void setNameByCode(CategoryType categoryType) {
		if (categoryType.getCode() == 1001) {
			categoryType.setName("NOTICE");
		} else if (categoryType.getCode() == 1002) {
			categoryType.setName("FREE");
		} else if (categoryType.getCode() == 1003) {
			categoryType.setName("TIP");
		} else if (categoryType.getCode() == 1004) {
			categoryType.setName("QUESTION");
		} else if (categoryType.getCode() == 1005) {
			categoryType.setName("COMPLAINT");
		}
	}

	private void setBoardNameByCode(BoardsDTO boardsDTO) {
		if (boardsDTO.getBoard_type() == 1001) {
			boardsDTO.setBoard_name("NOTICE");
		} else if (boardsDTO.getBoard_type() == 1002) {
			boardsDTO.setBoard_name("FREE");
		} else if (boardsDTO.getBoard_type() == 1003) {
			boardsDTO.setBoard_name("TIP");
		} else if (boardsDTO.getBoard_type() == 1004) {
			boardsDTO.setBoard_name("QUESTION");
		} else if (boardsDTO.getBoard_type() == 1005) {
			boardsDTO.setBoard_name("COMPLAINT");
		}
	}

	public List<BoardsDTO> selectBoard(CategoryType categoryType) {
		this.setNameByCode(categoryType);
		System.out.println(categoryType.getName());
		return communityDAO.selectBoard(categoryType);
	}

	public BoardsDTO selectBoardView(BoardsDTO boardsDTO) {
		this.setBoardNameByCode(boardsDTO);
		return communityDAO.selectBoardView(boardsDTO);
	}
}
