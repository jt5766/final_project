package kh.final_project.services;

import kh.final_project.dto.MemberDTO;
import kh.final_project.repositories.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberDAO mdao;


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
}
