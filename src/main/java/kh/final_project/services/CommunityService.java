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

	private void setBoardNameByBoardType(BoardsDTO boardsDTO) {
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

	public List<CategoryType> getSelectTag() {
		List<CategoryType> list = communityDAO.getSelectTag();
		return list;
	}

	public int insertBoard(BoardsDTO boardsDTO) {
		return communityDAO.insertBoard(boardsDTO);
	}

	public List<BoardsDTO> selectBoard(CategoryType categoryType) {
		this.setNameByCode(categoryType);
		return communityDAO.selectBoard(categoryType);
	}

	public BoardsDTO selectBoardView(BoardsDTO boardsDTO) {
		this.setBoardNameByBoardType(boardsDTO);
		return communityDAO.selectBoardView(boardsDTO);
	}

	public int updateBoard(BoardsDTO boardsDTO) {
		this.setBoardNameByBoardType(boardsDTO);
		return communityDAO.updateBoard(boardsDTO);
	}

	public int deleteBoard(BoardsDTO boardsDTO) {
		this.setBoardNameByBoardType(boardsDTO);
		return communityDAO.deleteBoard(boardsDTO);
	}
}
