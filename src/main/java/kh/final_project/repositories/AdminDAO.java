package kh.final_project.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.CategoryType;

@Repository
public class AdminDAO {
	@Autowired
	SqlSessionTemplate mybatis;

	public List<CategoryType> selectGenreType(CategoryType cy) {
//		mybatis.selectOne("Admin.Proc_GenreType", cy);
//		System.out.println(cy);
//
//		Map<String, List<CategoryType>> result = new HashMap<String, List<CategoryType>>();
//
//		mybatis.selectOne("Admin.Proc_GenreType_", result);
//		return result.get("result");
	}
}
