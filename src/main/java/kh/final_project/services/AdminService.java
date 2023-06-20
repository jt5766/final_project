package kh.final_project.services;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.final_project.dto.AdminCommunityDTO;
import kh.final_project.dto.AdminGalleryDTO;
import kh.final_project.dto.AdminSearchDTO;
import kh.final_project.dto.CategoryType;
import kh.final_project.dto.CountDTO;
import kh.final_project.dto.MemberDTO;
import kh.final_project.repositories.AdminDAO;
import kh.final_project.repositories.TypeDAO;

/**
 * <b>[ Admin ]</b> 관련 Service Layer
 * 
 * @author LSJ
 */
@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Autowired
	private TypeDAO typeDAO;

	/**
	 * <b>[ 그래프 ]</b>
	 * <p>
	 * 멤버 유형별 멤버 수
	 * </p>
	 */
	public List<CountDTO> selectMemberCount() {
		List<CountDTO> result = adminDAO.selectMemberCount();
		return result;
	}

	/**
	 * <b>[ 그래프 ]</b>
	 * <p>
	 * 갤러리 유형별 조회 수
	 * </p>
	 */
	public List<CountDTO> selectGalleryCount() {
		List<CountDTO> result = adminDAO.selectGalleryCount();
		return result;
	}

	/**
	 * <b>[ 가입 승인 ]</b>
	 * <p>
	 * 가입 승인 대기 중인 전문가 : SELECT
	 * </p>
	 */
	public List<MemberDTO> selectMember2000() {
		List<MemberDTO> result = adminDAO.selectMember2000();
		return result;
	}

	/**
	 * <b>[ 가입 승인 ]</b>
	 * <p>
	 * 가입 승인 : UPDATE [ Name, Tel ]
	 * </p>
	 */
	public boolean approveMember(MemberDTO dto) {
		boolean result = adminDAO.approveMember(dto);
		return result;
	}

	/**
	 * <b>[ 가입 승인 ]</b>
	 * <p>
	 * 가입 거절 : DELETE
	 * </p>
	 */
	public boolean rejectMember(MemberDTO dto) {
		boolean result = adminDAO.rejectMember(dto);
		return result;
	}

	/**
	 * <b>[ 회원 ]</b>
	 * <p>
	 * 회원 정보 : SELECT
	 * </p>
	 */
	public List<MemberDTO> selectMember() {
		List<MemberDTO> result = adminDAO.selectMember();
		return result;
	}

	/**
	 * <b>[ 회원 ]</b>
	 * <p>
	 * 회원 기간 밴 : UPDATE
	 * </p>
	 * 현재 시간에 밴 기간을 더해서 dto의 stop_date에 값 세팅
	 */
	public boolean banMember(MemberDTO dto, int ban_day) {
		// 현재 시간에 ban_day를 더한 값
		LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul")).plusDays(ban_day);
		// DTO 에 밴 기간 세팅
		dto.setStop_date(Timestamp.from(now.toInstant(ZoneOffset.ofHours(9))));

		boolean result = adminDAO.banMember(dto);
		return result;
	}

	/**
	 * <b>[ 갤러리 ]</b>
	 * <p>
	 * 갤러리 타입 정보 : SELECT<br>
	 * 갤러리 검색 정보 : SELECT
	 * </p>
	 */
	public Map<String, List<CategoryType>> galleryInit() {
		Map<String, List<CategoryType>> result = new HashMap<String, List<CategoryType>>();
		List<CategoryType> typeList = typeDAO.selectByCategoryType();
		result.put("typeList", typeList);
		List<CategoryType> searchList = typeDAO.selectByGallery_Cards_Search();
		result.put("searchList", searchList);
		return result;
	}

	/**
	 * <b>[ 갤러리 ]</b>
	 * <p>
	 * 갤러리 정보 : SELECT
	 * </p>
	 */
	public List<AdminGalleryDTO> searchGallery(AdminSearchDTO dto) {
		List<AdminGalleryDTO> result = adminDAO.searchGallery(dto, typeDAO.selectByGallery_Cards_Search());
		return result;
	}

	/**
	 * <b>[ 갤러리 ]</b>
	 * <p>
	 * 갤러리 삭제 : DELETE
	 * </p>
	 */
	public boolean deleteGallery(AdminGalleryDTO dto) {
		boolean result = adminDAO.deleteGallery(dto);
		return result;
	}

	/**
	 * <b>[ 커뮤니티 ]</b>
	 * <p>
	 * 커뮤니티 타입 정보 : SELECT<br>
	 * 커뮤니티 검색 정보 : SELECT
	 * </p>
	 */
	public Map<String, List<CategoryType>> communityInit() {
		Map<String, List<CategoryType>> result = new HashMap<String, List<CategoryType>>();
		List<CategoryType> typeList = typeDAO.selectByBoardType();
		result.put("typeList", typeList);
		List<CategoryType> searchList = typeDAO.selectByCommunity_Search();
		result.put("searchList", searchList);
		return result;
	}

	/**
	 * <b>[ 커뮤니티 ]</b>
	 * <p>
	 * 커뮤니티 정보 : SELECT
	 * </p>
	 */
	public List<AdminCommunityDTO> searchCommunity(AdminSearchDTO dto) {
		List<AdminCommunityDTO> result = adminDAO.searchCommunity(dto, typeDAO.selectByCommunity_Search());
		return result;
	}

	/**
	 * <b>[ 커뮤니티 ]</b>
	 * <p>
	 * 커뮤니티 삭제 : DELETE
	 * </p>
	 */
	public boolean deleteCommunity(AdminCommunityDTO dto) {
		boolean result = adminDAO.deleteCommunity(dto, typeDAO.selectByBoardType());
		return result;
	}

	/**
	 * <b>[ 카테고리 ]</b>
	 * <p>
	 * 카테고리별 정보 : SELECT
	 * </p>
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
	 * <b>[ 카테고리 ]</b>
	 * <p>
	 * 카테고리 입력 및 수정 : INSERT & UPDATE
	 * </p>
	 * 스트링 문자열을 Split(,)을 이용하여 List로 변환
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

}
