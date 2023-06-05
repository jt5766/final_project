package kh.final_project.controllers;


import kh.final_project.repositories.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/")
public class MemberController {

    @Autowired
    private MemberDAO mdao;
    @Autowired
    private HttpSession session;

    @RequestMapping("/loginForm")
    public String loginForm(){
        return "/member/loginForm";
    }

    @RequestMapping("/login")
    public String login(String email){
        boolean result = mdao.login(email);
        if(result){
            session.setAttribute("loginID",email);         //code , nickname , member_type 받을예정

        }
        return "/member/loginForm";
    }
}
