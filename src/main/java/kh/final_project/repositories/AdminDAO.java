package kh.final_project.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.CountDTO;
import kh.final_project.dto.MemberDTO;

/**
 * <b>[ Admin ]</b> 관련 Repository Layer
 * 
 * @author LSJ
 */
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

	public boolean approveMember(MemberDTO dto) {
		boolean result = mybatis.update("Admin.approveMember", dto) > 0 ? true : false;
		return result;
	}

	public boolean rejectMember(MemberDTO dto) {
		boolean result = mybatis.delete("Admin.rejectMember", dto) > 0 ? true : false;
		return result;
	}

	public List<MemberDTO> selectMember() {
		List<MemberDTO> result = mybatis.selectList("Admin.selectMember");
		return result;
	}

	public boolean banMember(MemberDTO dto) {
		boolean result = mybatis.delete("Admin.banMember", dto) > 0 ? true : false;
		return false;
	}
}
