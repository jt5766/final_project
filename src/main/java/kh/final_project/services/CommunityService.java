package kh.final_project.services;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.final_project.dto.BoardsDTO;
import kh.final_project.dto.BoardsReplyDTO;
import kh.final_project.dto.CategoryType;
import kh.final_project.repositories.CommunityDAO;

@Service
public class CommunityService {

	private int postPerPage = 30; // 한 페이지당 보여줄 게시글 수
	private int naviPerPage = 10; // 한 페이지당 보여줄 최대 네비 수

	@Autowired
	private CommunityDAO communityDAO;

	private void setNameByCode(CategoryType categoryType) {
		if (categoryType.getCode() == 1001) {
			categoryType.setName("NOTICE");
		} else if (categoryType.getCode() == 1002) {
			categoryType.setName("FREE");
		} else if (categoryType.getCode() == 1003) {
			categoryType.setName("TIP");
		} else if (categoryType.getCode() == 1004) {
			categoryType.setName("QUESTION");
		} else if (categoryType.getCode() == 1005) {
			categoryType.setName("COMPLAINT");
		}
	}

	private void setBoardNameByBoardType(BoardsDTO boardsDTO) {
		int board_type = boardsDTO.getBoard_type();
		if (board_type == 1001) {
			boardsDTO.setBoard_name("NOTICE");
		} else if (board_type == 1002) {
			boardsDTO.setBoard_name("FREE");
		} else if (board_type == 1003) {
			boardsDTO.setBoard_name("TIP");
		} else if (board_type == 1004) {
			boardsDTO.setBoard_name("QUESTION");
		} else if (board_type == 1005) {
			boardsDTO.setBoard_name("COMPLAINT");
		}
	}

	private void setBoardNameByBoardType(BoardsReplyDTO boardsReplyDTO) {
		int board_type = boardsReplyDTO.getBoard_type();
		if (board_type == 1001) {
			boardsReplyDTO.setBoard_name("NOTICE");
		} else if (board_type == 1002) {
			boardsReplyDTO.setBoard_name("FREE");
		} else if (board_type == 1003) {
			boardsReplyDTO.setBoard_name("TIP");
		} else if (board_type == 1004) {
			boardsReplyDTO.setBoard_name("QUESTION");
		} else if (board_type == 1005) {
			boardsReplyDTO.setBoard_name("COMPLAINT");
		}
	}

	public List<CategoryType> getSelectTag() {
		return communityDAO.getSelectTag();
	}

	public List<String> getPageNavi(String tableName, int currentPage) {
		int postPerPage = this.postPerPage;
		int naviPerPage = this.naviPerPage;
		int max = communityDAO.getMax(tableName);
		System.out.println("max : " + max);
		int totalPage;
		if (max % postPerPage > 0) {
			totalPage = max / postPerPage + 1;
		} else {
			totalPage = max / postPerPage;
		}
		int startNavi = (currentPage - 1) / naviPerPage * naviPerPage + 1;
		int endNavi = startNavi + (naviPerPage - 1);
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		if (endNavi > totalPage) {
			endNavi = totalPage;
		}
		System.out.println("totalPage : " + totalPage);
		System.out.println("endNavi : " + endNavi);
		boolean needPrev = false;
		if (currentPage > naviPerPage) {
			needPrev = true;
		}
		boolean needNext = false;
		if (endNavi < totalPage) {
			needNext = true;
		}
		List<String> pageNavi = new ArrayList<>();
		if (needPrev) {
			pageNavi.add("<");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi.add(String.valueOf(i));
		}
		if (needNext) {
			pageNavi.add(">");
		}
		return pageNavi;
	}

	public List<String> returnPageNavi(CategoryType categoryType, int currentPage) {
		this.setNameByCode(categoryType);
		return this.getPageNavi(categoryType.getName(), currentPage);
	}

	public int insertBoard(BoardsDTO boardsDTO) {
		return communityDAO.insertBoard(boardsDTO);
	}

	public void uploadFile(MultipartFile[] files, HttpSession session, HttpServletResponse response) throws Exception {
		String targetPath = session.getServletContext().getRealPath("/resources/community");
		System.out.println("137");
		File targetDir = new File(targetPath);
		if (!targetDir.exists()) {
			targetDir.mkdir();
		}
		if (files != null) {
			System.out.println("143");
			for (MultipartFile file : files) {
				if (file.isEmpty()) {
					System.out.println("file is empty!");
					continue;
				}
				String oriName = file.getOriginalFilename();
				System.out.println(oriName);
				String sysName = UUID.randomUUID() + "_" + oriName;
				System.out.println(sysName);
				String uploadPath = targetPath + "/" + sysName;
				file.transferTo(new File(uploadPath));
				System.out.println("complete");
				String imgSrc = "/resources/community/" + sysName;
				JsonArray jsonArray = new JsonArray();
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("imgSrc", imgSrc);
				jsonObject.addProperty("oriName", oriName);
				jsonArray.add(jsonObject);
				System.out.println(jsonArray.toString());
				response.getWriter().append(jsonArray.toString());
			}
		}
	}

	public List<BoardsDTO> selectBoard(CategoryType categoryType) {
		this.setNameByCode(categoryType);
		return communityDAO.selectBoard(categoryType);
	}

	public List<CategoryType> selectBoardType() {
		return communityDAO.selectBoardType();
	}

	public List<BoardsDTO> selectBoardByPage(CategoryType categoryType, int currentPage) {
		this.setNameByCode(categoryType);
		System.out.println(categoryType.getName());
		System.out.println(categoryType.getCode());
		System.out.println(currentPage);
		int startPost = (currentPage * this.postPerPage) - (this.postPerPage - 1);
		int endPost = (currentPage * this.postPerPage);
		System.out.println(startPost);
		System.out.println(endPost);
		Map<String, Object> pageInfo = new HashMap<>();
		pageInfo.put("board_name", categoryType.getName());
		pageInfo.put("startPost", startPost);
		pageInfo.put("endPost", endPost);
		return communityDAO.selectBoardByPage(pageInfo);
	}

	public BoardsDTO selectBoardView(BoardsDTO boardsDTO) {
		this.setBoardNameByBoardType(boardsDTO);
		return communityDAO.selectBoardView(boardsDTO);
	}

	public int updateBoard(BoardsDTO boardsDTO) {
		this.setBoardNameByBoardType(boardsDTO);
		return communityDAO.updateBoard(boardsDTO);
	}

	public int deleteBoard(BoardsDTO boardsDTO) {
		this.setBoardNameByBoardType(boardsDTO);
		return communityDAO.deleteBoard(boardsDTO);
	}

	public int insertReply(BoardsReplyDTO boardsReplyDTO) {
		this.setBoardNameByBoardType(boardsReplyDTO);
		return communityDAO.insertReply(boardsReplyDTO);
	}

	public List<BoardsReplyDTO> selectReply(BoardsDTO boardsDTO) {
		BoardsReplyDTO boardsReplyDTO = new BoardsReplyDTO();
		boardsReplyDTO.setParent_board(boardsDTO.getSeq());
		boardsReplyDTO.setBoard_type(boardsDTO.getBoard_type());
		this.setBoardNameByBoardType(boardsReplyDTO);
		return communityDAO.selectReply(boardsReplyDTO);
	}

	public List<BoardsReplyDTO> selectReReply(BoardsDTO boardsDTO) {
		BoardsReplyDTO boardsReplyDTO = new BoardsReplyDTO();
		boardsReplyDTO.setParent_board(boardsDTO.getSeq());
		boardsReplyDTO.setBoard_type(boardsDTO.getBoard_type());
		this.setBoardNameByBoardType(boardsReplyDTO);
		return communityDAO.selectReReply(boardsReplyDTO);
	}

	public int deleteReply(BoardsReplyDTO boardsReplyDTO) {
		this.setBoardNameByBoardType(boardsReplyDTO);
		return communityDAO.deleteReply(boardsReplyDTO);
	}

	public int updateReply(BoardsReplyDTO boardsReplyDTO) {
		this.setBoardNameByBoardType(boardsReplyDTO);
		return communityDAO.updateReply(boardsReplyDTO);
	}
}
