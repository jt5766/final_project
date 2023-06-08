package kh.final_project.services;

import kh.final_project.dto.GalleryCard;
import kh.final_project.dto.GalleryView;
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

    public List<GalleryView> selectAllCards() {
        return galleryDAO.selectAllCards();
    }

    public GalleryView selectOneCard(Integer cardSeq) {
        return galleryDAO.selectOneCard(cardSeq);
    }
}
