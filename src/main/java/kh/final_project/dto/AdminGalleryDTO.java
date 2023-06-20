package kh.final_project.dto;

public class AdminGalleryDTO {
	private Integer type;
	private String typeName;
	private Integer seq;
	private String title;
	private Integer writer;
	private String nickname;

	public AdminGalleryDTO() {
		super();
	}

	public AdminGalleryDTO(Integer type, String typeName, Integer seq, String title, Integer writer, String nickname) {
		super();
		this.type = type;
		this.typeName = typeName;
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.nickname = nickname;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
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

	@Override
	public String toString() {
		return "AdminGalleryDTO [type=" + type + ", typeName=" + typeName + ", seq=" + seq + ", title=" + title
				+ ", writer=" + writer + ", nickname=" + nickname + "]";
	}

}
