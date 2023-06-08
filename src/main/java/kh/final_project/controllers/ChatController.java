package kh.final_project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.final_project.dto.ChatlogDTO;
import kh.final_project.services.ChatService;
import kh.final_project.services.ChatlogService;

@Controller
@RequestMapping("/chat/")
public class ChatController {
	
	@Autowired
	private ChatService chatservice;
	
	@Autowired
	private ChatlogService chatlogservice;
	
	@RequestMapping("testlink")
	public String testlink(Model model) {
		model.addAttribute("chatlist", chatservice.select(10000001));
		return "chat/chatlist";
	}
	
	@RequestMapping("application")
	public String application(int mentor,int mentee) {
		chatservice.application(mentor, mentee);
		return "";
	}
	
	@RequestMapping("accept")
	public String accept(Long seq) {
		chatservice.accept(seq);
		return "";
	}
	
	@RequestMapping("refuse")
	public String refuse(Long seq) {
		chatservice.refuse(seq);
		return "";
	}
	
	@RequestMapping("entrance")
	public String entrance(Long seq,Model model) {
		ChatlogDTO logdto = chatlogservice.selectLog(seq);
		model.addAttribute("chatlog", logdto);
		return "chat/chatroom";
	}
	
}
