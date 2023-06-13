package kh.final_project.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.CountDTO;
import kh.final_project.dto.MemberDTO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<CountDTO> selectMemberCount() {
		List<CountDTO> result = mybatis.selectList("Admin.selectMemberCount");
		return result;
	}

	public List<CountDTO> selectGalleryCount() {
		List<CountDTO> result = mybatis.selectList("Admin.selectGalleryCount");
		return result;
	}

	public List<MemberDTO> selectMember2000() {
		List<MemberDTO> result = mybatis.selectList("Admin.selectMember2000");
		return result;
	}
}
