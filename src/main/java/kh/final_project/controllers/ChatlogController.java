package kh.final_project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import kh.final_project.dto.ChatlogDTO;

@Controller
public class ChatlogController {

	@Autowired
	private SimpMessagingTemplate writer;
	
	// @SendTo 는 전송하고자 하는 구독 채녈명이 정적일 때 사용하기 좋음
	// SimpmessagingTemplate 은 전송하고자 하는 구독 채널명이 동적일 때 사용 가능
	
	@MessageMapping("/message")
	public void message(ChatlogDTO dto, SimpMessageHeaderAccessor smha) {
		String loginID = (String)smha.getSessionAttributes().get("loginID");
		writer.convertAndSend("/topic/"+dto.getChatRooms(), dto);
	}
}