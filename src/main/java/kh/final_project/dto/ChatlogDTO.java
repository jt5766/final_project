package kh.final_project.dto;

import java.sql.Timestamp;

public class ChatlogDTO {
	private Long chatRooms;
	private int writer;
	private String txt;
	private Timestamp writeDate;
	
	public ChatlogDTO() {}
	public ChatlogDTO(Long chatRooms, int writer, String txt, Timestamp writeDate) {
		this.chatRooms = chatRooms;
		this.writer = writer;
		this.txt = txt;
		this.writeDate = writeDate;
	}
	public Long getChatRooms() {
		return chatRooms;
	}
	public void setChatRooms(Long chatRooms) {
		this.chatRooms = chatRooms;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getTxt() {
		return txt;
	}
	public void setTxt(String txt) {
		this.txt = txt;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
