package kh.final_project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.final_project.services.CommunityService;

@Controller
@RequestMapping("/community/")
public class CommunityController {
	@Autowired
	private CommunityService communityService;

	@RequestMapping("toNotification")
	public String toNotification() {
		System.out.println("toNotification");
		return "community/notification";
	}

	@RequestMapping("toWriteForm")
	public String toWriteForm(String boardType, Model model) {
		System.out.println("toWriteForm");
		System.out.println("boardType : " + boardType);
		model.addAttribute("boardType", boardType);
		return "community/writeForm";
	}

	@RequestMapping("insertBoard")
	public void insertBoard() {
		System.out.println("insertBoard");
	}
}
