package kh.final_project.repositories;

import java.util.List;
import java.util.Map;

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
	
	public int accept(Long seq) {
		return db.update("Chat.update",seq);
	}
	
	public int refuse(Long seq) {
		return db.delete("Chat.delete",seq);
	}
	
	public List<ChatlistDTO> select(int loginID){
		return db.selectList("Chat.select",loginID);
	}
	
	public boolean checkUser(Map<String, Object> param) {
		return db.selectOne("Chat.check",param);
	}
	
}
