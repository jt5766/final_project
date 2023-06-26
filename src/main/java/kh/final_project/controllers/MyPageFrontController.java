package kh.final_project.controllers;

import kh.final_project.dto.BoardsDTO;
import kh.final_project.dto.GalleryCardView;
import kh.final_project.services.CommunityService;
import kh.final_project.services.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/member/my-page")
public class MyPageFrontController {
	private final GalleryService galleryService;
	private final CommunityService communityService;
	private final HttpSession session;

	@Autowired
	public MyPageFrontController(GalleryService galleryService, CommunityService communityService, HttpSession session) {
		this.galleryService = galleryService;
		this.communityService = communityService;
		this.session = session;
	}

	@GetMapping("/gallery")
	public String myGallery(Model model) {
		List<GalleryCardView> card = galleryService.selectMyCards((Integer) session.getAttribute("code"));
		Map<String, List<GalleryCardView>> cards = new LinkedHashMap<>();
		cards.put("1001", card.stream().filter(e -> e.getCategory_type()==1001).collect(Collectors.toList()));
		cards.put("1002", card.stream().filter(e -> e.getCategory_type()==1002).collect(Collectors.toList()));
		cards.put("1003", card.stream().filter(e -> e.getCategory_type()==1003).collect(Collectors.toList()));
		cards.put("1004", card.stream().filter(e -> e.getCategory_type()==1004).collect(Collectors.toList()));
		cards.put("1005", card.stream().filter(e -> e.getCategory_type()==1005).collect(Collectors.toList()));
		cards.put("1006", card.stream().filter(e -> e.getCategory_type()==1006).collect(Collectors.toList()));
		model.addAttribute("cards", cards);
		return "/member/gallery";
	}

	@GetMapping("/community")
	public String myCommunity(Model model) {
		int code = (int)session.getAttribute("code");
		Map<String, List<BoardsDTO>> communities = new LinkedHashMap<>();
		communities.put("1001", communityService.getMyNotice(code));
		communities.put("1002", communityService.getMyFree(code));
		communities.put("1003", communityService.getMyTip(code));
		communities.put("1004", communityService.getMyQuestion(code));
		communities.put("1005", communityService.getMyComplaint(code));
		model.addAttribute("communities", communities);
		return "/member/community";
	}
}
