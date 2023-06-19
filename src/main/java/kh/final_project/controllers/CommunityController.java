package kh.final_project.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.final_project.dto.BoardsDTO;
import kh.final_project.dto.BoardsReplyDTO;
import kh.final_project.dto.CategoryType;
import kh.final_project.dto.ComplaintBoardsDTO;
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
		return "community/community_home";
	}

	@RequestMapping("toBoard")
	public String toBoard(CategoryType categoryType, Model model, int currentPage) {
		if (categoryType.getCode() == 1005) {
			System.out.println("COMPLAINT");
			if ((int) session.getAttribute("code") == 9999) {
				List<String> pageNavi = communityService.returnPageNavi(categoryType, currentPage);
				List<CategoryType> boardType = communityService.selectBoardType();
				List<ComplaintBoardsDTO> boardList = communityService.selectComplaintByPage(categoryType, currentPage);
				model.addAttribute("categoryType", categoryType);
				model.addAttribute("boardType", boardType);
				model.addAttribute("boardList", boardList);
				model.addAttribute("pageNavi", pageNavi);
				return "community/complaint_board";
			} else {
				int writer = (int) session.getAttribute("code");
				List<String> pageNavi = communityService.returnPageNavi(categoryType, currentPage);
				List<CategoryType> boardType = communityService.selectBoardType();
				List<ComplaintBoardsDTO> boardList = communityService.selectComplaintByPage(categoryType, currentPage);
				model.addAttribute("categoryType", categoryType);
				model.addAttribute("boardType", boardType);
				model.addAttribute("boardList", boardList);
				model.addAttribute("pageNavi", pageNavi);
				return "community/complaint_board";
			}
		} else {
			List<String> pageNavi = communityService.returnPageNavi(categoryType, currentPage);
			List<BoardsDTO> boardList = communityService.selectBoardByPage(categoryType, currentPage);
			List<CategoryType> boardType = communityService.selectBoardType();
			model.addAttribute("categoryType", categoryType);
			model.addAttribute("boardType", boardType);
			model.addAttribute("boardList", boardList);
			model.addAttribute("pageNavi", pageNavi);
			return "community/board";
		}
	}

	@RequestMapping("toWriteForm")
	public String toWriteForm(CategoryType categoryType, Model model) {
		List<CategoryType> selectTag = communityService.getSelectTag();
		model.addAttribute("boardCode", categoryType.getCode());
		model.addAttribute("selectTag", selectTag);
		if (categoryType.getCode() == 1005) {
			return "community/complaint_writeForm";
		} else {
			return "community/write_form";
		}
	}

	@RequestMapping("insertBoard")
	public String insertBoard(BoardsDTO boardsDTO) {
		communityService.insertBoard(boardsDTO);
		return "redirect:/community/toBoardView?code=" + boardsDTO.getBoard_type() + "&currentPage=1";
	}

	@RequestMapping("insertComplaint")
	public String insertComplaint(ComplaintBoardsDTO complaintBoardsDTO) {
		System.out.println(complaintBoardsDTO);
		communityService.insertComplaint(complaintBoardsDTO);
		return "redirect:/community/toBoard?code=" + complaintBoardsDTO.getBoard_type() + "&currentPage=1";
	}

	@RequestMapping("uploadFile")
	public void uploadFile(MultipartFile[] files, HttpServletResponse response) throws Exception {
		System.out.println("uploadFile");
		System.out.println(files);
		communityService.uploadFile(files, session, response);
	}

	@RequestMapping("toBoardView")
	public String toBoardView(BoardsDTO boardsDTO, Model model) {
		BoardsDTO info = communityService.selectBoardView(boardsDTO);
		List<BoardsReplyDTO> reply = communityService.selectReply(boardsDTO);
		List<BoardsReplyDTO> reReply = communityService.selectReReply(boardsDTO);
		model.addAttribute("info", info);
		model.addAttribute("reply", reply);
		model.addAttribute("reReply", reReply);
		return "community/board_view";
	}

	@RequestMapping("toComplaintView")
	public String toComplaintView(ComplaintBoardsDTO complaintBoardsDTO, Model model) {
		ComplaintBoardsDTO info = communityService.selectComplaintView(complaintBoardsDTO);
		model.addAttribute("info", info);
		return "community/complaint_board_view";
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
		return "redirect:/community/toBoard?code=" + boardsDTO.getBoard_type() + "&currentPage=1";
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

	@RequestMapping("")
	public String insertProcess(ComplaintBoardsDTO complaintBoardsDTO) {
		communityService.insertProcess(complaintBoardsDTO);
		return "redirect:/community/toBoardView?seq=" + complaintBoardsDTO.getSeq() + "&board_type=1005";
	}
}
