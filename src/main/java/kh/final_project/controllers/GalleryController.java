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
        return "/gallery/card/view";
    }

    @GetMapping("/card/{cardSeq}/contents/{contentSeq}")
    public String toContent(@PathVariable Integer cardSeq, @PathVariable Integer contentSeq, Model model) {
        GalleryContent content = galleryService.selectOneContent(cardSeq, contentSeq);
        model.addAttribute("content", content);
        System.out.println("content = " + content);
        return "/gallery/contents/view";
    }

    @GetMapping("/card/insert/{categoryType}")
    public String toCardInsert(@ModelAttribute("categoryType") @PathVariable String categoryType) {
        return "/gallery/card/insert";
    }

    @GetMapping("/card/{cardSeq}/contents/insert/{categoryType}")
    public String toContentInsert(@ModelAttribute("categoryType") @PathVariable Integer categoryType, @ModelAttribute("cardSeq") @PathVariable Integer cardSeq) {
        return "gallery/contents/insert";
    }

    @GetMapping("/card/{cardSeq}/modify")
    public String toCardModify(@PathVariable Integer cardSeq, Model model) {
        GalleryCardView card = galleryService.selectOneCard(cardSeq);
        model.addAttribute("card", card);
        return "/gallery/card/modify";
    }

    @GetMapping("/card/{cardSeq}/contents/{contentSeq}/modify")
    public String toContentModify(@PathVariable Integer cardSeq, @PathVariable Integer contentSeq, Model model) {
        GalleryContent content = galleryService.selectOneContent(cardSeq, contentSeq);
        model.addAttribute("content", content);
        return "/gallery/contents/modify";
    }

    @PostMapping("/card/insert")
    public String insertCard(GalleryCard card) {
        card.setWriter(10000001);
        System.out.println("card = " + card);
        galleryService.insertCard(card);
        return "redirect:/gallery";
    }

    @PostMapping("/card/{cardSeq}/contents")
    public String insertContent(GalleryContent content, @PathVariable Integer cardSeq) {
        System.out.println("content = " + content);
        galleryService.insertContent(content);
        return "redirect:/gallery/card/{cardSeq}";
    }

    @PostMapping("/card/{cardSeq}/modify")
    public String modifyCard(GalleryCard card) {
        System.out.println("card = " + card);
        galleryService.updateCard(card);
        return "redirect:/gallery/card/{cardSeq}";
    }

    @PostMapping("/card/{cardSeq}/contents/{contentSeq}/modify")
    public String modifyContent(GalleryContent content, @PathVariable Integer cardSeq, @PathVariable Integer contentSeq) {
        System.out.println("content = " + content);
        galleryService.updateContent(content);
        return "redirect:/gallery/card/{cardSeq}/contents/{contentSeq}";
    }
}
