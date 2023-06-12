package kh.final_project.services;

import kh.final_project.dto.*;
import kh.final_project.repositories.GalleryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GalleryService {

    private final GalleryDAO galleryDAO;

    @Autowired
    public GalleryService(GalleryDAO galleryDAO) {
        this.galleryDAO = galleryDAO;
    }

    public void insertCard(GalleryCard card) {
        galleryDAO.insertCard(card);
    }

    public List<GalleryCardView> selectAllCards(SearchCriteria gallerySort) {
        return galleryDAO.selectAllCards(gallerySort);
    }

    public GalleryCardView selectOneCard(Long cardSeq) {
        return galleryDAO.selectOneCard(cardSeq);
    }

    public GalleryContent selectOneContent(Long cardSeq, Long contentSeq) {
        galleryDAO.updateViewCount(contentSeq);
        return galleryDAO.selectOneContent(cardSeq, contentSeq);
    }

    public List<GalleryContent> selectAllContents(Long cardSeq) {
        return galleryDAO.selectAllContents(cardSeq);
    }

    public void insertContent(GalleryContent content) {
        galleryDAO.insertContent(content);
    }

    public void updateCard(GalleryCard card) {
        galleryDAO.updateCard(card);
    }

    public void updateContent(GalleryContent content) {
        galleryDAO.updateContent(content);
    }

    public void deleteCard(Long cardSeq) {
        galleryDAO.deleteCard(cardSeq);
    }

    public void deleteContent(Long cardSeq, Long contentSeq) {
        galleryDAO.deleteContent(cardSeq, contentSeq);
    }

}
