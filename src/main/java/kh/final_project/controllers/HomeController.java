package kh.final_project.controllers;

import kh.final_project.dto.CategoryType;
import kh.final_project.dto.GalleryCardView;
import kh.final_project.services.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {
	@Autowired
	private HttpSession session;

	@Autowired
	private HomeService homeService;

	@RequestMapping("/")
	public String home(Model model) {
		// 하나라도 없으면 세션 가져오기
		if (session.getAttribute("gallery") == null || session.getAttribute("community") == null || session.getAttribute("mypage") == null || session.getAttribute("adminpage") == null) {
			// 세션 비우기
			session.removeAttribute("gallery");
			session.removeAttribute("community");
			session.removeAttribute("mypage");
			session.removeAttribute("adminpage");
			// 세션 채우기
			Map<String, List<CategoryType>> result = homeService.init();
			session.setAttribute("gallery", result.get("gallery"));
			session.setAttribute("community", result.get("community"));
			session.setAttribute("mypage", result.get("mypage"));
			session.setAttribute("adminpage", result.get("adminpage"));
		}

		List<CategoryType> categoryTypes = (List<CategoryType>) session.getAttribute("gallery");
		setDailyPopCards(categoryTypes, model);
		return "home";
	}

	private void setDailyPopCards(List<CategoryType> categoryTypes, Model model) {
		List<List<GalleryCardView>> dailyPopCards = homeService.getDailyPopCards(categoryTypes);
		Map<Integer, List<GalleryCardView>> cards = new LinkedHashMap<>();
		for (int i = 0; i < categoryTypes.size(); i++) {
			cards.put(categoryTypes.get(i).getCode(), dailyPopCards.get(i));
		}
		model.addAttribute("cards", cards);
	}

}
