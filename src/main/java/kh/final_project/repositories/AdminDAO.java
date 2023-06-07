package kh.final_project.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.CategoryType;

@Repository
public class AdminDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void selectGenreType(CategoryType cy) {
		mybatis.selectOne("Admin.Proc_GenreType", cy);
		System.out.println(cy);
		List<CategoryType> list = mybatis.selectList("Admin.Proc_GenreType_");
		System.out.println(list.size());
	}
}
