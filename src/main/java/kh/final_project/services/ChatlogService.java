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
	
	private final Integer postPerPage = 20;
	
	public List<ChatlogDTO> selectLog(Long seq) {
		return dao.selectLog(seq);
	}
	
	public int maxScroll(Long seq) {
		int postPerPage = this.postPerPage;
		int max = dao.maxData(seq);
		int totalPage;
		if (max % postPerPage > 0) {
			totalPage = max / postPerPage + 1;
		} else {
			totalPage = max / postPerPage;
		}
		return totalPage;
	}
	
	public List<ChatlogDTO> selectChatLog(Long seq, int currentPage) {
//		스크롤마다 20개씩 가져올 코드
		int startPost = (currentPage * this.postPerPage) - (this.postPerPage - 1);
		int endPost = (currentPage * this.postPerPage);
		System.out.println(startPost);
		System.out.println(endPost);
		Map<String, Object> scrollList = new HashMap<>();
		scrollList.put("seq", seq);
		scrollList.put("startPost", startPost);
		scrollList.put("endPost", endPost);
//		Map에 동적 쿼리를 위한 테이블 이름 String, startPost와 endPost를 put하고 DAO로 전달하여 MAPPER의 매개변수로 사용
		return dao.selectScrollList(scrollList);
	}
	
	public int insertLog(ChatlogDTO dto,Integer loginID) {
		return dao.insertLog(dto);
	}
	
}
