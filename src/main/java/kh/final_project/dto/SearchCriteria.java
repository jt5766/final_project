package kh.final_project.dto;

public class GallerySort {
    private Integer categoryType;
    private String sortType;

    public GallerySort() {
    }

    public GallerySort(Integer categoryType, String sortType) {
        this.categoryType = categoryType;
        this.sortType = sortType;
    }

    public Integer getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(Integer categoryType) {
        this.categoryType = categoryType;
    }

    public String getSortType() {
        return sortType;
    }

    public void setSortType(String sortType) {
        this.sortType = sortType;
    }
}
