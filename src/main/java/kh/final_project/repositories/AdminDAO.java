package kh.final_project.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.CountDTO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<CountDTO> selectByMemberCount() {
		List<CountDTO> result = mybatis.selectList("Admin.selectByMemberCount");
		System.out.println(result.size());
		return result;
	}

	public List<CountDTO> selectByGalleryCount() {
		List<CountDTO> result = mybatis.selectList("Admin.selectByGalleryCount");
		System.out.println(result.size());
		return result;
	}

}
