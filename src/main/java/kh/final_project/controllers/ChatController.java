package kh.final_project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.final_project.dto.ChatlistDTO;
import kh.final_project.services.ChatService;

@Controller
@RequestMapping("/chat/")
public class ChatController {
	
	@Autowired
	private ChatService chatservice;
	
	@RequestMapping("application")
	public String application(ChatlistDTO dto) {
		return "";
	}
}
