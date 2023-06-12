package kh.final_project.dto;

public class SearchCriteria {
    private Integer typeCode;
    private Integer sortType;
    private String keyword;

    public SearchCriteria() {
    }

    public SearchCriteria(Integer typeCode, Integer sortType, String keyword) {
        this.typeCode = typeCode;
        this.sortType = sortType;
        this.keyword = keyword;
    }

    public Integer getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(Integer typeCode) {
        this.typeCode = typeCode;
    }

    public Integer getSortType() {
        return sortType;
    }

    public void setSortType(Integer sortType) {
        this.sortType = sortType;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
