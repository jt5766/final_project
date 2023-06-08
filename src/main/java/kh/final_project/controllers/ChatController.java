package kh.final_project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.final_project.dto.ChatlistDTO;
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
		List<ChatlistDTO> list = chatservice.select(10000001);
		model.addAttribute("chatlist", list);
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
		return "redirect:/chat/testlink";
	}
	
	@RequestMapping("refuse")
	public String refuse(Long seq) {
		chatservice.refuse(seq);
		return "redirect:/chat/testlink";
	}
	
	//이부분 seq 들어가는거 수정 해야함
	@RequestMapping("entrance")
	public String entrance(Long seq,Model model) {
		List<ChatlogDTO> logdto = chatlogservice.selectLog(seq);
		model.addAttribute("chatseq",seq);
		model.addAttribute("chatlog", logdto);
		return "chat/chatroom";
	}
	
}
