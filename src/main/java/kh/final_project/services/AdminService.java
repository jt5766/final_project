package kh.final_project.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.CategoryType;
import kh.final_project.dto.CountDTO;
import kh.final_project.dto.MemberDTO;
import kh.final_project.repositories.AdminDAO;
import kh.final_project.repositories.TypeDAO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Autowired
	private TypeDAO typeDAO;

	/**
	 * 관리자 페이지 중 차트의 멤버 관련 메서드
	 * 
	 * @return Map<String, Integer>
	 */
	public List<CountDTO> selectMemberCount() {
		List<CountDTO> result = adminDAO.selectMemberCount();
		return result;
	}

	/**
	 * 관리자 페이지 중 차트의 갤러리 관련 메서드
	 * 
	 * @return Map<String, Integer>
	 */
	public List<CountDTO> selectGalleryCount() {
		List<CountDTO> result = adminDAO.selectGalleryCount();
		return result;
	}

	/**
	 * 관리자 페이지 중 회원가입 [전문가] 관련 메서드
	 * 
	 * @return
	 */
	public List<MemberDTO> selectMember2000() {
		List<MemberDTO> result = adminDAO.selectMember2000();
		return result;
	}

	/**
	 * 관리자 페이지 중 카테고리의 버튼 그룹의 버튼에 해당되는 값 가져오는 메서드
	 * 
	 * @param tableName 테이블 이름
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectCategory(String tableName) {
		List<CategoryType> result = null;
		if (tableName.equals("EMAIL_TYPE")) {
			result = typeDAO.selectByEmailType();
		} else if (tableName.equals("GENRE_TYPE")) {
			result = typeDAO.selectByGenreType();
		} else if (tableName.equals("GALLERY_CARDS_SORT")) {
			result = typeDAO.selectByGallery_Cards_Sort();
		} else if (tableName.equals("GALLERY_CARDS_SEARCH")) {
			result = typeDAO.selectByGallery_Cards_Search();
		} else if (tableName.equals("GALLERY_CONTENTS_SORT")) {
			result = typeDAO.selectByGallery_Contents_Sort();
		} else if (tableName.equals("COMMUNITY_SORT")) {
			result = typeDAO.selectByCommunity_Sort();
		} else if (tableName.equals("COMMUNITY_SEARCH")) {
			result = typeDAO.selectByCommunity_Search();
		}

		return result;
	}

	/**
	 * 관리자 페이지 중 카테고리의 적용 관련 메서드
	 * 
	 * @param tableName 테이블 이름
	 * @param code      코드
	 * @param sort      순서
	 * @param name      이름
	 * @param yn        사용여부
	 * @return boolean
	 */
	public boolean updateCategoey(String tableName, String code, String sort, String name, String yn) {
		// code, sort, name, yn 이 "a,b,c,d,..." 으로 넘어 오기때문에
		// Split 함수를 통해 잘라서 리스트로 변환
		List<CategoryType> list = new ArrayList<CategoryType>();
		for (int i = 0; i < sort.split(",").length; i++)
			list.add(new CategoryType(Integer.parseInt(code.split(",")[i]), Integer.parseInt(sort.split(",")[i]),
					name.split(",")[i], yn.split(",")[i]));

		// 카테고리 수정 함수 실행
		boolean result = typeDAO.updateCategory(tableName, list);

		return result;
	}

	public boolean approveMember(MemberDTO dto) {
		boolean result = adminDAO.approveMember(dto);
		return result;
	}

	public boolean rejectMember(MemberDTO dto) {
		boolean result = adminDAO.rejectMember(dto);
		return result;
	}

}
