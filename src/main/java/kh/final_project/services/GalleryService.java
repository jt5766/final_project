package kh.final_project.services;

import kh.final_project.dto.GalleryCard;
import kh.final_project.dto.GalleryContent;
import kh.final_project.dto.GalleryCardView;
import kh.final_project.repositories.GalleryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GalleryService {

    private GalleryDAO galleryDAO;

    @Autowired
    public GalleryService(GalleryDAO galleryDAO) {
        this.galleryDAO = galleryDAO;
    }

    public void insertCard(GalleryCard card) {
        galleryDAO.insertCard(card);
    }

    public List<GalleryCardView> selectAllCards() {
        return galleryDAO.selectAllCards();
    }

    public GalleryCardView selectOneCard(Integer cardSeq) {
        return galleryDAO.selectOneCard(cardSeq);
    }

    public GalleryContent selectOneContent(Integer cardSeq, Integer contentSeq) {
        galleryDAO.updateViewCount(contentSeq);
        return galleryDAO.selectOneContent(cardSeq, contentSeq);
    }

    public List<GalleryContent> selectAllContents(Integer cardSeq) {
        return galleryDAO.selectAllContents(cardSeq);
    }

    public void insertContent(GalleryContent content) {
        galleryDAO.insertContent(content);
    }

    public void updateCard(GalleryCard card) {
        galleryDAO.updateCard(card);
    }
}
