package kh.final_project.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.final_project.dto.CategoryType;
import kh.final_project.services.HomeService;

@Controller
public class HomeController {
	@Autowired
	private HttpSession session;

	@Autowired
	private HomeService homeService;

	@RequestMapping("/")
	public String home() {
		// 세션 비우기
		if (session.getAttribute("gallery") == null || session.getAttribute("community") == null || session.getAttribute("mypage") == null || session.getAttribute("adminpage") == null) {
			session.invalidate();
			Map<String, List<CategoryType>> result = homeService.init();
			session.setAttribute("gallery", result.get("gallery"));
			session.setAttribute("community", result.get("community"));
			session.setAttribute("mypage", result.get("mypage"));
			session.setAttribute("adminpage", result.get("adminpage"));
		}
		return "home";
	}

}
