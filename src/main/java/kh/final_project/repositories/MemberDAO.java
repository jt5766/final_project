package kh.final_project.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.EmailTypeDTO;
import kh.final_project.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate db;

	// 이메일 관련
	/* option 태그에 추가 하기위한 리스트 */
	public List<EmailTypeDTO> emailType() {
		return db.selectList("Member.selectEmail");
	}

	/* 받은 이메일 타입을(1001) String 타입으로 변환 */
	public String getEmailName(MemberDTO dto) {
		return db.selectOne("Member.getEmailName", dto);
	}

	/* 문자열인 이메일 타입을(naver.com) integer 형으로 재변환 DB에 등록하기 위함 */
	public Integer getEmailCode(String emailName) {
		return db.selectOne("Member.getEmailCode", emailName);
	}

	public void login(MemberDTO dto) {
		System.out.println("///" + dto);
		db.selectOne("Member.PROC_CHK_MEMBER", dto);
		db.update("Member.Yupdate", dto);
	}

	public int insert(MemberDTO dto) {
		return db.insert("Member.insert", dto);
	}

	public boolean passwordCheck(MemberDTO dto) {
		return db.selectOne("Member.passwordCheck", dto);
	}

	public void Nupdate(MemberDTO dto) {
		db.update("Member.Nupdate", dto);
	}

	public void updatePassword(MemberDTO dto) {
		db.update("Member.updatePassword", dto);
	}

	public MemberDTO selectDTO(int code) {
		return db.selectOne("Member.selectDTO", code);
	}

	public void update(MemberDTO dto) {
		db.update("Member.update", dto);
	}

	public int memberDelete(int code) {
		return db.delete("Member.delete", code);
	}

	public int nicknameDuplicateCheck(String nickname) {
		return db.selectOne("Member.nicknameCheck", nickname);
	}

	public boolean duplicationEmail(MemberDTO dto) {
		return db.selectOne("Member.check", dto);
	}

	/**
	 * 로그 아웃 & 세션 만료 & 클라이언트 종료 시 YN 값을 N으로 설정
	 * @param code
	 */
	public void logout(Integer code) {
		System.out.println("db : " + db);
		System.out.println("DAO code : " + code);
		db.update("Member.logout", code);
	}
}
