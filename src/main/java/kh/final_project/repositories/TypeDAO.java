package kh.final_project.repositories;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.dto.CategoryType;

/**
 * TYPE 관련 CRUD 작업하는 DAO
 * 
 * @author LSJ
 */
@Repository
public class TypeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	/**
	 * MEMBER_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByMemberType() {
		return mybatis.selectList("Type.SelectType1", "MEMBER_TYPE");
	}

	/**
	 * FILE_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByFileType() {
		return mybatis.selectList("Type.SelectType1", "FILE_TYPE");
	}

	/**
	 * CATEGORY_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByCategoryType() {
		return mybatis.selectList("Type.SelectType1", "CATEGORY_TYPE");
	}

	/**
	 * BOARD_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByBoardType() {
		return mybatis.selectList("Type.SelectType1", "BOARD_TYPE");
	}

	/**
	 * COMPLAINT_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByComplaintType() {
		return mybatis.selectList("Type.SelectType1", "COMPLAINT_TYPE");
	}

	/**
	 * REPLY_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByReplyType() {
		return mybatis.selectList("Type.SelectType1", "REPLY_TYPE");
	}

	// --------------------------------------------------
	/**
	 * EMAILT_YPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByEmailType() {
		return mybatis.selectList("Type.SelectType2", "EMAIL_TYPE");
	}

	/**
	 * GENRE_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByGenreType() {
		return mybatis.selectList("Type.SelectType2", "GENRE_TYPE");
	}

	// --------------------------------------------------
	/**
	 * GALLERY_SORT 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByGallery_Cards_Sort() {
		return mybatis.selectList("Type.SelectType2", "GALLERY_CARDS_SORT");
	}

	/**
	 * GALLERY_SEARCH 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByGallery_Cards_Search() {
		return mybatis.selectList("Type.SelectType2", "GALLERY_CARDS_SEARCH");
	}

	/**
	 * GALLERY_CONTENTS_SORT 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByGallery_Contents_Sort() {
		return mybatis.selectList("Type.SelectType2", "GALLERY_CONTENTS_SORT");
	}

	/**
	 * COMMUNITY_SORT 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByCommunity_Sort() {
		return mybatis.selectList("Type.SelectType2", "COMMUNITY_SORT");
	}

	/**
	 * COMMUNITY_SEARCH 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByCommunity_Search() {
		return mybatis.selectList("Type.SelectType2", "COMMUNITY_SEARCH");
	}

	/**
	 * TYPE 테이블 CODE로 조회
	 * 
	 * @param tableName
	 * @param code
	 * @return CategoryType
	 */
	public CategoryType selectByCode(String tableName, Integer code) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("value", tableName);
		param.put("code", code);
		return mybatis.selectOne("Type.SelectType2ByCode", param);
	}

	/**
	 * {tableName} 테이블 삽입 & 수정
	 * 
	 * @param String             tableName
	 * @param List<CategoryType> list
	 * @return List<CategoryType>
	 */

	public boolean updateCategory(String tableName, List<CategoryType> list) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("tableName", tableName);
		param.put("list", Arrays.asList(list));
		mybatis.selectOne("Type.PROC_TYPE_UI", param);
		return false;
	}
}
