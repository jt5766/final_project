package kh.final_project.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.final_project.dto.BoardsDTO;
import kh.final_project.dto.BoardsReplyDTO;
import kh.final_project.dto.CategoryType;
import kh.final_project.dto.ComplaintBoardsDTO;
import kh.final_project.dto.SearchCriteria;
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
		List<CategoryType> search = communityService.getCommunitySearch();
		List<CategoryType> sort = communityService.getCommunitySort();
		model.addAttribute("search", search);
		model.addAttribute("sort", sort);
		if (categoryType.getCode() == 1005) { // 민원 게시판으로
			if ((Integer) session.getAttribute("memberType") == 9999) { // 관리자
				List<String> pageNavi = communityService.returnPageNavi(categoryType, currentPage);
				List<CategoryType> boardType = communityService.selectBoardType();
				List<ComplaintBoardsDTO> boardList = communityService.selectComplaintByPage(categoryType, currentPage);
				model.addAttribute("categoryType", categoryType);
				model.addAttribute("boardType", boardType);
				model.addAttribute("boardList", boardList);
				model.addAttribute("pageNavi", pageNavi);
				return "community/complaint_board";
			} else {
				List<String> pageNavi = communityService.returnPageNavi(categoryType, currentPage);
				List<CategoryType> boardType = communityService.selectBoardType();
				List<ComplaintBoardsDTO> boardList = communityService.selectComplaintByPage(categoryType, currentPage);
				model.addAttribute("categoryType", categoryType);
				model.addAttribute("boardType", boardType);
				model.addAttribute("boardList", boardList);
				model.addAttribute("pageNavi", pageNavi);
				return "community/complaint_board";
			}
		} else { // 그 외 게시판으로
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
		return "redirect:/community/toBoard?code=" + boardsDTO.getBoard_type() + "&currentPage=1";
	}

	@RequestMapping("insertComplaint")
	public String insertComplaint(ComplaintBoardsDTO complaintBoardsDTO) {
		communityService.insertComplaint(complaintBoardsDTO);
		return "redirect:/community/toBoard?code=" + complaintBoardsDTO.getBoard_type() + "&currentPage=1";
	}

	@RequestMapping("uploadFile")
	public void uploadFile(MultipartFile[] files, HttpServletResponse response) throws Exception {
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
		List<CategoryType> selectTag = communityService.getSelectTag();
		model.addAttribute("info", boardsDTO);
		model.addAttribute("selectTag", selectTag);
		return "community/update_form";
	}

	@RequestMapping("updateBoard")
	public String updateBoard(BoardsDTO boardsDTO) {
		communityService.updateBoard(boardsDTO);
		return "redirect:/community/toBoardView?seq=" + boardsDTO.getSeq() + "&board_type=" + boardsDTO.getBoard_type();
	}

	@RequestMapping("deleteBoard")
	public String deleteBoard(BoardsDTO boardsDTO) {
		communityService.deleteBoard(boardsDTO);
		return "redirect:/community/toBoard?code=" + boardsDTO.getBoard_type() + "&currentPage=1";
	}

	@RequestMapping("insertReply")
	public String insertReply(BoardsReplyDTO boardsReplyDTO) {
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

	@RequestMapping("insertProcess")
	public String insertProcess(ComplaintBoardsDTO complaintBoardsDTO) {
		communityService.insertProcess(complaintBoardsDTO);
		return "redirect:/community/toComplaintView?seq=" + complaintBoardsDTO.getSeq();
	}

	@RequestMapping("search")
	public String search(SearchCriteria searchCriteria, Model model) {
		List<BoardsDTO> boardList = communityService.search(searchCriteria);
		List<String> pageNavi = communityService.returnPageNavi(searchCriteria);
		List<CategoryType> boardType = communityService.selectBoardType();
		CategoryType categoryType = new CategoryType();
		categoryType.setCode(searchCriteria.getTypeCode());
		List<CategoryType> search = communityService.getCommunitySearch();
		List<CategoryType> sort = communityService.getCommunitySort();
		model.addAttribute("search", search);
		model.addAttribute("sort", sort);
		model.addAttribute("categoryType", categoryType);
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageNavi", pageNavi);
		return "community/board";
	}

	@RequestMapping("searchComplaint")
	public String searchComplaint(SearchCriteria searchCriteria, Model model) {
		List<ComplaintBoardsDTO> boardList = communityService.searchComplaint(searchCriteria);
		List<String> pageNavi = communityService.returnPageNavi(searchCriteria);
		List<CategoryType> boardType = communityService.selectBoardType();
		CategoryType categoryType = new CategoryType();
		categoryType.setCode(searchCriteria.getTypeCode());
		List<CategoryType> search = communityService.getCommunitySearch();
		List<CategoryType> sort = communityService.getCommunitySort();
		model.addAttribute("search", search);
		model.addAttribute("sort", sort);
		model.addAttribute("categoryType", categoryType);
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageNavi", pageNavi);
		return "community/complaint_board";
	}

	@ResponseBody
	@RequestMapping("myPage")
	public Map<String, Object> myPage() {
		int code = (int) session.getAttribute("code");
		List<BoardsDTO> myNotice = communityService.getMyNotice(code);
		List<BoardsDTO> myFree = communityService.getMyFree(code);
		List<BoardsDTO> myTip = communityService.getMyTip(code);
		List<BoardsDTO> myQuestion = communityService.getMyQuestion(code);
		List<ComplaintBoardsDTO> myComplaint = communityService.getMyComplaint(code);
		Map<String, Object> myBoards = new HashMap<>();
		myBoards.put("9999", "community");
		myBoards.put("1001", myNotice);
		myBoards.put("1002", myFree);
		myBoards.put("1003", myTip);
		myBoards.put("1004", myQuestion);
		myBoards.put("1005", myComplaint);
		return myBoards;
	}
}
