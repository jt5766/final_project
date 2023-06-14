package kh.final_project.controllers;

import kh.final_project.dto.*;
import kh.final_project.services.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

    private final GalleryService galleryService;
    private final HttpServletRequest request;
    private final HttpSession session;

    @Autowired
    public GalleryController(GalleryService galleryService, HttpServletRequest request, HttpSession session) {
        this.galleryService = galleryService;
        this.request = request;
        this.session = session;
    }

    @GetMapping
    public String toGallery(Model model, SearchCriteria searchCriteria) {
        List<GalleryCardView> cards = galleryService.selectAllCards(searchCriteria);
        setNavi(model, searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        return "/gallery/gallery";
    }

    @GetMapping("/search")
    public String searchCards(SearchCriteria searchCriteria, Model model) {
        List<GalleryCardView> cards = galleryService.searchCards(searchCriteria);
        setNavi(model, searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        return "gallery/gallery";
    }

    @GetMapping("/{cardSeq}")
    public String toCard(@PathVariable Long cardSeq, Model model) {
        GalleryCardView card = galleryService.selectOneCard(cardSeq);
        List<GalleryContent> contents = galleryService.selectAllContents(cardSeq);
        model.addAttribute("card", card);
        model.addAttribute("contents", contents);
        return "/gallery/card/view";
    }

    @GetMapping("/category/{categoryType}")
    public String filterCard(@ModelAttribute("categoryType") @PathVariable Integer categoryType, SearchCriteria searchCriteria, Model model) {
        searchCriteria.setTypeCode(categoryType);
        List<GalleryCardView> cards = galleryService.selectAllCards(searchCriteria);
        setNavi(model, searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        return "/gallery/gallery";
    }

    @GetMapping("/{cardSeq}/contents/{contentSeq}")
    public String toContent(@ModelAttribute("cardSeq") @PathVariable Long cardSeq, @PathVariable Long contentSeq, Model model) {
        GalleryContent content = galleryService.selectOneContent(cardSeq, contentSeq);
        model.addAttribute("content", content);
        return "/gallery/contents/view";
    }

    @GetMapping("/insert/{categoryType}")
    public String toCardInsert(@ModelAttribute("categoryType") @PathVariable Integer categoryType) {
        return "/gallery/card/insert";
    }

    @GetMapping("/{cardSeq}/contents/insert/{categoryType}")
    public String toContentInsert(@ModelAttribute("categoryType") @PathVariable Integer categoryType, @ModelAttribute("cardSeq") @PathVariable Long cardSeq) {
        return "gallery/contents/insert";
    }

    @GetMapping("/{cardSeq}/modify")
    public String toCardModify(@PathVariable Long cardSeq, Model model) {
        GalleryCardView card = galleryService.selectOneCard(cardSeq);
        model.addAttribute("card", card);
        return "/gallery/card/modify";
    }

    @GetMapping("/{cardSeq}/contents/{contentSeq}/modify")
    public String toContentModify(@PathVariable Long cardSeq, @PathVariable Long contentSeq, Model model) {
        GalleryContent content = galleryService.selectOneContent(cardSeq, contentSeq);
        model.addAttribute("content", content);
        return "/gallery/contents/modify";
    }

    @PostMapping("/insert")
    public String insertCard(GalleryCard card, @RequestPart(value = "thumbnail_image", required = false) MultipartFile multipartFile) throws IOException {
        if (card.getWriter() == null) {
            card.setWriter(10000001);
        // 접속중인 아이디가 없을 경우 기본 아이디 추가 (이후 삭제 예정)
        }
        String realPath = session.getServletContext().getRealPath("upload");
        galleryService.insertCard(card, multipartFile, realPath);
        // TODO: 파일 업로드 및 출력 성공, 서버 종료 시 파일 사라지는 문제 해결해야함
        return "redirect:/gallery";
    }

    @PostMapping("/{cardSeq}/contents")
    public String insertContent(GalleryContent content, @PathVariable Long cardSeq) {
        galleryService.insertContent(content);
        return "redirect:/gallery/{cardSeq}";
    }

    @PostMapping("/{cardSeq}/modify")
    public String modifyCard(GalleryCard card, @PathVariable Long cardSeq) {
        galleryService.updateCard(card);
        return "redirect:/gallery/{cardSeq}";
    }

    @PostMapping("/{cardSeq}/contents/{contentSeq}/modify")
    public String modifyContent(GalleryContent content, @PathVariable Long cardSeq, @PathVariable Long contentSeq) {
        galleryService.updateContent(content);
        return "redirect:/gallery/{cardSeq}/contents/{contentSeq}";
    }

    @PostMapping("/{cardSeq}/delete")
    public String deleteCard(@PathVariable Long cardSeq) {
        galleryService.deleteCard(cardSeq);
        return "redirect:/gallery";
    }

    @PostMapping("/{cardSeq}/contents/{contentSeq}/delete")
    public String deleteContents(@PathVariable Long cardSeq, @PathVariable Long contentSeq) {
        galleryService.deleteContent(cardSeq, contentSeq);
        return "redirect:/gallery/{cardSeq}";
    }

    private void setConditions(Model model) {
        List<List<CategoryType>> result = galleryService.getConditions();
        model.addAttribute("categoryTypes", result.get(0));
        model.addAttribute("searchConditions", result.get(1));
        model.addAttribute("sortConditions", result.get(2));
        model.addAttribute("requestURI", request.getRequestURI());
    }

    private void setNavi(Model model, SearchCriteria searchCriteria) {
        List<String> navi = galleryService.getPageNavi(searchCriteria);
        model.addAttribute("navi", navi);
    }
}
