package kh.final_project.services;

import kh.final_project.dto.CategoryType;
import kh.final_project.repositories.GalleryDAO;
import kh.final_project.repositories.TypeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HomeService {
	@Autowired
	private TypeDAO typeDAO;
	@Autowired
	GalleryDAO galleryDAO;

	public Map<String, List<CategoryType>> init() {
		Map<String, List<CategoryType>> result = new HashMap<String, List<CategoryType>>();
		// 갤러리
		result.put("gallery", typeDAO.selectByCategoryType());
		// 커뮤니티
		result.put("community", typeDAO.selectByBoardType());
		// 마이페이지
		List<CategoryType> mypageList = new ArrayList<CategoryType>();
		mypageList.add(new CategoryType(1001, "갤러리"));
		mypageList.add(new CategoryType(1002, "커뮤니티"));
		mypageList.add(new CategoryType(1003, "1:1 채팅"));
		mypageList.add(new CategoryType(1004, "회원 정보 수정"));
		result.put("mypage", mypageList);
		// 관리자페이지
		List<CategoryType> adminpageList = new ArrayList<CategoryType>();
		adminpageList.add(new CategoryType(1001, "그래프"));
		adminpageList.add(new CategoryType(1002, "가입 승인"));
		adminpageList.add(new CategoryType(1003, "회원"));
		adminpageList.add(new CategoryType(1004, "갤러리"));
		adminpageList.add(new CategoryType(1005, "커뮤니티"));
		adminpageList.add(new CategoryType(1006, "카테고리"));
		result.put("adminpage", adminpageList);
		return result;
	}

//	public List<GalleryCardView> getDailyPopCards() {
//		return galleryDAO.getDailyPopCards();
//	}
}
