package kh.final_project.dto;

import java.time.LocalDateTime;
import java.util.List;

public class GalleryCard {
    private Long seq;
    private Integer category_type;
    private List<Integer> genreType;
    private Integer genre_type1;
    private Integer genre_type2;
    private String ai;
    private String title;
    private Integer writer;
    private String catchphrase;
    private String synopsis;
    private String thumbnail_url;
    private String yn; // Y,N
    private LocalDateTime write_date;

    public GalleryCard() {}

    public GalleryCard(Long seq,
                       Integer category_type,
                       List<Integer> genreType,
                       String ai,
                       String title,
                       Integer writer,
                       String catchphrase,
                       String synopsis,
                       String thumbnail_url,
                       String yn,
                       LocalDateTime write_date) {
        this.seq = seq;
        this.category_type = category_type;
        this.genreType = genreType;
        this.ai = ai;
        this.title = title;
        this.writer = writer;
        this.catchphrase = catchphrase;
        this.synopsis = synopsis;
        this.thumbnail_url = thumbnail_url;
        this.yn = yn;
        this.write_date = write_date;
    }

    public Long getSeq() {
        return seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }

    public Integer getCategory_type() {
        return category_type;
    }

    public void setCategory_type(Integer category_type) {
        this.category_type = category_type;
    }

    public List<Integer> getGenreType() {
        return genreType;
    }

    public void setGenreType(List<Integer> genreType) {
        this.genre_type1 = genreType.get(0);
        if (genreType.size() > 1) {
            this.genre_type2 = genreType.get(1);
        }
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

    public Integer getWriter() {
        return writer;
    }

    public void setWriter(Integer writer) {
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

    public String getThumbnail_url() {
        return thumbnail_url;
    }

    public void setThumbnail_url(String thumbnail_url) {
        this.thumbnail_url = thumbnail_url;
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

    @Override
    public String toString() {
        return "GalleryCard{" +
                "seq=" + seq +
                "\ncategory_type=" + category_type +
                "\ngenreType=" + genreType +
                "\ngenre_type1=" + genre_type1 +
                "\ngenre_type2=" + genre_type2 +
                "\nai='" + ai + '\'' +
                "\ntitle='" + title + '\'' +
                "\nwriter='" + writer + '\'' +
                "\ncatchphrase='" + catchphrase + '\'' +
                "\nsynopsis='" + synopsis + '\'' +
                "\nthumbnail_url='" + thumbnail_url + '\'' +
                "\nyn='" + yn + '\'' +
                "\nwrite_date=" + write_date +
                '}';
    }
}
