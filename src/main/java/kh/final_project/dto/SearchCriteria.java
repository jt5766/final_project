package kh.final_project.dto;

public class SearchCriteria {
    private String tableName;
    private Integer typeCode;
    private Integer sortCode;
    private String sortKeyword;
    private String sortVal;
    private Integer searchCode;
    private String searchKeyword;
    private String searchQuery;

    public SearchCriteria() {
    }

    public SearchCriteria(String tableName, Integer typeCode, Integer sortCode, Integer conditionCode, String keyword) {
        this.tableName = tableName;
        this.typeCode = typeCode;
        this.sortCode = sortCode;
        this.searchCode = conditionCode;
        this.searchQuery = keyword;
    }

    public Integer getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(Integer typeCode) {
        this.typeCode = typeCode;
    }

    public Integer getSortCode() {
        return sortCode;
    }

    public void setSortCode(Integer sortCode) {
        this.sortCode = sortCode;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public Integer getSearchCode() {
        return searchCode;
    }

    public void setSearchCode(Integer searchCode) {
        this.searchCode = searchCode;
    }

    public String getSearchQuery() {
        return searchQuery;
    }

    public void setSearchQuery(String searchQuery) {
        this.searchQuery = searchQuery;
    }

    public String getSortKeyword() {
        return sortKeyword;
    }

    public void setSortKeyword(String sortKeyword) {
        this.sortKeyword = sortKeyword;
    }

    public String getSortVal() {
        return sortVal;
    }

    public void setSortVal(String sortVal) {
        this.sortVal = sortVal;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    @Override
    public String toString() {
        return "SearchCriteria{" +
                "tableName='" + tableName + '\'' +
                ", typeCode=" + typeCode +
                ", sortCode=" + sortCode +
                ", sortKeyword='" + sortKeyword + '\'' +
                ", sortVal='" + sortVal + '\'' +
                ", searchCode=" + searchCode +
                ", searchKeyword='" + searchKeyword + '\'' +
                ", searchQuery='" + searchQuery + '\'' +
                '}';
    }
}
