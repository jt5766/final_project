package kh.final_project.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.ChatlogDTO;

@Repository
public class ChatlogDAO {

	@Autowired
	private SqlSessionTemplate db;
	
	public ChatlogDTO selectLog(Long seq) {
		return db.selectOne("Chatlog.select",seq);
	}
}
