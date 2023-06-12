package kh.final_project.controllers;

import kh.final_project.dto.*;
import kh.final_project.services.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
        GallerySort gallerySort = new GallerySort();
        List<GalleryCardView> cards = galleryService.selectAllCards(gallerySort);
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
        GallerySort gallerySort = new GallerySort(categoryType, null);
        List<GalleryCardView> cards = galleryService.selectAllCards(gallerySort);
        model.addAttribute("cards", cards);
        return "/gallery/gallery";
    }

    @PostMapping("/sort/{sortType}")
    public String sortCard(@PathVariable String sortType, Model model) {
        GallerySort gallerySort = new GallerySort(null, sortType);
        List<GalleryCardView> cards = galleryService.selectAllCards(gallerySort);
        model.addAttribute("cards", cards);
        return "gallery/gallery";
    }

    @PostMapping("/category/{categoryType}/sort/{sortType}")
    public String sortCardWithCategory(@ModelAttribute("categoryType") @PathVariable Integer categoryType, @PathVariable String sortType, Model model) {
        GallerySort gallerySort = new GallerySort(categoryType, sortType);
        List<GalleryCardView> cards = galleryService.selectAllCards(gallerySort);
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
}
