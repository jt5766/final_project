package kh.final_project.repositories;

import kh.final_project.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmailcheckDAO {
    @Autowired
    private SqlSessionTemplate db;

    public int addemail(MemberDTO dto){
        return db.insert("Email.insert",dto);
    }

    public boolean checkingEmail(MemberDTO dto){
        return db.selectOne("Email.select",dto);
    }
}
