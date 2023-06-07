package kh.final_project.controllers;

import kh.final_project.dto.CategoryType;
import kh.final_project.dto.GalleryCard;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

    @GetMapping
    public String toGallery() {
        return "/gallery/gallery";
    }

    @GetMapping("/card/{cardSeq}")
    public String toCard(@PathVariable String cardSeq, Model model) {
        return "/gallery/card";
    }

    @PostMapping("/card")
    public String insertCard(GalleryCard card, Model model) {
        System.out.println("card = " + card);
        return "redirect:/gallery";
    }

    @GetMapping("/card/insert/{categoryType}")
    public String toCardInsert(@ModelAttribute("categoryType") @PathVariable String categoryType) {
        return "/gallery/cardinsert";
    }
}
