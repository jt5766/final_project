package kh.final_project.dto;

public class ChatlistDTO {
	private Long seq;
	private int mentor;
	private int mentee;
	private String yn;

	public ChatlistDTO() {}
	public ChatlistDTO(Long seq, int mentor, int mentee, String yn) {
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
	public int getMentor() {
		return mentor;
	}
	public void setMentor(int mentor) {
		this.mentor = mentor;
	}
	public int getMentee() {
		return mentee;
	}
	public void setMentee(int mentee) {
		this.mentee = mentee;
	}
	public String getYn() {
		return yn;
	}
	public void setYn(String yn) {
		this.yn = yn;
	}
}
