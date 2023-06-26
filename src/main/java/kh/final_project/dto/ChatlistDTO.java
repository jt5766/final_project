package kh.final_project.dto;

public class ChatlistDTO {
	private Long seq;
	private int mentor;
	private int mentee;
	private String yn;
	private String mentorname;
	private String menteename;

	public ChatlistDTO() {}
	public ChatlistDTO(Long seq, int mentor, int mentee, String yn, String mentorname, String menteename) {
		this.seq = seq;
		this.mentor = mentor;
		this.mentee = mentee;
		this.yn = yn;
		this.mentorname = mentorname;
		this.menteename = menteename;
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
	public String getMentorname() {
		return mentorname;
	}
	public void setMentorname(String mentorname) {
		this.mentorname = mentorname;
	}
	public String getMenteename() {
		return menteename;
	}
	public void setMenteename(String menteename) {
		this.menteename = menteename;
	}
}
