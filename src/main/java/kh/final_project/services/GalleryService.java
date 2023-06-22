package kh.final_project.services;

import kh.final_project.dto.*;
import kh.final_project.repositories.GalleryDAO;
import kh.final_project.repositories.TypeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class GalleryService {

    private final GalleryDAO galleryDAO;
    private final TypeDAO typeDAO;
    private final Integer cardsPerPage = 4;
    private final Integer contentsPerPage = 10;
    private final Integer naviPerPage = 10;

    @Autowired
    public GalleryService(GalleryDAO galleryDAO, TypeDAO typeDAO) {
        this.galleryDAO = galleryDAO;
        this.typeDAO = typeDAO;
    }

    public void insertCard(GalleryCard card, MultipartFile multipartFile, String realPath) throws IOException {
        card.setThumbnail_url(
                new StringBuilder()
                        .append("/gallery/card/thumbnails/")
                        .append(UUID.randomUUID())
                        .append("_")
                        .append(card.getThumbnail_url())
                        .toString()
        );
        transferFile(realPath + card.getThumbnail_url(), multipartFile);
        galleryDAO.insertCard(card);
    }

    public List<GalleryCardView> selectAllCards(SearchCriteria searchCriteria) {
        setRangeOfCards(searchCriteria);
        return galleryDAO.selectAllCards(searchCriteria);
    }

    public List<GalleryCardView> searchCards(SearchCriteria searchCriteria) {
        CategoryType galleryCardsSearch = typeDAO.selectByCode("GALLERY_CARDS_SEARCH", searchCriteria.getSearchCode());
        CategoryType galleryCardsSort = typeDAO.selectByCode("GALLERY_CARDS_SORT", searchCriteria.getSortCode());
        searchCriteria.setSearchKeyword(galleryCardsSearch.getKeyword());
        searchCriteria.setSortKeyword(galleryCardsSort.getKeyword());
        searchCriteria.setSortVal(galleryCardsSort.getVal());
        setRangeOfCards(searchCriteria);
        return galleryDAO.selectAllCards(searchCriteria);
    }

    public GalleryCardView selectOneCard(Long cardSeq) {
        return galleryDAO.selectOneCard(cardSeq);
    }

    public GalleryContent selectOneContent(Long cardSeq, Long contentSeq) {
        galleryDAO.updateViewCount(contentSeq);
        return galleryDAO.selectOneContent(cardSeq, contentSeq);
    }

    public List<GalleryContent> selectAllContents(GalleryCardDTO galleryCardDTO) {
        setRangeOfContents(galleryCardDTO);
        return galleryDAO.selectAllContents(galleryCardDTO);
    }


    public void insertContent(GalleryContent content) {
        galleryDAO.insertContent(content);
    }

    public void insertContent(GalleryContent content, MultipartFile multipartFile, String realPath) throws IOException {
        content.setFile_url(
                new StringBuilder()
                        .append("/gallery/content/files/")
                        .append(UUID.randomUUID())
                        .append("_")
                        .append(content.getFile_url())
                        .toString()
        );
        transferFile(realPath + content.getFile_url(), multipartFile);
        galleryDAO.insertContent(content);
    }

    public void updateCard(GalleryCard card, MultipartFile multipartFile, String realPath) throws IOException {
        card.setThumbnail_url(
                new StringBuilder()
                        .append("/gallery/card/thumbnails/")
                        .append(UUID.randomUUID())
                        .append("_")
                        .append(card.getThumbnail_url())
                        .toString()
        );
        transferFile(realPath + card.getThumbnail_url(), multipartFile);
        galleryDAO.updateCard(card);
    }

    public void updateContent(GalleryContent content) {
        galleryDAO.updateContent(content);
    }

    public void updateContent(GalleryContent content, MultipartFile multipartFile, String realPath) throws IOException {
        content.setFile_url(
                new StringBuilder()
                        .append("/gallery/content/files/")
                        .append(UUID.randomUUID())
                        .append("_")
                        .append(content.getFile_url())
                        .toString()
        );
        transferFile(realPath + content.getFile_url(), multipartFile);
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

    public List<String> getPageNaviOfCards(SearchCriteria searchCriteria) {
        Integer currentPage = searchCriteria.getPage();
        Integer totalCount = galleryDAO.getTotalCards(searchCriteria);
        return getNaviList(currentPage, totalCount, cardsPerPage);
    }

    public List<String> getPageNaviOfContents(GalleryCardDTO galleryCardDTO) {
        Integer currentPage = galleryCardDTO.getPage();
        Integer totalCount = galleryDAO.getTotalContents(galleryCardDTO);
        return getNaviList(currentPage, totalCount, contentsPerPage);
    }

    private List<String> getNaviList(Integer currentPage, Integer totalCount, Integer typePerPage) {
        Integer totalPage;
        if (totalCount % typePerPage > 0) {
            totalPage = totalCount / typePerPage + 1;
        } else {
            totalPage = totalCount / typePerPage;
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
        boolean needPrev = currentPage > naviPerPage;
        boolean needNext = endNavi < totalPage;
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

    private void setRangeOfCards(SearchCriteria searchCriteria) {
        searchCriteria.setStart((searchCriteria.getPage() * cardsPerPage) - (cardsPerPage - 1));
        searchCriteria.setEnd((searchCriteria.getPage() * cardsPerPage));
    }

    private void setRangeOfContents(GalleryCardDTO galleryCardDTO) {
        galleryCardDTO.setStart((galleryCardDTO.getPage() * contentsPerPage) - (contentsPerPage - 1));
        galleryCardDTO.setEnd((galleryCardDTO.getPage() * contentsPerPage));
    }

    private void transferFile(String fileName, MultipartFile multipartFile) throws IOException {
        if (!multipartFile.isEmpty()) {
            File file = new File(fileName);
            if (!file.exists()) {
                file.mkdirs();
            }
            multipartFile.transferTo(file);
        }
    }

    public void updateCardDisclosure(Long cardSeq, String value) {
        galleryDAO.updateCardDisclosure(cardSeq, value);
    }

    public void updateContentDisclosure(Long contentSeq, String value) {
        galleryDAO.updateContentDisclosure(contentSeq, value);
    }
}
