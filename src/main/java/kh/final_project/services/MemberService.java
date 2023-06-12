package kh.final_project.services;

import kh.final_project.dto.MemberDTO;
import kh.final_project.mail.MailHandler;
import kh.final_project.repositories.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;

@Service
public class MemberService {

    @Autowired
    private MemberDAO mdao;

    @Autowired
    private JavaMailSender javaMailSender;

    public void setEmailType(MemberDTO dto) {
        if (dto.getEmail_type()==1001){
            dto.setSet_email_type("gamil.com");
        } else if (dto.getEmail_type()==1002) {
            dto.setSet_email_type("naver.com");
        } else if (dto.getEmail_type()==1003) {
            dto.setSet_email_type("daum.com");
        } else if (dto.getEmail_type()==1004) {
            dto.setSet_email_type("nate.com");
        }

    }


    public void sendJoinCertificationMail(MemberDTO dto) throws MessagingException, UnsupportedEncodingException {
        //회원가입 완료하면 인증을 위한 이메일 발송

        MailHandler sendMail = new MailHandler(javaMailSender);
        sendMail.setSubject("[Kreate-Hub 이메일 인증메일 입니다.]"); //메일제목
        sendMail.setText(
                "<h1>Kreate-Hub 메일인증</h1>" +
                        "<br>Kreate-Hub 오신것을 환영합니다!" +
                        "<br>아래 [이메일 인증 확인]을 눌러주세요." +
                        "<br><a href='http://localhost:8080/member/register?member_type="+dto.getMember_type()+
                        "&email=" +dto.getEmail()+
                        "&email_type="+dto.getEmail_type()+
                        "'>이메일 인증 확인</a>");
        sendMail.setFrom("rkqudwns@gmail.com", "강병준");
        System.out.println(dto.getEmail()+"@"+dto.getSet_email_type()+" / "+dto.getMember_type());
        sendMail.setTo(dto.getEmail()+"@"+dto.getSet_email_type());
        sendMail.send();


    }


    public void login(MemberDTO dto){
        String email = dto.getEmail();
        String[] mail = email.split("@");
        dto.setEmail(mail[0]);
        if(mail[1].equals("gmail.com")){
            dto.setEmail_type(1001);
        } else if (mail[1].equals("naver.com")) {
            dto.setEmail_type(1002);
        } else if (mail[1].equals("daum.com")) {
            dto.setEmail_type(1003);
        }else if (mail[1].equals("nate.com")) {
            dto.setEmail_type(1004);
        }

        mdao.login(dto);



    }



}
