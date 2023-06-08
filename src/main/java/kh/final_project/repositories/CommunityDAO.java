package kh.final_project.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.BoardsDTO;
import kh.final_project.dto.CategoryType;

@Repository
public class CommunityDAO {
	@Autowired
	private SqlSessionTemplate sst;

	public List<CategoryType> getSelectTag() {
		return sst.selectList("Community.getBoardType");
	}

	public int insertBoard(BoardsDTO boardsDTO) {
		return sst.insert("Community.insertBoard", boardsDTO);
	}

	public List<BoardsDTO> selectBoard(CategoryType categoryType) {
		return sst.selectList("Community.selectBoard", categoryType);
	}

	public BoardsDTO selectBoardView(BoardsDTO boardsDTO) {
		return sst.selectOne("Community.selectBoardView", boardsDTO);
	}

	public int updateBoard(BoardsDTO boardsDTO) {
		return sst.update("Community.updateBoard", boardsDTO);
	}

	public int deleteBoard(BoardsDTO boardsDTO) {
		return sst.delete("Community.deleteBoard", boardsDTO);
	}
}
