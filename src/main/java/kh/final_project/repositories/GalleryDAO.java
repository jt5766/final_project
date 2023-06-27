package kh.final_project.repositories;

import kh.final_project.dto.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GalleryDAO {

    private final SqlSessionTemplate db;

    @Autowired
    public GalleryDAO(SqlSessionTemplate db) {
        this.db = db;
    }

    public void insertCard(GalleryCard card) {
        db.insert("Gallery.insertCard", card);
    }

    public List<GalleryCardView> selectAllCards(SearchCriteria searchCriteria) {
        return db.selectList("Gallery.selectAllCards", searchCriteria);
    }

    public GalleryCardView selectOneCard(Long cardSeq) {
        return db.selectOne("Gallery.selectOneCard", cardSeq);
    }

    public GalleryContent selectOneContent(Long cardSeq, Long contentSeq) {
        Map<String, Long> params = Map.ofEntries(
                Map.entry("cardSeq", cardSeq),
                Map.entry("contentSeq", contentSeq)
        );
        return db.selectOne("Gallery.selectOneContent", params);
    }

    public List<GalleryContent> selectAllContents(GalleryCardDTO galleryCardDTO) {
        return db.selectList("Gallery.selectAllContents", galleryCardDTO);
    }

    public void insertContent(GalleryContent content) {
        db.insert("Gallery.insertContent", content);
    }

    public void updateViewCount(Long contentSeq) {
        db.update("Gallery.updateViewCount", contentSeq);
    }

    public void updateCard(GalleryCard card) {
        db.update("Gallery.updateCard", card);
    }

    public void updateContent(GalleryContent content) {
        db.update("Gallery.updateContent", content);
    }

    public void deleteCard(Long cardSeq) {
        db.delete("Gallery.deleteCard", cardSeq);
    }

    public void deleteContent(Long cardSeq, Long contentSeq) {
        Map<String, Long> params = Map.ofEntries(
                Map.entry("cardSeq", cardSeq),
                Map.entry("contentSeq", contentSeq)
        );
        db.delete("Gallery.deleteContent", params);
    }

    public Integer getTotalCards(SearchCriteria searchCriteria) {
        return db.selectOne("Gallery.totalCards", searchCriteria);
    }

    public Integer getTotalContents(GalleryCardDTO galleryCardDTO) {
        return db.selectOne("Gallery.totalContents", galleryCardDTO);
    }

    public void updateCardDisclosure(Long cardSeq, String value) {
        Map<String, Object> params = Map.ofEntries(
                Map.entry("cardSeq", cardSeq),
                Map.entry("value", value)
        );
        db.update("Gallery.updateCardDisclosure", params);
    }

    public void updateContentDisclosure(Long contentSeq, String value) {
        Map<String, Object> params = Map.ofEntries(
                Map.entry("cardSeq", contentSeq),
                Map.entry("value", value)
        );
        db.update("Gallery.updateContentDisclosure", params);
    }

    public List<GalleryCardView> selectMyCards(Integer code) {
        return db.selectList("Gallery.selectMyCards", code);
    }

//    public List<GalleryCardView> getDailyPopCards() {
//        return
//    }
}
