package kh.final_project.dto;

public class AdminSearchDTO {
	private Integer type;
	private Integer search;
	private String keyword;

	public AdminSearchDTO() {
		super();
	}

	public AdminSearchDTO(Integer type, Integer search, String keyword) {
		super();
		this.type = type;
		this.search = search;
		this.keyword = keyword;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getSearch() {
		return search;
	}

	public void setSearch(Integer search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "AdminSearchDTO [type=" + type + ", search=" + search + ", keyword=" + keyword + "]";
	}

}
