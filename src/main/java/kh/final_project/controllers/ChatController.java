package kh.final_project.controllers;

import kh.final_project.dto.ChatlistDTO;
import kh.final_project.dto.ChatlogDTO;
import kh.final_project.services.ChatService;
import kh.final_project.services.ChatlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/chat/")
public class ChatController {
	
	@Autowired
	private ChatService chatservice;
	
	@Autowired
	private ChatlogService chatlogservice;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("testlink")
	public String testlink(Model model) {
		List<ChatlistDTO> list = chatservice.select((int)session.getAttribute("code"));
		model.addAttribute("chatlist", list);
		return "chat/chatlist";
	}
	
	@RequestMapping(value = "application", method = RequestMethod.POST)
	public void application(int mentor, int mentee) {
		chatservice.application(mentor, mentee);
	}
	
	@RequestMapping("accept")
	public String accept(Long seq) {
		System.out.println("누구임"+seq);
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
		boolean result = chatservice.checkUser((Integer)session.getAttribute("code"),seq);
		if(result) {
			chatlogservice.maxScroll(seq);
			List<ChatlogDTO> loglist = chatlogservice.selectChatLog(seq);
			model.addAttribute("chatseq",seq);
			model.addAttribute("chatlog", loglist);
			return "chat/chatroom";
		}else {
			return "home";
		}
	}
	
}
