package kh.final_project.controllers;

import kh.final_project.dto.*;
import kh.final_project.services.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

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

    @GetMapping("/category/{categoryType}")
    public String toGallery(@ModelAttribute("categoryType") @PathVariable Integer categoryType, SearchCriteria searchCriteria, Model model) {
        searchCriteria.setTypeCode(categoryType);
        List<GalleryCardView> cards = galleryService.selectAllCards(searchCriteria);
        setNaviOfCards(model, searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        model.addAttribute("page", searchCriteria.getPage());
        return "/gallery/gallery";
    }

    @GetMapping("/search")
    public String searchCards(SearchCriteria searchCriteria, Model model) {
        List<GalleryCardView> cards = galleryService.searchCards(searchCriteria);
        setNaviOfCards(model, searchCriteria);
        setConditions(model);
        model.addAttribute("cards", cards);
        model.addAttribute("categoryType", searchCriteria.getTypeCode());
        model.addAttribute("page", searchCriteria.getPage());
        return "gallery/gallery";
    }

    @GetMapping("/{cardSeq}")
    public String toCard(@PathVariable Long cardSeq, GalleryCardDTO galleryCardDTO, Model model) {
        Integer code = (Integer) session.getAttribute("code");
        if (code != null) {
            galleryCardDTO.setCode(code);
        }
        GalleryCardView card = galleryService.selectOneCard(cardSeq);
        List<GalleryContent> contents = galleryService.selectAllContents(galleryCardDTO);
        if (session.getAttribute("memberType") != null){
            if ((Integer) session.getAttribute("memberType") == 2000) {
                Integer myCode = (Integer) session.getAttribute("code");
                Integer menteeCode = card.getWriter();
                Boolean isDuple = galleryService.dupleInviteCheck(myCode, menteeCode);
                model.addAttribute("isDuple", isDuple);
                System.out.println("isDuple = " + isDuple);
            }
        }
        setNaviOfContents(model, galleryCardDTO);
        model.addAttribute("card", card);
        model.addAttribute("contents", contents);
        model.addAttribute("page", galleryCardDTO.getPage());
        return "/gallery/card/view";
    }

    @GetMapping("/{cardSeq}/contents/{contentSeq}")
    public String toContent(@ModelAttribute("cardSeq") @PathVariable Long cardSeq, @PathVariable Long contentSeq, Model model) {
        GalleryContent content = galleryService.selectOneContent(cardSeq, contentSeq);
        model.addAttribute("content", content);
        return "/gallery/contents/view";
    }

    @GetMapping("/insert/{categoryType}")
    public String toCardInsert(@ModelAttribute("categoryType") @PathVariable Integer categoryType, Model model) {
        setGenreTypes(model);
        return "/gallery/card/insert";
    }

    @GetMapping("/{cardSeq}/contents/insert/{categoryType}")
    public String toContentInsert(@ModelAttribute("categoryType") @PathVariable Integer categoryType, @ModelAttribute("cardSeq") @PathVariable Long cardSeq) {
        return "gallery/contents/insert";
    }

    @GetMapping("/{cardSeq}/modify/{categoryType}")
    public String toCardModify(@PathVariable Long cardSeq, @ModelAttribute("categoryType") @PathVariable Integer categoryType, Model model) {
        GalleryCardView card = galleryService.selectOneCard(cardSeq);
        model.addAttribute("card", card);
        setGenreTypes(model);
        return "/gallery/card/modify";
    }

    @GetMapping("/{cardSeq}/contents/{contentSeq}/modify/{categoryType}")
    public String toContentModify(@PathVariable Long cardSeq, @PathVariable Long contentSeq, @ModelAttribute("categoryType") @PathVariable Integer categoryType, Model model) {
        GalleryContent content = galleryService.selectOneContent(cardSeq, contentSeq);
        model.addAttribute("content", content);
        return "/gallery/contents/modify";
    }

    @PostMapping("/insert")
    public String insertCard(@ModelAttribute GalleryCard card, BindingResult bindingResult, @RequestPart(value = "thumbnail_image", required = false) MultipartFile multipartFile, Model model) throws IOException {
//        if (!StringUtils.hasText(card.getTitle())) {
//            bindingResult.addError(new FieldError("card", "title", "제목을 입력해주세요."));
//        }
//        if (card.getTitle().length() > 30) {
//            bindingResult.addError(new FieldError("card", "title", card.getTitle(), false, null, null, "제목은 30자를 넘을 수 없습니다."));
//        }
//        if (bindingResult.hasErrors()) {
//            model.addAttribute("bindingResult", bindingResult);
//            model.addAttribute("categoryType", card.getCategory_type());
//            return "/gallery/card/insert";
//        }
        // TODO: 서버 측 파라미터 2차 검증 로직
        String realPath = session.getServletContext().getRealPath("resources");
        galleryService.insertCard(card, multipartFile, realPath);
        return "redirect:/member/my-page/gallery";
    }

    @PostMapping("/{cardSeq}/contents")
    public String insertContent(GalleryContent content, @PathVariable Long cardSeq) {
        galleryService.insertContent(content);
        return "redirect:/gallery/{cardSeq}";
    }

    @PostMapping("/{cardSeq}/contents/withFile")
    public String insertContent(GalleryContent content, @PathVariable Long cardSeq, @RequestPart(value = "file_image", required = false) MultipartFile multipartFile) throws IOException {
        String realPath = session.getServletContext().getRealPath("resources");
        galleryService.insertContent(content, multipartFile, realPath);
        return "redirect:/gallery/{cardSeq}";
    }

    @PostMapping("/{cardSeq}/modify")
    public String modifyCard(GalleryCard card, @PathVariable Long cardSeq, @RequestPart(value = "thumbnail_image", required = false) MultipartFile multipartFile) throws IOException {
        if (!galleryService.selectOneCard(cardSeq).getThumbnail_url().equals(card.getThumbnail_url())) {
            String realPath = session.getServletContext().getRealPath("resources");
            galleryService.updateCard(card, multipartFile, realPath);
            return "redirect:/gallery/{cardSeq}";
        }
        galleryService.updateCard(card);
        return "redirect:/gallery/{cardSeq}";
    }

    @PostMapping("/{cardSeq}/contents/{contentSeq}/modify")
    public String modifyContent(GalleryContent content, @PathVariable Long cardSeq, @PathVariable Long contentSeq) {
        galleryService.updateContent(content);
        return "redirect:/gallery/{cardSeq}/contents/{contentSeq}";
    }

    @PostMapping("/{cardSeq}/contents/{contentSeq}/modify/withFile")
    public String modifyContent(GalleryContent content, @PathVariable Long cardSeq, @PathVariable Long contentSeq, @RequestPart(value = "file_image", required = false) MultipartFile multipartFile) throws IOException {
        if (!galleryService.selectOneContent(cardSeq, contentSeq).getFile_url().equals(content.getFile_url())) {
            String realPath = session.getServletContext().getRealPath("resources");
            galleryService.updateContent(content, multipartFile, realPath);
            return "redirect:/gallery/{cardSeq}/contents/{contentSeq}";
        }
        galleryService.updateContent(content);
        return "redirect:/gallery/{cardSeq}/contents/{contentSeq}";
    }

    @PostMapping("/{cardSeq}/delete")
    public String deleteCard(@PathVariable Long cardSeq) {
        String realPath = session.getServletContext().getRealPath("resources");
        galleryService.deleteCard(cardSeq, realPath);
        return "redirect:/gallery";
    }

    @PostMapping("/{cardSeq}/contents/{contentSeq}/delete")
    public String deleteContents(@PathVariable Long cardSeq, @PathVariable Long contentSeq) {
        String realPath = session.getServletContext().getRealPath("resources");
        galleryService.deleteContent(cardSeq, contentSeq, realPath);
        return "redirect:/gallery/{cardSeq}";
    }

    @PutMapping(value = "/disclosure/{cardSeq}")
    @ResponseBody
    public void updateDisclosure(@PathVariable Long cardSeq, @RequestBody String value) {
        galleryService.updateCardDisclosure(cardSeq, value);
    }

    @PutMapping(value = "/disclosure/{cardSeq}/contents/{contentSeq}")
    @ResponseBody
    public void updateDisclosure(@PathVariable Long cardSeq, @PathVariable Long contentSeq, @RequestBody String value) {
        galleryService.updateContentDisclosure(contentSeq, value);
    }

    @GetMapping(value = "/myPage", produces = "application/json", consumes = "text/plain")
    @ResponseBody
    public Map<String, Object> getMyCards() {
        List<GalleryCardView> myCard = galleryService.selectMyCards((Integer) session.getAttribute("code"));
        List<GalleryCardView> cards1001 = myCard.stream().filter(e -> e.getCategory_type() == 1001).collect(Collectors.toList());
        List<GalleryCardView> cards1002 = myCard.stream().filter(e -> e.getCategory_type() == 1002).collect(Collectors.toList());
        List<GalleryCardView> cards1003 = myCard.stream().filter(e -> e.getCategory_type() == 1003).collect(Collectors.toList());
        List<GalleryCardView> cards1004 = myCard.stream().filter(e -> e.getCategory_type() == 1004).collect(Collectors.toList());
        List<GalleryCardView> cards1005 = myCard.stream().filter(e -> e.getCategory_type() == 1005).collect(Collectors.toList());
        List<GalleryCardView> cards1006 = myCard.stream().filter(e -> e.getCategory_type() == 1006).collect(Collectors.toList());
        return Map.ofEntries(
                Map.entry("1001", cards1001),
                Map.entry("1002", cards1002),
                Map.entry("1003", cards1003),
                Map.entry("1004", cards1004),
                Map.entry("1005", cards1005),
                Map.entry("1006", cards1006),
                Map.entry("9999", "gallery")
        );
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
        model.addAttribute("queryString", queryString);
    }

    private void setGenreTypes(Model model) {
        List<CategoryType> genreTypes = galleryService.getGenreTypes();
        model.addAttribute("genreTypes", genreTypes);
    }

    private void setNaviOfCards(Model model, SearchCriteria searchCriteria) {
        List<String> navi = galleryService.getPageNaviOfCards(searchCriteria);
        model.addAttribute("navi", navi);
    }

    private void setNaviOfContents(Model model, GalleryCardDTO galleryCardDTO) {
        List<String> navi = galleryService.getPageNaviOfContents(galleryCardDTO);
        model.addAttribute("navi", navi);
    }
}
