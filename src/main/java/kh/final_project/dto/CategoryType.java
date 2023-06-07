package kh.final_project.dto;

public class CategoryType {
	private Integer code;
	private Integer sort;
	private String name;
	private String yn;

	public CategoryType() {
	}

	public CategoryType(Integer code, String name) {
		this.code = code;
		this.name = name;
	}

	public CategoryType(Integer code, Integer sort, String name, String yn) {
		super();
		this.code = code;
		this.name = name;
		this.sort = sort;
		this.yn = yn;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getYn() {
		return yn;
	}

	public void setYn(String yn) {
		this.yn = yn;
	}

	@Override
	public String toString() {
		return "CategoryType [code=" + code + ", sort=" + sort + ", name=" + name + ", yn=" + yn + "]";
	}

}
