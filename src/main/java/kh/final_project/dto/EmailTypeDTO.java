package kh.final_project.dto;

public class EmailTypeDTO {

    private int code;
    private int sort;
    private String name;
    private String yn;


    public EmailTypeDTO(){}

    public EmailTypeDTO(int code, int sort, String name, String yn) {
        this.code = code;
        this.sort = sort;
        this.name = name;
        this.yn = yn;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
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
}
