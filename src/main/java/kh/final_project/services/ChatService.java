package kh.final_project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.ChatlistDTO;
import kh.final_project.repositories.ChatDAO;

@Service
public class ChatService {

	@Autowired
	private ChatDAO dao;
	
	public int application(int mentor,int mentee) {
		return dao.application(new ChatlistDTO(null,mentor,mentee,null));
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
	
}
