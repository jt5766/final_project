package kh.final_project.repositories;

import kh.final_project.dto.GalleryCard;
import kh.final_project.dto.GalleryContent;
import kh.final_project.dto.GalleryCardView;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GalleryDAO {

    private SqlSessionTemplate db;

    @Autowired
    public GalleryDAO(SqlSessionTemplate db) {
        this.db = db;
    }

    public void insertCard(GalleryCard card) {
        db.insert("Gallery.insertCard", card);
    }

    public List<GalleryCardView> selectAllCards() {
        return db.selectList("Gallery.selectAllCards");
    }

    public GalleryCardView selectOneCard(Integer cardSeq) {
        return db.selectOne("Gallery.selectOneCard", cardSeq);
    }

    public GalleryContent selectOneContent(Integer cardSeq, Integer contentSeq) {
        Map<String, Integer> params = Map.ofEntries(
                Map.entry("cardSeq", cardSeq),
                Map.entry("contentSeq", contentSeq)
        );
        return db.selectOne("Gallery.selectOneContent", params);
    }

    public List<GalleryContent> selectAllContents(Integer cardSeq) {
        return db.selectList("Gallery.selectAllContents", cardSeq);
    }
}
