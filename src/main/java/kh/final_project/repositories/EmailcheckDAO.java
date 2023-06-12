package kh.final_project.repositories;

import kh.final_project.dto.EmailcheckDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class EmailcheckDAO {
    @Autowired
    private SqlSessionTemplate db;

    public int addemail(EmailcheckDTO dto){
        return db.insert("Email.insert",dto);
    }

}
