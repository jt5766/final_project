package kh.final_project.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

    @Autowired
    SqlSessionTemplate db;

    public boolean login(String email) {

        return db.selectList("Member.login",email).size()  == 1 ?true:false;

    }

}
