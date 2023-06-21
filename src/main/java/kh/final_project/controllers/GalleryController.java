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
import java.util.Optional;

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
        searchCriteria.setWriter((Integer)session.getAttribute("code"));
        List<GalleryCardView> cards = galleryService.selectAllCards(searchCriteria);
        setNavi(model, searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        return "/gallery/gallery";
    }

    @GetMapping("/search")
    public String searchCards(SearchCriteria searchCriteria, Model model) {
        searchCriteria.setWriter((Integer)session.getAttribute("code"));
        List<GalleryCardView> cards = galleryService.searchCards(searchCriteria);
        setNavi(model, searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        model.addAttribute("categoryType", searchCriteria.getTypeCode());
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
        searchCriteria.setWriter((Integer)session.getAttribute("code"));
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
        String realPath = session.getServletContext().getRealPath("resources");
        galleryService.insertCard(card, multipartFile, realPath);
        return "redirect:/gallery";
    }

    @PostMapping("/{cardSeq}/contents")
    public String insertContent(GalleryContent content, @PathVariable Long cardSeq, @RequestPart(value = "file_image", required = false) MultipartFile multipartFile) throws IOException {
        String realPath = session.getServletContext().getRealPath("resources");
        galleryService.insertContent(content, multipartFile, realPath);
        return "redirect:/gallery/{cardSeq}";
    }

    public HttpServletRequest getRequest() {
        return request;
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

    @PutMapping(value = "/disclosure/{cardSeq}")
    @ResponseBody
    public void updateDisclosure(@PathVariable Long cardSeq, @RequestBody String value) {
        galleryService.updateCardDisclosure(cardSeq, value);
    }

    private void setConditions(Model model) {
        List<List<CategoryType>> result = galleryService.getConditions();
        model.addAttribute("categoryTypes", result.get(0));
        model.addAttribute("searchConditions", result.get(1));
        model.addAttribute("sortConditions", result.get(2));
        model.addAttribute("requestURI", request.getRequestURI());
        String queryString = Optional.ofNullable(request.getQueryString())
                .map(e -> e.replaceAll("&?page=?[0-9]*", ""))
                .orElse("");
        System.out.println("queryString = " + queryString);
        model.addAttribute("queryString", queryString);
    }

    private void setNavi(Model model, SearchCriteria searchCriteria) {
        List<String> navi = galleryService.getPageNavi(searchCriteria);
        model.addAttribute("navi", navi);
    }
}
