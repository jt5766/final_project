package kh.final_project.repositories;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Struct;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.final_project.commons.YourObjectConverter;
import kh.final_project.dto.CategoryType;
import oracle.jdbc.OracleConnection;

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

//	public boolean updateCategory(String tableName, List<CategoryType> list) {
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("tableName", tableName);
////		List<Struct> structList = null;
////		try {
////			structList = YourObjectConverter.convertToStructList(list, oracleConnection.getConnection());
////		} catch (SQLException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
////		param.put("list", structList);
//		param.put("lsit", list);
//		mybatis.selectOne("Type.PROC_TYPE_UI", param);
//		return false;
//	}
}
