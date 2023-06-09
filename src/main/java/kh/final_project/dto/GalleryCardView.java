package kh.final_project.dto;

import java.time.LocalDateTime;

public class GalleryCardView {
    private Long seq;
    private String thumbnail_url;
    private Integer category_type;
    private String category_name;
    private Integer genre_type1;
    private String genre_name1;
    private Integer genre_type2;
    private String genre_name2;
    private String ai;
    private String title;
    private Integer writer;
    private String member_name;
    private String catchphrase;
    private String synopsis;
    private LocalDateTime write_date;
    private Integer total_count;
    private Integer day_count;
    private String yn;

    public Long getSeq() {
        return seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }

    public String getThumbnail_url() {
        return thumbnail_url;
    }

    public void setThumbnail_url(String thumbnail_url) {
        this.thumbnail_url = thumbnail_url;
    }

    public Integer getCategory_type() {
        return category_type;
    }

    public void setCategory_type(Integer category_type) {
        this.category_type = category_type;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public Integer getGenre_type1() {
        return genre_type1;
    }

    public void setGenre_type1(Integer genre_type1) {
        this.genre_type1 = genre_type1;
    }

    public String getGenre_name1() {
        return genre_name1;
    }

    public void setGenre_name1(String genre_name1) {
        this.genre_name1 = genre_name1;
    }

    public Integer getGenre_type2() {
        return genre_type2;
    }

    public void setGenre_type2(Integer genre_type2) {
        this.genre_type2 = genre_type2;
    }

    public String getGenre_name2() {
        return genre_name2;
    }

    public void setGenre_name2(String genre_name2) {
        this.genre_name2 = genre_name2;
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

    public Integer getWriter() {
        return writer;
    }

    public void setWriter(Integer writer) {
        this.writer = writer;
    }

    public String getMember_name() {
        return member_name;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
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

    public Integer getTotal_count() {
        return total_count;
    }

    public void setTotal_count(Integer total_count) {
        this.total_count = total_count;
    }

    public LocalDateTime getWrite_date() {
        return write_date;
    }

    public void setWrite_date(LocalDateTime write_date) {
        this.write_date = write_date;
    }

    public String getYn() {
        return yn;
    }

    public void setYn(String yn) {
        this.yn = yn;
    }

    public Integer getDay_count() {
        return day_count;
    }

    public void setDay_count(Integer day_count) {
        this.day_count = day_count;
    }

    @Override
    public String toString() {
        return "GalleryCardView{" +
                "\nseq=" + seq +
                "\nthumbnail_url='" + thumbnail_url + '\'' +
                "\ncategory_type=" + category_type +
                "\ncategory_name='" + category_name + '\'' +
                "\ngenre_type1=" + genre_type1 +
                "\ngenre_name1='" + genre_name1 + '\'' +
                "\ngenre_type2=" + genre_type2 +
                "\ngenre_name2='" + genre_name2 + '\'' +
                "\nai='" + ai + '\'' +
                "\ntitle='" + title + '\'' +
                "\nwriter=" + writer +
                "\nmember_name='" + member_name + '\'' +
                "\ncatchphrase='" + catchphrase + '\'' +
                "\nsynopsis='" + synopsis + '\'' +
                "\nwrite_date=" + write_date +
                "\ntotal_count=" + total_count +
                "\nday_count=" + day_count +
                "\nyn='" + yn + '\'' +
                '}';
    }
}
