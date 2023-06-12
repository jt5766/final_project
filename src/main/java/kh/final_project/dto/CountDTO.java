package kh.final_project.dto;

public class CountDTO {
	private String type;
	private Integer count;

	public CountDTO() {
		super();
	}

	public CountDTO(String name, Integer count) {
		super();
		this.type = name;
		this.count = count;
	}

	public String getName() {
		return type;
	}

	public void setName(String name) {
		this.type = name;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}
