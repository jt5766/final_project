package kh.final_project.dto;

import java.time.LocalDateTime;

public class GalleryCards {
    private Long seq;
    private Integer categoryType;
    private Integer genreType;
    private String ai;
    private String title;
    private String writer; //Y,N
    private String catchphrase;
    private String synopsis;
    private String thumbnail;
    private String yn; // Y,N
    private LocalDateTime writeDate;

    public GalleryCards() {}

    public GalleryCards(Long seq,
                        Integer categoryType,
                        Integer genreType,
                        String ai,
                        String title,
                        String writer,
                        String catchphrase,
                        String synopsis,
                        String thumbnail,
                        String yn,
                        LocalDateTime writeDate) {
        this.seq = seq;
        this.categoryType = categoryType;
        this.genreType = genreType;
        this.ai = ai;
        this.title = title;
        this.writer = writer;
        this.catchphrase = catchphrase;
        this.synopsis = synopsis;
        this.thumbnail = thumbnail;
        this.yn = yn;
        this.writeDate = writeDate;
    }

    public Long getSeq() {
        return seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }

    public Integer getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(Integer categoryType) {
        this.categoryType = categoryType;
    }

    public Integer getGenreType() {
        return genreType;
    }

    public void setGenreType(Integer genreType) {
        this.genreType = genreType;
    }

    public String getAi() {
        return ai;
    }

    public void setAi(String ai) {
        this.ai = ai;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getCatchphrase() {
        return catchphrase;
    }

    public void setCatchphrase(String catchphrase) {
        this.catchphrase = catchphrase;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
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
}
