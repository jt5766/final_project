package kh.final_project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.final_project.dto.BoardsDTO;
import kh.final_project.dto.CategoryType;
import kh.final_project.services.CommunityService;

@Controller
@RequestMapping("/community/")
public class CommunityController {
	@Autowired
	private CommunityService communityService;

	@RequestMapping("toNotice")
	public String toNotification() {
		return "community/notice";
	}

	@RequestMapping("toWriteForm")
	public String toWriteForm(CategoryType boardType, Model model) {
		List<CategoryType> selectTag = communityService.getSelectTag();
		model.addAttribute("boardCode", boardType.getCode());
		model.addAttribute("selectTag", selectTag);
		return "community/writeForm";
	}

	@RequestMapping("insertBoard")
	public String insertBoard(BoardsDTO communityDTO) {
		int result = communityService.insertBoard(communityDTO);
		return "community/toNotice";
	}
}
