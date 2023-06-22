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
    private Integer page;
    private Integer start;
    private Integer end;
    private Integer writer;

    public SearchCriteria() {
        page = 1;
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

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getEnd() {
        return end;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }

    public Integer getWriter() {
        return writer;
    }

    public void setWriter(Integer writer) {
        this.writer = writer;
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
                ", page=" + page +
                ", start=" + start +
                ", end=" + end +
                ", writer=" + writer +
                '}';
    }
}
