package kh.final_project.controllers;

import kh.final_project.dto.CategoryType;
import kh.final_project.dto.GalleryCard;
import kh.final_project.services.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

    private GalleryService galleryService;

    @Autowired
    public GalleryController(GalleryService galleryService) {
        this.galleryService = galleryService;
    }

    @GetMapping
    public String toGallery() {
        return "/gallery/gallery";
    }

    @GetMapping("/card/{cardSeq}")
    public String toCard(@PathVariable String cardSeq, Model model) {
        return "/gallery/card";
    }

    @PostMapping("/card/insert")
    public String insertCard(GalleryCard card, Model model) {
        int result = galleryService.insertCard(card);
        return "redirect:/gallery";
    }

    @GetMapping("/card/insert/{categoryType}")
    public String toCardInsert(@ModelAttribute("categoryType") @PathVariable String categoryType) {
        return "/gallery/cardinsert";
    }
}
