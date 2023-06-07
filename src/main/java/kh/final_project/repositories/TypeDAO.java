package kh.final_project.repositories;

import java.util.List;

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
		return mybatis.selectList("Type.Select", "MEMBER_TYPE");
	}

	/**
	 * FILE_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByFileType() {
		return mybatis.selectList("Type.Select", "FILE_TYPE");
	}

	/**
	 * CATEGORY_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByCategoryType() {
		return mybatis.selectList("Type.Select", "CATEGORY_TYPE");
	}

	/**
	 * BOARD_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByBoardType() {
		return mybatis.selectList("Type.Select", "BOARD_TYPE");
	}

	/**
	 * COMPLAINT_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByComplaintType() {
		return mybatis.selectList("Type.Select", "COMPLAINT_TYPE");
	}

	/**
	 * REPLY_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByReplyType() {
		return mybatis.selectList("Type.Select", "REPLY_TYPE");
	}

	// --------------------------------------------------
	/**
	 * EMAILT_YPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByEmailType() {
		return mybatis.selectList("Type.Select", "EMAIL_TYPE");
	}

	/**
	 * GENRE_TYPE 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByGenreType() {
		return mybatis.selectList("Type.Select", "GENRE_TYPE");
	}

	// --------------------------------------------------
	/**
	 * GALLERY_SORT 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByGallery_Cards_Sort() {
		return mybatis.selectList("Type.Select", "GALLERY_CARDS_SORT");
	}

	/**
	 * GALLERY_SEARCH 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByGallery_Cards_Search() {
		return mybatis.selectList("Type.Select", "GALLERY_CARDS_SEARCH");
	}

	/**
	 * GALLERY_CONTENTS_SORT 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByGallery_Contents_Sort() {
		return mybatis.selectList("Type.Select", "GALLERY_CONTENTS_SORT");
	}

	/**
	 * COMMUNITY_SORT 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByCommunity_Sort() {
		return mybatis.selectList("Type.Select", "COMMUNITY_SORT");
	}

	/**
	 * COMMUNITY_SEARCH 테이블 조회
	 * 
	 * @param
	 * @return List<CategoryType>
	 */
	public List<CategoryType> selectByCommunity_Search() {
		return mybatis.selectList("Type.Select", "COMMUNITY_SEARCH");
	}
}
