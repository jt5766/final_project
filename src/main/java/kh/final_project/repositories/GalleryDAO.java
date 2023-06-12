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

    public List<GalleryCardView> selectAllCards(GallerySort gallerySort) {
        return db.selectList("Gallery.selectAllCards", gallerySort);
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

    public List<GalleryContent> selectAllContents(Long cardSeq) {
        return db.selectList("Gallery.selectAllContents", cardSeq);
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

    public List<GalleryCardView> selectCardsByCategoryType(Integer categoryType) {
        return db.selectList("Gallery.selectCardsByCategoryType", categoryType);
    }

    public List<GalleryCardView> selectAllCardsWithSort(GallerySort gallerySort) {
        return db.selectList("Gallery.selectAllCardsWithSort", gallerySort);
        //TODO: 쿼리문 작성
    }
}
