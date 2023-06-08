package kh.final_project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.ChatlogDTO;
import kh.final_project.repositories.ChatlogDAO;

@Service
public class ChatlogService {
	
	@Autowired
	private ChatlogDAO dao;
	
	public List<ChatlogDTO> selectLog(Long seq) {
		return dao.selectLog(seq);
	}
	
	public int insertLog(ChatlogDTO dto,Integer loginID) {
		return dao.insertLog(dto);
	}
	
}
