package kh.final_project.repositories;

import kh.final_project.dto.GalleryCard;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GalleryDAO {

    private SqlSessionTemplate db;

    @Autowired
    public GalleryDAO(SqlSessionTemplate db) {
        this.db = db;
    }

    public int insertCard(GalleryCard card) {
        db.selectOne("Gallery.proc_i_gallery", card);
        return 1;
    }
}
