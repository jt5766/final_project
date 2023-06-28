package kh.final_project.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.BoardsDTO;
import kh.final_project.dto.CategoryType;
import kh.final_project.dto.ChatlogDTO;
import kh.final_project.repositories.ChatlogDAO;

@Service
public class ChatlogService {
	
	@Autowired
	private ChatlogDAO dao;
	
	private int startPost;
	
	private final Integer postPerPage = 30;
	
	public List<ChatlogDTO> selectLog(Long seq) {
		return dao.selectLog(seq);
	}
	
	public int maxData(Long seq) {
		startPost = dao.maxData(seq);
		return startPost;
	}
	
	public List<ChatlogDTO> selectChatLog(Long seq) {
//		스크롤마다 30개씩 가져올 코드
		if(startPost < 0) {
			startPost = 0;
		}
		int endPost = startPost-postPerPage+1;
		if(endPost<0) {
			endPost = 0;
		}
		System.out.println("시작포인트"+startPost);
		System.out.println("끝포인트"+endPost);
		System.out.println("chatroom"+seq);
		Map<String, Object> scrollList = new HashMap<>();
		scrollList.put("seq", seq);
		scrollList.put("startPost", startPost);
		scrollList.put("endPost", endPost);
		startPost -= postPerPage;
//		Map에 동적 쿼리를 위한 테이블 이름 String, startPost와 endPost를 put하고 DAO로 전달하여 MAPPER의 매개변수로 사용
		return dao.selectScrollList(scrollList);
	}
	
	public int insertLog(ChatlogDTO dto,Integer loginID) {
		return dao.insertLog(dto);
	}
	
}
