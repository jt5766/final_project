package kh.final_project.dto;

import java.sql.Timestamp;

public class ChatlogDTO {
	private Long chat_rooms;
	private int writer;
	private String txt;
	private Timestamp write_date;
	private String writernickname;
	
	public ChatlogDTO() {}
	public ChatlogDTO(Long chat_rooms, int writer, String txt, Timestamp write_date, String writernickname) {
		this.chat_rooms = chat_rooms;
		this.writer = writer;
		this.txt = txt;
		this.write_date = write_date;
		this.writernickname = writernickname;
	}
	public Long getChat_rooms() {
		return chat_rooms;
	}
	public void setChat_rooms(Long chat_rooms) {
		this.chat_rooms = chat_rooms;
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
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public String getWriternickname() {
		return writernickname;
	}
	public void setWriternickname(String writernickname) {
		this.writernickname = writernickname;
	}
}
