package kh.final_project.dto;


import java.time.LocalDateTime;

public class GalleryContent {
    private Long gallery_cards;
    private Long seq;
    private String title;
    private String file_url;
    private String video_url;
    private String txt;
    private String yn; //Y,N
    private LocalDateTime write_date;
    private Integer total_count;
    private Integer day_count;
    private Integer category_type;
    private Integer writer;

    public GalleryContent() {}

    public GalleryContent(Long gallery_cards,
                          Long seq,
                          String title,
                          String file_url,
                          String video_url,
                          String txt,
                          String yn,
                          LocalDateTime writeDate,
                          Integer total_count,
                          Integer day_count) {
        this.gallery_cards = gallery_cards;
        this.seq = seq;
        this.title = title;
        this.file_url = file_url;
        this.video_url = video_url;
        this.txt = txt;
        this.yn = yn;
        this.write_date = writeDate;
        this.total_count = total_count;
        this.day_count = day_count;
    }

    public Long getGallery_cards() {
        return gallery_cards;
    }

    public void setGallery_cards(Long gallery_cards) {
        this.gallery_cards = gallery_cards;
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

    public String getFile_url() {
        return file_url;
    }

    public void setFile_url(String file_url) {
        this.file_url = file_url;
    }

    public String getVideo_url() {
        return video_url;
    }

    public void setVideo_url(String video_url) {
        this.video_url = video_url;
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

    public LocalDateTime getWrite_date() {
        return write_date;
    }

    public void setWrite_date(LocalDateTime write_date) {
        this.write_date = write_date;
    }

    public Integer getTotal_count() {
        return total_count;
    }

    public void setTotal_count(Integer total_count) {
        this.total_count = total_count;
    }

    public Integer getDay_count() {
        return day_count;
    }

    public void setDay_count(Integer day_count) {
        this.day_count = day_count;
    }

    public Integer getCategory_type() {
        return category_type;
    }

    public void setCategory_type(Integer category_type) {
        this.category_type = category_type;
    }

    public Integer getWriter() {
        return writer;
    }

    public void setWriter(Integer writer) {
        this.writer = writer;
    }

    @Override
    public String toString() {
        return "GalleryContent{" +
                "\ngallery_cards=" + gallery_cards +
                "\nseq=" + seq +
                "\ntitle='" + title + '\'' +
                "\nfile_url='" + file_url + '\'' +
                "\nvideo_url='" + video_url + '\'' +
                "\ntxt='" + txt + '\'' +
                "\nyn='" + yn + '\'' +
                "\nwrite_date=" + write_date +
                "\ntotal_count=" + total_count +
                "\nday_count=" + day_count +
                "\ncategory_type=" + category_type +
                "\nwriter=" + writer +
                '}';
    }
}
