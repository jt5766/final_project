package kh.final_project.dto;

public class CategoryType {
	private Integer code;
	private Integer sort;
	private String name;
	private String yn;
	private String keyword;
	private String val;
	private String board_name;

	public CategoryType() {
		super();
	}

	public CategoryType(Integer code, String name) {
		super();
		this.code = code;
		this.name = name;
	}

	public CategoryType(Integer code, Integer sort, String name, String yn) {
		super();
		this.code = code;
		this.sort = sort;
		this.name = name;
		this.yn = yn;
	}

	public CategoryType(Integer code, Integer sort, String name, String yn, String keyword, String val) {
		super();
		this.code = code;
		this.sort = sort;
		this.name = name;
		this.yn = yn;
		this.keyword = keyword;
		this.val = val;
	}

	public CategoryType(Integer code, Integer sort, String name, String yn, String keyword, String val,
			String board_name) {
		super();
		this.code = code;
		this.sort = sort;
		this.name = name;
		this.yn = yn;
		this.keyword = keyword;
		this.val = val;
		this.board_name = board_name;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getYn() {
		return yn;
	}

	public void setYn(String yn) {
		this.yn = yn;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	@Override
	public String toString() {
		return "CategoryType [code=" + code + ", sort=" + sort + ", name=" + name + ", yn=" + yn + ", keyword="
				+ keyword + ", val=" + val + ", board_name=" + board_name + "]";
	}

}
