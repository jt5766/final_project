package kh.final_project.controllers;

import kh.final_project.dto.*;
import kh.final_project.services.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

    private final GalleryService galleryService;

    @Autowired
    public GalleryController(GalleryService galleryService) {
        this.galleryService = galleryService;
    }

    @GetMapping
    public String toGallery(Model model) {
        SearchCriteria searchCriteria = new SearchCriteria();
        List<GalleryCardView> cards = galleryService.selectAllCards(searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        return "/gallery/gallery";
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
    public String filterCard(@ModelAttribute("categoryType") @PathVariable Integer categoryType, Model model) {
        SearchCriteria searchCriteria = new SearchCriteria("", categoryType, null, null, null);
        List<GalleryCardView> cards = galleryService.selectAllCards(searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        return "/gallery/gallery";
    }

    @PostMapping("/sort/{sortCode}")
    public String sortCard(@PathVariable Integer sortCode, Model model) {
        SearchCriteria gallerySort = new SearchCriteria("", null, sortCode, null, null);
        List<GalleryCardView> cards = galleryService.selectAllCards(gallerySort);
        setConditions(model);
        model.addAttribute("cards", cards);
        return "gallery/gallery";
    }

    @PostMapping("/category/{categoryType}/sort/{sortCode}")
    public String sortCardWithCategory(@ModelAttribute("categoryType") @PathVariable Integer categoryType, @PathVariable Integer sortCode, Model model) {
        SearchCriteria searchCriteria = new SearchCriteria("", categoryType, sortCode, null, null);
        List<GalleryCardView> cards = galleryService.selectAllCards(searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        return "gallery/gallery";
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
    public String insertCard(GalleryCard card) {
        card.setWriter(10000001);
        galleryService.insertCard(card);
        return "redirect:/gallery";
    }

    @PostMapping("/{cardSeq}/contents")
    public String insertContent(GalleryContent content, @PathVariable Long cardSeq) {
        System.out.println("content = " + content);
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

    @GetMapping("/search")
    public String searchCards(SearchCriteria searchCriteria, Model model) {
        System.out.println("searchCriteria = " + searchCriteria);
        List<GalleryCardView> cards = galleryService.searchCards(searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        return "gallery/gallery";
    }

    private void setConditions(Model model) {
        List<List<CategoryType>> result = galleryService.getConditions();
        model.addAttribute("categoryTypes", result.get(0));
        model.addAttribute("searchConditions", result.get(1));
        model.addAttribute("sortConditions", result.get(2));
    }
}
