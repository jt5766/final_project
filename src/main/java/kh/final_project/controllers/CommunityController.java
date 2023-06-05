package kh.final_project.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/")
public class CommunityController {

	@RequestMapping("/toNotification")
	public String toNotification() {
		return "/community/notification";
	}
}
