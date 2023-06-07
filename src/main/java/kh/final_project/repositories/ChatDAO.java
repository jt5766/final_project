package kh.final_project.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.ChatlistDTO;

@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate db;
	
	public int application(ChatlistDTO dto) {
		return db.insert("Chat.insert",dto);
	}
}
