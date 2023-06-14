package kh.final_project.repositories;

import kh.final_project.dto.EmailTypeDTO;
import kh.final_project.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MemberDAO {

    @Autowired
    private SqlSessionTemplate db;


// 이메일 관련
    /*option 태그에 추가 하기위한 리스트*/
    public List<EmailTypeDTO> emailType(){
       return db.selectList("Member.selectEmail");
    }
    /*받은 이메일 타입을 String 타입으로 변환*/
    public String getEmailName(MemberDTO dto){
        return db.selectOne("Member.getEmailName", dto);
    }

    /*문자열인 이메일 타입을 integer 형으로 재변환 DB에 등록하기 위함*/
    public Integer getEmailCode(String emailName) {
        return db.selectOne("Member.getEmailCode", emailName);
    }





    public void login(MemberDTO dto) {

        db.selectOne("Member.PROC_CHK_MEMBER", dto);

    }


    public int insert(MemberDTO dto) {
        return db.insert("Member.insert",dto);
    }

    public boolean passwordCheck(MemberDTO dto) {
       return db.selectOne("Member.passwordCheck",dto);
    }


}
