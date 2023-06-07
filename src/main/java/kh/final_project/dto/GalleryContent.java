package kh.final_project.dto;


import java.time.LocalDateTime;

public class GalleryContent {
    private Long galleryCards;
    private Long seq;
    private String title;
    private String fileUrl;
    private String videoUrl;
    private String txt;
    private String yn; //Y,N
    private LocalDateTime writeDate;
    private Integer totalCount;
    private Integer dayCount;

    public GalleryContent() {}

    public GalleryContent(Long galleryCards,
                          Long seq,
                          String title,
                          String fileUrl,
                          String videoUrl,
                          String txt,
                          String yn,
                          LocalDateTime writeDate,
                          Integer totalCount,
                          Integer dayCount) {
        this.galleryCards = galleryCards;
        this.seq = seq;
        this.title = title;
        this.fileUrl = fileUrl;
        this.videoUrl = videoUrl;
        this.txt = txt;
        this.yn = yn;
        this.writeDate = writeDate;
        this.totalCount = totalCount;
        this.dayCount = dayCount;
    }

    public Long getGalleryCards() {
        return galleryCards;
    }

    public void setGalleryCards(Long galleryCards) {
        this.galleryCards = galleryCards;
    }

    public Long getSeq() {
        return seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    public String getYn() {
        return yn;
    }

    public void setYn(String yn) {
        this.yn = yn;
    }

    public LocalDateTime getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(LocalDateTime writeDate) {
        this.writeDate = writeDate;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getDayCount() {
        return dayCount;
    }

    public void setDayCount(Integer dayCount) {
        this.dayCount = dayCount;
    }
}
