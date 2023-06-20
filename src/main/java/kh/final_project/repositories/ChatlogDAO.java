package kh.final_project.repositories;

import java.util.List;
import java.util.Map;

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
	
	public int maxData(long seq) {
		return db.selectOne("Chatlog.maxdata",seq);
	}
	
	public List<ChatlogDTO> selectScrollList(Map<String, Object> scrollList){
		return db.selectList("Chatlog.selectscrolllist",scrollList);
	}
	
}
