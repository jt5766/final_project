package kh.final_project.services;

import kh.final_project.dto.*;
import kh.final_project.repositories.GalleryDAO;
import kh.final_project.repositories.TypeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GalleryService {

    private final GalleryDAO galleryDAO;
    private final TypeDAO typeDAO;

    @Autowired
    public GalleryService(GalleryDAO galleryDAO, TypeDAO typeDAO) {
        this.galleryDAO = galleryDAO;
        this.typeDAO = typeDAO;
    }

    public void insertCard(GalleryCard card) {
        galleryDAO.insertCard(card);
    }

    public List<GalleryCardView> selectAllCards(SearchCriteria searchCriteria) {
        return galleryDAO.selectAllCards(searchCriteria);
    }

    public List<GalleryCardView> searchCards(SearchCriteria searchCriteria) {
        CategoryType galleryCardsSearch = typeDAO.selectByCode("GALLERY_CARDS_SEARCH", searchCriteria.getSearchCode());
        CategoryType galleryCardsSort = typeDAO.selectByCode("GALLERY_CARDS_SORT", searchCriteria.getSortCode());
        searchCriteria.setSearchKeyword(galleryCardsSearch.getKeyword());
        searchCriteria.setSortKeyword(galleryCardsSort.getKeyword());
        searchCriteria.setSortVal(galleryCardsSort.getVal());
        System.out.println("searchCriteria = " + searchCriteria);
        return galleryDAO.selectAllCards(searchCriteria);
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

    public List<List<CategoryType>> getConditions() {
        List<List<CategoryType>> result = new ArrayList<>();
        result.add(typeDAO.selectByCategoryType());
        result.add(typeDAO.selectByGallery_Cards_Search());
        result.add(typeDAO.selectByGallery_Cards_Sort());
        return result;
    }
}
