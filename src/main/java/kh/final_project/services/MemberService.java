package kh.final_project.services;

import kh.final_project.dto.EmailTypeDTO;
import kh.final_project.dto.MemberDTO;
import kh.final_project.mail.MailHandler;
import kh.final_project.repositories.EmailcheckDAO;
import kh.final_project.repositories.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

@Service
public class MemberService {

    @Autowired
    private EmailcheckDAO edao;

    @Autowired
    private MemberDAO mdao;

    @Autowired
    private JavaMailSender javaMailSender;

    public List<EmailTypeDTO> emailType(){
        return mdao.emailType();
    }


    public String getEmailName(MemberDTO dto){
        return mdao.getEmailName(dto);
    }

    public void sendJoinCertificationMail(MemberDTO dto) throws MessagingException, UnsupportedEncodingException {

        //이메일 인증하는 순간 멤버타입 , 이메일 타입, 이메일 따로 저장
        UUID uuid = UUID.randomUUID();
        dto.setRandom_key(String.valueOf(uuid));
        edao.addemail(dto);

        MailHandler sendMail = new MailHandler(javaMailSender);
        sendMail.setSubject("[Kreate-Hub 이메일 인증메일 입니다.]"); //메일제목
        sendMail.setText(
                "<h1>Kreate-Hub 메일인증</h1>" +
                        "<br>Kreate-Hub 오신것을 환영합니다!" +
                        "<br>아래 [이메일 인증 확인]을 눌러주세요." +
                        "<br><a href='http://localhost:8080/member/register?member_type="+dto.getMember_type()+
                        "&email=" +dto.getEmail()+
                        "&email_type="+dto.getEmail_type()+
                        "&random_key="+dto.getRandom_key()+
                        "'>이메일 인증 확인</a>");
        sendMail.setFrom("rkqudwns@gmail.com", "강병준");
        System.out.println(dto.getEmail()+"@"+dto.getSet_email_type()+" / "+dto.getMember_type());
        sendMail.setTo(dto.getEmail()+"@"+dto.getSet_email_type());
        sendMail.send();


    }


    public void emailTypeChange(MemberDTO dto){
        String email = dto.getEmail();
        String[] mail = email.split("@");
        dto.setEmail(mail[0]);
        Integer email_type = mdao.getEmailCode(mail[1]);
        dto.setEmail_type(email_type);
//        if(mail[1].equals("gmail.com")){
//            dto.setEmail_type(1001);
//        } else if (mail[1].equals("naver.com")) {
//            dto.setEmail_type(1002);
//        } else if (mail[1].equals("daum.net")) {
//            dto.setEmail_type(1003);
//        }else if (mail[1].equals("nate.com")) {
//            dto.setEmail_type(1004);
//        }

        mdao.login(dto);



    }



}
