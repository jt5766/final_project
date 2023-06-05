package kh.final_project.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.TestDTO;

@Repository
public class AdminDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void test(TestDTO dto) {
		mybatis.selectOne("Proc_Test", dto);
	}
}
