package kh.final_project.services;

import kh.final_project.dto.MemberDTO;
import kh.final_project.repositories.EmailcheckDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmailcheckService {

    @Autowired
    private EmailcheckDAO edao;
    public boolean checkingEmail(MemberDTO dto){
        return edao.checkingEmail(dto);
    }


}
