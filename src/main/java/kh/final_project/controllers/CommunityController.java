package kh.final_project.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.final_project.dto.BoardsDTO;
import kh.final_project.dto.BoardsReplyDTO;
import kh.final_project.dto.CategoryType;
import kh.final_project.services.CommunityService;

@Controller
@RequestMapping("/community/")
public class CommunityController {
	@Autowired
	private HttpSession session;

	@Autowired
	private CommunityService communityService;

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception exception) {
		exception.printStackTrace();
		return "redirect:/error";
	}

	@RequestMapping("toHome")
	public String toHome() {
		session.setAttribute("loginID", 10000001);
		return "community/community_home";
	}

	@RequestMapping("toBoard")
	public String toBoard(CategoryType categoryType, Model model) {
		List<BoardsDTO> boardList = communityService.selectBoard(categoryType);
		System.out.println("name : " + categoryType.getName());
		model.addAttribute("categoryType", categoryType);
		model.addAttribute("boardList", boardList);
		return "community/board";
	}

	@RequestMapping("toWriteForm")
	public String toWriteForm(CategoryType categoryType, Model model) {
		List<CategoryType> selectTag = communityService.getSelectTag();
		model.addAttribute("boardCode", categoryType.getCode());
		model.addAttribute("selectTag", selectTag);
		return "community/write_form";
	}

	@RequestMapping("insertBoard")
	public String insertBoard(BoardsDTO boardsDTO) {
		System.out.println(boardsDTO);
		session.setAttribute("loginID", 10000001);
		boardsDTO.setWriter((Integer) session.getAttribute("loginID"));
		int result = communityService.insertBoard(boardsDTO);
		return "redirect:/community/toBoard?code=" + boardsDTO.getBoard_type();
	}

	@RequestMapping("toBoardView")
	public String toBoardView(BoardsDTO boardsDTO, Model model) {
		BoardsDTO info = communityService.selectBoardView(boardsDTO);
		System.out.println("toBoardView info : " + info);
		List<BoardsReplyDTO> reply = communityService.selectReply(boardsDTO);
		model.addAttribute("info", info);
		model.addAttribute("reply", reply);
		System.out.println(reply);
		return "community/board_view";
	}

	@RequestMapping("toUpdate")
	public String toUpdate(BoardsDTO boardsDTO, Model model) {
		System.out.println("toUpdate : " + boardsDTO);
		List<CategoryType> selectTag = communityService.getSelectTag();
		model.addAttribute("info", boardsDTO);
		model.addAttribute("selectTag", selectTag);
		return "community/update_form";
	}

	@RequestMapping("updateBoard")
	public String updateBoard(BoardsDTO boardsDTO) {
		System.out.println("updateBoard : " + boardsDTO);
		communityService.updateBoard(boardsDTO);
		return "redirect:/community/toBoardView?seq=" + boardsDTO.getSeq() + "&board_type=" + boardsDTO.getBoard_type();
	}

	@RequestMapping("deleteBoard")
	public String deleteBoard(BoardsDTO boardsDTO) {
		System.out.println("deleteBoard : " + boardsDTO);
		communityService.deleteBoard(boardsDTO);
		return "redirect:/community/toBoard?code=" + boardsDTO.getBoard_type();
	}

	@RequestMapping("insertReply")
	public String insertReply(BoardsReplyDTO boardsReplyDTO) {
		System.out.println("reply : " + boardsReplyDTO);
		communityService.insertReply(boardsReplyDTO);
		return "redirect:/community/toBoardView?seq=" + boardsReplyDTO.getParent_board() + "&board_type="
				+ boardsReplyDTO.getBoard_type();
	}

	@RequestMapping("deleteReply")
	public String deleteReply(BoardsReplyDTO boardsReplyDTO) {
		communityService.deleteReply(boardsReplyDTO);
		return "redirect:/community/toBoardView?seq=" + boardsReplyDTO.getParent_board() + "&board_type="
				+ boardsReplyDTO.getBoard_type();
	}

	@RequestMapping("updateReply")
	public String updateReply(BoardsReplyDTO boardsReplyDTO) {
		communityService.updateReply(boardsReplyDTO);
		return "redirect:/community/toBoardView?seq=" + boardsReplyDTO.getParent_board() + "&board_type="
				+ boardsReplyDTO.getBoard_type();
	}
}
