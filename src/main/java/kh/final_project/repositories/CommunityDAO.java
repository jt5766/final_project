package kh.final_project.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.CategoryType;
import kh.final_project.dto.BoardsDTO;

@Repository
public class CommunityDAO {
	@Autowired
	private SqlSessionTemplate db;

	public List<CategoryType> getSelectTag() {
		return db.selectList("Community.getBoardType");
	}

	public int insertBoard(BoardsDTO communityDTO) {
		return db.insert("Community.insertBoard", communityDTO);
	}
}
