package kh.final_project.controllers;


import kh.final_project.dto.EmailTypeDTO;
import kh.final_project.dto.MemberDTO;
import kh.final_project.repositories.MemberDAO;
import kh.final_project.services.EmailcheckService;
import kh.final_project.services.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/member/")
public class MemberController {

    @Autowired
    private EmailcheckService emailcheckService;

    @Autowired
    private HttpSession session;

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberDAO mdao;
    @RequestMapping("signup")
    public String signup(Model model){

    List<EmailTypeDTO> emailType =memberService.emailType();
    model.addAttribute("list",emailType);
        return "member/emailCheckForm";
    }

    @RequestMapping("check")  /* 최초 이메일 인증시 이메일 입력후 오는 곳*/
    public String check(MemberDTO dto , Model model)throws  Exception{
        String emailName = memberService.getEmailName(dto);
        dto.setSet_email_type(emailName);
        memberService.sendJoinCertificationMail(dto); //인증메일 보내기
        return "home";
    }
    @RequestMapping("register")
    public String register(Model model , MemberDTO dto) {
        System.out.println("register로 넘어온 dto :"+dto);
        System.out.println("==========================");
        //따로 저장된 멤버 타입 , 이메일 ,이메일 타입과 동일시 트루 반환후 회원가입 진행
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
        }else {
            return "/member/noemail";
        }
    }

    @PostMapping("createMember")    /*회원가입할시 오는 곳 인서트 후 로그인폼으로*/
    public String createMember(MemberDTO dto, MultipartFile file) throws Exception{
        String realPath = session.getServletContext().getRealPath("/resources/member");
        memberService.uploadFile(dto, file, realPath);
        return "/member/loginForm";
    }

    @RequestMapping("loginForm")
    public String loginForm(){

        return "/member/loginForm";
    }

    @ResponseBody
    @RequestMapping("login")
    public String login(MemberDTO dto){
        System.out.println("ajax로 넘어온 값"+dto);
        /*넘어온 문자열 이메일 형식 이메일 타입과 이메일 로 분리 작업*/
        memberService.emailTypeChange(dto);
        memberService.login(dto);


        System.out.println("넘어온 코드 : "+dto.getCode());


        System.out.println("로그인처리부분 넘겨온 값 :" +dto);
        System.out.println("----------------------------");

        if ( dto.getCode()> 10000000 && dto.getCode() < 100000000) {

            session.setAttribute("code",dto.getCode());
            session.setAttribute("nickName",dto.getNickname());
            session.setAttribute("memberType",dto.getMember_type());
//        }
        }
//            . ri (CHK dto.getCode())
        return  String.valueOf(dto.getCode());
    }

    @RequestMapping("logOut")

    public String logOut(MemberDTO dto){
        System.out.println("로그아웃 dto :"+dto);
        dto.setCode((Integer) session.getAttribute("code"));
        memberService.Nupdate(dto);
        session.removeAttribute("code");
        session.removeAttribute("nickName");
        session.removeAttribute("memberType");

        return "redirect:/member/loginForm";
    }
    @RequestMapping("findPassword")
    public String findPassword(MemberDTO dto, Model model) {
        model.addAttribute("email",dto.getEmail());
        model.addAttribute("email_type",dto.getEmail_type());
        return "member/findPassword";
    }

    @RequestMapping("passwordChange")
    public String passwordChange(MemberDTO dto)throws Exception{
        System.out.println("1" + dto);
        memberService.findPassword(dto);
        return "redirect:/member/loginForm";
    }

    @RequestMapping("updatePassword")
    public String updatePassword(MemberDTO dto){
        System.out.println("비밀번호 변경 :"+dto);
        memberService.updatePassword(dto);
        return "redirect:/member/loginForm";
    }
    @RequestMapping("mypage")
    public String mypage(){
        return "/member/myPageForm";
    }

    @RequestMapping("myinfo")
    public String myinfo(){

        return "/member/myInfoUpdateForm";
    }

    @RequestMapping("passwordCheck")

    public String passwordCheck(MemberDTO dto){
        System.out.println("닉네임 + 패스워드 값");
        System.out.println(dto.getPassword()+":"+dto.getNickname());
        System.out.println("======================");
        mdao.passwordCheck(dto);

        if(mdao.passwordCheck(dto)){
            return "/member/myInfoUpdateForm";
        }
        return "";
    }
}

