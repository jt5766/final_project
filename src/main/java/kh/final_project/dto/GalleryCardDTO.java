package kh.final_project.dto;

public class GalleryCardDTO {
    private Long cardSeq;
    private Integer page;
    private Integer start;
    private Integer end;

    public GalleryCardDTO() {
        page = 1;
    }

    public GalleryCardDTO(Long cardSeq, Integer page, Integer start, Integer end) {
        this.cardSeq = cardSeq;
        this.page = page;
        this.start = start;
        this.end = end;
    }

    public Long getCardSeq() {
        return cardSeq;
    }

    public void setCardSeq(Long cardSeq) {
        this.cardSeq = cardSeq;
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
}
