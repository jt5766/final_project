package kh.final_project.dto;

public class ChatlistDTO {
	private Long seq;
	private String mentor;
	private String mentee;
	private String yn;

	public ChatlistDTO() {}
	public ChatlistDTO(Long seq, String mentor, String mentee, String yn) {
		this.seq = seq;
		this.mentor = mentor;
		this.mentee = mentee;
		this.yn = yn;
	}
	
	public Long getSeq() {
		return seq;
	}
	public void setSeq(Long seq) {
		this.seq = seq;
	}
	public String getMentor() {
		return mentor;
	}
	public void setMentor(String mentor) {
		this.mentor = mentor;
	}
	public String getMentee() {
		return mentee;
	}
	public void setMentee(String mentee) {
		this.mentee = mentee;
	}
	public String getYn() {
		return yn;
	}
	public void setYn(String yn) {
		this.yn = yn;
	}
}
