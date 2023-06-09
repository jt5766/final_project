package kh.final_project.controllers;


import kh.final_project.dto.MemberDTO;
import kh.final_project.repositories.MemberDAO;
import kh.final_project.services.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/")
public class MemberController {


    @Autowired
    private HttpSession session;

    @Autowired
    private MemberService MemberService;

    @Autowired
    private MemberDAO mdao;
    @RequestMapping("signup")
    public String signup(){
        return"member/signupForm";
    }

    @RequestMapping("register")
    public String register(Model model , MemberDTO dto){

        MemberService.setEmailType(dto);
        model.addAttribute("email",dto.getEmail());
        model.addAttribute("emailType",dto.getEmail_type());
        model.addAttribute("setEmailType",dto.getSet_email_type());
        model.addAttribute("memberType",dto.getMember_type());
        if(dto.getMember_type()==2000){
            return "/member/expertRegisterForm";
        }


        return "/member/registerForm";
    }

    @PostMapping("createMember")
    public String createMember(MemberDTO dto){


        mdao.insert(dto);
        return "/member/loginForm";
    }

    @RequestMapping("loginForm")
    public String loginForm(){
        return "/member/loginForm";
    }

    @PostMapping("login")
    public String login(MemberDTO dto){


        dto.setEmail_type(1002);
        mdao.login(dto);

        System.out.println("로그인처리부분 넘겨온 값 :" +dto);
        System.out.println("----------------------------");
        if(dto.getNickname() != null){
            System.out.println("닉네임값 확인 세션 조건 충족:"+ dto.getNickname());
            System.out.println("=============================");
            session.setAttribute("code",dto.getCode());
            session.setAttribute("nickName",dto.getNickname());
            session.setAttribute("memberType",dto.getMember_type());
        }
        return "home";
    }

    @RequestMapping("logOut")
    public String logOut(){
        session.removeAttribute("code");
        session.removeAttribute("nickname");
        session.removeAttribute("memberType");

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

    public void passwordCheck(MemberDTO dto){
        System.out.println("닉네임 + 패스워드 값");
        System.out.println(dto.getPassword()+":"+dto.getNickname());
        System.out.println("======================");
       boolean result = mdao.passwordCheck(dto);

        if(mdao.passwordCheck(dto)){
//            return "";
        }
    }
}
