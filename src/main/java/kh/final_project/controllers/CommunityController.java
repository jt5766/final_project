package kh.final_project.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	private HttpSession session;

	@Autowired
	private CommunityService communityService;

	@RequestMapping("toHome")
	public String toHome() {
		session.setAttribute("loginID", 10000001);
		return "community/community_home";
	}

	@RequestMapping("toBoard")
	public String toBoard(CategoryType categoryType, Model model) {
		List<BoardsDTO> boardList = communityService.selectBoard(categoryType);
		model.addAttribute("categoryType", categoryType);
		model.addAttribute("boardList", boardList);
		return "community/board";
	}

	@RequestMapping("toWriteForm")
	public String toWriteForm(CategoryType categoryType, Model model) {
		List<CategoryType> selectTag = communityService.getSelectTag();
		model.addAttribute("boardCode", categoryType.getCode());
		model.addAttribute("selectTag", selectTag);
		return "community/writeForm";
	}

	@RequestMapping("insertBoard")
	public String insertBoard(BoardsDTO boardsDTO) {
		System.out.println(boardsDTO);
		boardsDTO.setWriter((Integer) session.getAttribute("loginID"));
		int result = communityService.insertBoard(boardsDTO);
		return "redirect:/community/toBoard?code=" + boardsDTO.getBoard_type();
	}

	@RequestMapping("toBoardView")
	public String toBoardView(BoardsDTO boardsDTO, Model model) {
		System.out.println(boardsDTO);
		BoardsDTO info = communityService.selectBoardView(boardsDTO);
		model.addAttribute("info", info);
		return "community/board_view";
	}
}
