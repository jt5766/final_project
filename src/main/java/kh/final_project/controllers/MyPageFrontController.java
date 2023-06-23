package kh.final_project.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/my-page")
public class MyPageFrontController {
	@GetMapping
	public String toGalleryController(String tCode, RedirectAttributes attributes) {
		attributes.addAttribute("tCode", tCode);
		return "redirect:/{tCode}/myPage";
	}
}
