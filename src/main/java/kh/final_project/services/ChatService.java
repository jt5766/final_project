package kh.final_project.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.ChatlistDTO;
import kh.final_project.repositories.ChatDAO;

@Service
public class ChatService {

	@Autowired
	private ChatDAO dao;
	
	public int application(int mentor,int mentee) {
		return dao.application(new ChatlistDTO(null,mentor,mentee,null,null,null));
	}
	
	public int accept(Long seq) {
		return dao.accept(seq);
	}
	
	public int refuse(Long seq) {
		return dao.refuse(seq);
	}
	
	public List<ChatlistDTO> select(int loginID){
		return dao.select(loginID);
	}
	
	public boolean checkUser(Integer code,Long seq) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("code", code);
		param.put("seq", seq);
		return dao.checkUser(param);
	}
	
	public boolean doublecheck( int mentor, int mentee) {
		Map<String, Integer> param = new HashMap<>();
		param.put("mentor", mentor);
		param.put("mentee", mentee);
		return dao.doublecheck(param);
	}
	
}
