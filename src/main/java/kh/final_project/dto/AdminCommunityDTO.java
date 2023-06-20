package kh.final_project.dto;

public class AdminCommunityDTO {
	private Integer boardType;
	private String boardTypeName;
	private Integer seq;
	private String title;
	private Integer writer;
	private String nickname;

	public AdminCommunityDTO() {
		super();
	}

	public AdminCommunityDTO(Integer boardType, String boardTypeName, Integer seq, String title, Integer writer,
			String nickname) {
		super();
		this.boardType = boardType;
		this.boardTypeName = boardTypeName;
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.nickname = nickname;
	}

	public Integer getBoardType() {
		return boardType;
	}

	public void setBoardType(Integer boardType) {
		this.boardType = boardType;
	}

	public String getBoardTypeName() {
		return boardTypeName;
	}

	public void setBoardTypeName(String boardTypeName) {
		this.boardTypeName = boardTypeName;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getWriter() {
		return writer;
	}

	public void setWriter(Integer writer) {
		this.writer = writer;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
