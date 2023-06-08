package kh.final_project.controllers;

import kh.final_project.dto.GalleryCard;
import kh.final_project.dto.GalleryContent;
import kh.final_project.dto.GalleryCardView;
import kh.final_project.services.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

    private GalleryService galleryService;

    @Autowired
    public GalleryController(GalleryService galleryService) {
        this.galleryService = galleryService;
    }

    @GetMapping
    public String toGallery(Model model) {
        List<GalleryCardView> cards = galleryService.selectAllCards();
        model.addAttribute("cards", cards);
        return "/gallery/gallery";
    }

    @GetMapping("/card/{cardSeq}")
    public String toCard(@PathVariable Integer cardSeq, Model model) {
        GalleryCardView card = galleryService.selectOneCard(cardSeq);
        List<GalleryContent> contents = galleryService.selectAllContents(cardSeq);
        model.addAttribute("card", card);
        model.addAttribute("contents", contents);
        return "/gallery/card";
    }

    @GetMapping("/card/{cardSeq}/contents/{contentSeq}")
    public String toContent(@PathVariable Integer cardSeq, @PathVariable Integer contentSeq, Model model) {
        GalleryContent content = galleryService.selectOneContent(cardSeq, contentSeq);
        model.addAttribute("content", content);
        return "/gallery/cardcontents";
    }

    @GetMapping("/card/{cardSeq}/insert/{categoryType}")
    public String toContentInsert(@ModelAttribute("categoryType") @PathVariable Integer categoryType, @ModelAttribute("cardSeq") @PathVariable Integer cardSeq) {
        return "/gallery/cardcontentinsert";
    }

    @PostMapping("/card/{cardSeq}/contents")
    public String insertContent(GalleryContent content, @PathVariable Integer cardSeq) {
        System.out.println("content = " + content);
        return "redirect:/gallery/card/{cardSeq}";
    }

    @GetMapping("/card/insert/{categoryType}")
    public String toCardInsert(@ModelAttribute("categoryType") @PathVariable String categoryType) {
        return "/gallery/cardinsert";
    }

    @PostMapping("/card/insert")
    public String insertCard(GalleryCard card) {
        card.setWriter(10000001);
        System.out.println("card = " + card);
        galleryService.insertCard(card);
        return "redirect:/gallery";
    }
}
