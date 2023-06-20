package kh.final_project.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.final_project.dto.AdminCommunityDTO;
import kh.final_project.dto.AdminGalleryDTO;
import kh.final_project.dto.AdminSearchDTO;
import kh.final_project.dto.CategoryType;
import kh.final_project.dto.CountDTO;
import kh.final_project.dto.MemberDTO;
import kh.final_project.services.AdminService;

/**
 * <b>[ Admin ]</b> 관련 Web Layer 중 Conteoller
 * 
 * @author LSJ
 */
@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@RequestMapping("")
	public String home() {
		return "/admin/home";
	}

	/**
	 * <b>[ 그래프 ]</b>
	 * <p>
	 * 멤버 유형별 멤버 수 : SELECT <br>
	 * 갤러리 유형별 조회 수 : SELECT
	 * </p>
	 * 
	 * @return /admin/chart
	 */
	@RequestMapping("chart")
	public String chart(Model model) {
		// 회원 카운트
		List<CountDTO> memberCount = adminService.selectMemberCount();
		model.addAttribute("memberCount", new Gson().toJson(memberCount));
		// 갤러리 별 조회수 합
		List<CountDTO> galleryCount = adminService.selectGalleryCount();
		model.addAttribute("galleryCount", new Gson().toJson(galleryCount));
		return "/admin/chart";
	}

	/**
	 * <b>[ 가입 승인 ]</b>
	 * <p>
	 * 가입 승인 대기 중인 전문가 : SELECT
	 * </p>
	 * 
	 * @return /admin/join
	 */
	@RequestMapping("join")
	public String join(Model model) {
		List<MemberDTO> result = adminService.selectMember2000();
		model.addAttribute("list", result);
		return "/admin/join";
	}

	/**
	 * <b>[ 가입 승인 ]</b>
	 * <p>
	 * 가입 승인 : UPDATE [ Name, Tel ]
	 * </p>
	 * 
	 * @return redirect: /admin/join
	 */
	@RequestMapping("join/approve")
	public String joinApprove(MemberDTO dto) {
		boolean result = adminService.approveMember(dto);
		return "redirect: /admin/join";
	}

	/**
	 * <b>[ 가입 승인 ]</b>
	 * <p>
	 * 가입 거절 : DELETE
	 * </p>
	 * 
	 * @return redirect: /admin/join
	 */
	@RequestMapping("join/reject")
	public String joinReject(MemberDTO dto) {
		boolean result = adminService.rejectMember(dto);
		return "redirect: /admin/join";
	}

	/**
	 * <b>[ 회원 ]</b>
	 * <p>
	 * 회원 정보 : SELECT
	 * </p>
	 * 
	 * @return /admin/member
	 */
	@RequestMapping("member")
	public String member(Model model) {
		List<MemberDTO> result = adminService.selectMember();
		model.addAttribute("list", result);
		return "/admin/member";
	}

	/**
	 * <b>[ 회원 ]</b>
	 * <p>
	 * 밴 : UPDATE
	 * </p>
	 * 
	 * @return /admin/member
	 */
	@RequestMapping("member/ban")
	public String memberBan(MemberDTO dto, int ban_day) {
		boolean result = adminService.banMember(dto, ban_day);
		return "redirect: /admin/member";
	}

	/**
	 * <b>[ 갤러리 ]</b>
	 * <p>
	 * 갤러리 초기 정보 : SELECT
	 * </p>
	 * 
	 * @return /admin/gallery
	 */
	@RequestMapping("gallery")
	public String gallery(Model model) {
		Map<String, List<CategoryType>> result = adminService.galleryInit();
		model.addAttribute("typeList", result.get("typeList"));
		model.addAttribute("searchList", result.get("searchList"));
		return "/admin/gallery";
	}

	/**
	 * <b>[ 갤러리 ]</b>
	 * <p>
	 * 갤러리 검색 - 비동기 : SELECT
	 * </p>
	 * 
	 * @return /admin/gallery/search
	 */
	@ResponseBody
	@RequestMapping(value = "gallery/search", produces = "application/json;charset=utf8")
	public List<AdminGalleryDTO> searchGallery(AdminSearchDTO dto) {
		List<AdminGalleryDTO> result = adminService.searchGallery(dto);
		return result;
	}

	/**
	 * <b>[ 갤러리 ]</b>
	 * <p>
	 * 갤러리 삭제 : DELETE
	 * </p>
	 * 
	 * @return /admin/gallery/delete
	 */
	@RequestMapping("gallery/delete")
	public String deleteGallery(AdminGalleryDTO dto) {
		boolean result = adminService.deleteGallery(dto);
		return "redirect:/admin/gallery";
	}

	/**
	 * <b>[ 커뮤니티 ]</b>
	 * <p>
	 * 커뮤니티 초기 정보 : SELECT
	 * </p>
	 * 
	 * @return /admin/community
	 */
	@RequestMapping("community")
	public String community(Model model) {
		Map<String, List<CategoryType>> result = adminService.communityInit();
		model.addAttribute("typeList", result.get("typeList"));
		model.addAttribute("searchList", result.get("searchList"));
		return "/admin/community";
	}

	/**
	 * <b>[ 커뮤니티 ]</b>
	 * <p>
	 * 커뮤니티 검색 - 비동기 : SELECT
	 * </p>
	 * 
	 * @return /admin/community/search
	 */
	@ResponseBody
	@RequestMapping(value = "community/search", produces = "application/json;charset=utf8")
	public List<AdminCommunityDTO> searchCommunity(AdminSearchDTO dto) {
		List<AdminCommunityDTO> result = adminService.searchCommunity(dto);
		return result;
	}

	/**
	 * <b>[ 갤러리 ]</b>
	 * <p>
	 * 갤러리 삭제 : DELETE
	 * </p>
	 * 
	 * @return /admin/community/delete
	 */
	@RequestMapping("community/delete")
	public String deleteCommunity(AdminCommunityDTO dto) {
		boolean result = adminService.deleteCommunity(dto);
		return "redirect:/admin/community";
	}

	/**
	 * <b>[ 카테고리 ]</b>
	 * 
	 * @return /admin/category
	 */
	@RequestMapping("category")
	public String main(Model model) {
		return "/admin/category";
	}

	/**
	 * <b>[ 카테고리 ]</b>
	 * <p>
	 * 카테고리 정보 - 비동기 : SELECT
	 * </p>
	 */
	@ResponseBody
	@RequestMapping(value = "category/type", produces = "application/json;charset=utf8")
	public List<CategoryType> type(String tableName) {
		List<CategoryType> result = adminService.selectCategory(tableName);
		return result;
	}

	/**
	 * <b>[ 카테고리 ]</b>
	 * <p>
	 * 카테고리 입력 및 수정 : INSERT & UPDATE
	 * </p>
	 * 
	 * @return redirect: /admin/category
	 */
	@RequestMapping("update_category")
	public String updateCategory(String tableName, String code, String sort, String name, String yn) {
		adminService.updateCategoey(tableName, code, sort, name, yn);
		return "redirect: /admin/category";
	}
}
