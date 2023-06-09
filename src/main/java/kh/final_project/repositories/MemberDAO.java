package kh.final_project.repositories;

import kh.final_project.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class MemberDAO {

    @Autowired
    private SqlSessionTemplate db;

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
