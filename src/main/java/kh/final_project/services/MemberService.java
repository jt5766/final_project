package kh.final_project.services;

import kh.final_project.dto.EmailTypeDTO;
import kh.final_project.dto.MemberDTO;
import kh.final_project.mail.MailHandler;
import kh.final_project.repositories.EmailcheckDAO;
import kh.final_project.repositories.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.io.File;
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
    public void findPassword(MemberDTO dto) throws MessagingException, UnsupportedEncodingException{
        System.out.println("2" + dto);
        this.emailTypeChange(dto);
        System.out.println("3" + dto);
        UUID uuid = UUID.randomUUID();
        dto.setRandom_key(String.valueOf(uuid));

        MailHandler sendMail = new MailHandler(javaMailSender);
        sendMail.setSubject("[Kreate-Hub 비밀번호찾기 메일 입니다.]"); //메일제목
        sendMail.setText(
                "<h1>Kreate-Hub 비밀번호 찾기</h1>" +

                        "<br>아래 [비밀번호 찾기를 눌러주세요]" +
                        "<br><a href='http://localhost:8080/member/findPassword" +
                        "?email="+dto.getEmail()+
                        "&email_type="+dto.getEmail_type()+
                        "&random_key="+dto.getRandom_key()+
                        "'>비밀번호 찾기</a>");
        sendMail.setFrom("rkqudwns@gmail.com", "강병준");
        String emailName = this.getEmailName(dto);
        dto.setSet_email_type(emailName);
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


    }


    public void uploadFile(MemberDTO dto , MultipartFile file,String realPath) throws  Exception{
        System.out.println("create");
        String path = "/resources/member";
        System.out.println(realPath);
        File realPathFile = new File(realPath);
        if(!realPathFile.exists()) realPathFile.mkdirs();
        if(file != null) {

            String oriName = file.getOriginalFilename();
            System.out.println(oriName);
            String[] arr = oriName.split("\\.");
            System.out.println(arr.length);
            String sysname = dto.getEmail()+"_"+dto.getEmail_type()+"."+arr[arr.length-1];
            System.out.println(sysname);
            String fileURL = realPath+"/"+sysname;
            System.out.println(fileURL);
            String url = path+"/"+sysname;
            file.transferTo(new File(fileURL));
            dto.setFile_url(url);
        }

        System.out.println("createMember로 넘어온 dto :"+dto);
        System.out.println("========================");
        mdao.insert(dto);
    }

    public void Nupdate(MemberDTO dto) {
        mdao.Nupdate(dto);
    }

    public void updatePassword(MemberDTO dto) {
        mdao.updatePassword(dto);
    }

    public void login(MemberDTO dto) {
        mdao.login(dto);
    }
}
