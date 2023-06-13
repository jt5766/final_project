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
    private final Integer postPerPage = 1;
    private final Integer naviPerPage = 10;

    @Autowired
    public GalleryService(GalleryDAO galleryDAO, TypeDAO typeDAO) {
        this.galleryDAO = galleryDAO;
        this.typeDAO = typeDAO;
    }

    public void insertCard(GalleryCard card) {
        galleryDAO.insertCard(card);
    }

    public List<GalleryCardView> selectAllCards(SearchCriteria searchCriteria) {
        setRange(searchCriteria);
        return galleryDAO.selectAllCards(searchCriteria);
    }

    public List<GalleryCardView> searchCards(SearchCriteria searchCriteria) {
        CategoryType galleryCardsSearch = typeDAO.selectByCode("GALLERY_CARDS_SEARCH", searchCriteria.getSearchCode());
        CategoryType galleryCardsSort = typeDAO.selectByCode("GALLERY_CARDS_SORT", searchCriteria.getSortCode());
        searchCriteria.setSearchKeyword(galleryCardsSearch.getKeyword());
        searchCriteria.setSortKeyword(galleryCardsSort.getKeyword());
        searchCriteria.setSortVal(galleryCardsSort.getVal());
        setRange(searchCriteria);
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

    public List<String> getPageNavi(SearchCriteria searchCriteria) {
        Integer currentPage = searchCriteria.getPage();
        Integer totalCount = galleryDAO.getTotalCards(searchCriteria);
        Integer totalPage;
        if (totalCount % postPerPage > 0) {
            totalPage = totalCount / postPerPage + 1;
        } else {
            totalPage = totalCount / postPerPage;
        }
        Integer startNavi = (currentPage - 1) / naviPerPage * naviPerPage + 1;
        Integer endNavi = startNavi + (naviPerPage - 1);
        if (currentPage < 1) {
            currentPage = 1;
        } else if (currentPage > totalPage) {
            currentPage = totalPage;
        }
        if (endNavi > totalPage) {
            endNavi = totalPage;
        }
        boolean needPrev = false;
        if (currentPage > naviPerPage) {
            needPrev = true;
        }
        boolean needNext = false;
        if (endNavi < totalPage) {
            needNext = true;
        }
        List<String> pageNavi = new ArrayList<>();
        if (needPrev) {
            pageNavi.add("Prev");
        }
        for (Integer i = startNavi; i <= endNavi; i++) {
            pageNavi.add(String.valueOf(i));
        }
        if (needNext) {
            pageNavi.add("Next");
        }
        return pageNavi;
    }
    private void setRange(SearchCriteria searchCriteria) {
        searchCriteria.setStart((searchCriteria.getPage() * postPerPage) - (postPerPage - 1));
        searchCriteria.setEnd((searchCriteria.getPage() * postPerPage));
    }
}
