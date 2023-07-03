package kh.final_project.controllers;

import kh.final_project.dto.EmailTypeDTO;
import kh.final_project.dto.MemberDTO;
import kh.final_project.listener.SessionListener;
import kh.final_project.services.EmailcheckService;
import kh.final_project.services.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member/")
public class MemberController {

    @Autowired
    private EmailcheckService emailcheckService;

    @Autowired
    private HttpSession session;

    @Autowired
    private MemberService memberService;

    @RequestMapping("signup")
    public String signup(Model model) {

        List<EmailTypeDTO> emailType = memberService.emailType();
        model.addAttribute("list", emailType);
        return "member/emailCheckForm";
    }

    @RequestMapping("check")
    public String check(MemberDTO dto, Model model) throws Exception {

        String emailName = memberService.getEmailName(dto);
        dto.setSet_email_type(emailName);
        memberService.sendJoinCertificationMail(dto); // 인증메일 보내기
        return "/member/loginForm";

    }

    @RequestMapping("mailDupCheck")
    @ResponseBody
    public String mailDupCheck(MemberDTO dto) {
        boolean result = memberService.duplicationEmail(dto);
        return String.valueOf(result);
    }

    @RequestMapping("register")
    public String register(Model model, MemberDTO dto) {

        boolean result = emailcheckService.checkingEmail(dto);
        if (result) {
            String emailName = memberService.getEmailName(dto);
            dto.setSet_email_type(emailName);
            model.addAttribute("email", dto.getEmail());
            model.addAttribute("emailType", dto.getEmail_type());
            model.addAttribute("setEmailType", dto.getSet_email_type());
            model.addAttribute("memberType", dto.getMember_type());
            if (dto.getMember_type() == 2000) {

                return "/member/expertRegisterForm";
            }

            return "/member/registerForm";
        } else {
            return "redirect:/error";
        }
    }

    @PostMapping("createMember") /* 회원가입할시 오는 곳 인서트 후 로그인폼으로 */
    public String createMember(MemberDTO dto, MultipartFile file, Model model) throws Exception {
        String realPath = session.getServletContext().getRealPath("/resources/member");
        int result = memberService.insertMember(dto, file, realPath);
        model.addAttribute("result", result);
        return "forward:/member/loginForm";
    }

    @RequestMapping("loginForm")
    public String loginForm() {
        return "/member/loginForm";
    }

    @ResponseBody
    @RequestMapping("login")
    public String login(MemberDTO dto) {


        memberService.emailTypeChange(dto);
        memberService.login(dto);


        if (dto.getCode() > 10000000 && dto.getCode() < 100000000) {

            memberService.loginYupdate(dto);
            session.setAttribute("code", dto.getCode());
            session.setAttribute("nickName", dto.getNickname());
            session.setAttribute("memberType", dto.getMember_type());
        }

        return String.valueOf(dto.getCode());
    }

    @RequestMapping("logOut")
    public String logOut() {

        SessionListener.logout(session);

        return "redirect:/";
    }

    @RequestMapping("findPassword")
    public String findPassword() {

        return "member/findPasswordForm";
    }

    @RequestMapping("tofindPassword")
    public String tofindPassword(MemberDTO dto, Model model) {
        String result = memberService.getEmailName(dto);

        dto.setSet_email_type(result);
        model.addAttribute("email", dto.getEmail());
        model.addAttribute("email_type", dto.getEmail_type());
        model.addAttribute("set_email_type", dto.getSet_email_type());

        return "member/findPasswordForm";
    }

    @RequestMapping("passwordChange")
    public String passwordChange(MemberDTO dto, Model model) throws Exception {

        boolean result = memberService.findPassword(dto);
        if (result) {
            model.addAttribute("duplEmail", result);
            return "/member/loginForm";
        } else {
            model.addAttribute("duplEmail", result);
            return "/member/findPasswordForm";
        }
    }

    @RequestMapping("updatePassword")
    public String updatePassword(MemberDTO dto) {

        memberService.updatePassword(dto);
        Integer code = (Integer) session.getAttribute("code");
        memberService.logOut(code);
        session.invalidate();
        return "redirect:/member/loginForm";
    }


    @RequestMapping("myinfo")
    public String myinfo(Model model) {
        MemberDTO dto = memberService.selectDTO((int) session.getAttribute("code"));
        String SetEmailType = memberService.getEmailName(dto);
        model.addAttribute("email", dto.getEmail());
        model.addAttribute("email_type", dto.getEmail_type());
        model.addAttribute("set_email_type", SetEmailType);
        return "/member/myInfoUpdateForm";
    }

    @RequestMapping("passwordCheck")
    @ResponseBody

    public String passwordCheck(MemberDTO dto) {
        boolean result = memberService.passwordCheck(dto);
        return String.valueOf(result);
    }

    @RequestMapping("update")
    public String update(MemberDTO dto) {
        Integer code = (Integer) session.getAttribute("code");
        dto.setCode(code);
        memberService.update(dto);
        String nickname = dto.getNickname();
        session.setAttribute("nickName", nickname);

        return "redirect:/member/my-page/gallery";
    }

    @RequestMapping("memberDelete")
    public String memberDelete(int code, Model model) {

        int result = memberService.memeberDelete(code);
        model.addAttribute(result);
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "nickname/duplicate-check", method = RequestMethod.POST)
    @ResponseBody
    public int nicknameDuplicateCheck(String nickname) {
        int i = memberService.nicknameDuplicateCheck(nickname);
        return i;
    }
}
