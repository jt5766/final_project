package kh.final_project.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.ChatlogDTO;

@Repository
public class ChatlogDAO {

	@Autowired
	private SqlSessionTemplate db;
	
	public List<ChatlogDTO> selectLog(Long seq) {
		return db.selectList("Chatlog.select",seq);
	}
	
	public int insertLog(ChatlogDTO dto) {
		return db.insert("Chatlog.insert",dto);
	}
	
}
