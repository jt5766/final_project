package kh.final_project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

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
		System.out.println(dto);
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

	@RequestMapping("gallery")
	public String gallery() {
		return "/admin/gallery";
	}

	@RequestMapping("community")
	public String community() {
		return "/admin/community";
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
