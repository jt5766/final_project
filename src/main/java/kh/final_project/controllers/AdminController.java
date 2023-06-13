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
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("chart")
	public String chart(Model model) {
		// 회원 카운트
		List<CountDTO> memberCount = adminService.selectMemberCount();
		model.addAttribute("memberCount",new Gson().toJson(memberCount));
		// 갤러리 별 조회수 합
		List<CountDTO> galleryCount = adminService.selectGalleryCount();
		model.addAttribute("galleryCount", new Gson().toJson(galleryCount));
		return "/admin/chart";
	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping("join")
	public String join(Model model) {
		List<MemberDTO> result = adminService.selectMember2000();
		model.addAttribute("list", result);
		return "/admin/join";
	}

	@RequestMapping("member")
	public String member() {
		return "/admin/member";
	}

	@RequestMapping("gallery")
	public String gallery() {
		return "/admin/gallery";
	}

	@RequestMapping("community")
	public String community() {
		return "/admin/community";
	}

	@RequestMapping("category")
	public String main(Model model) {
		return "/admin/category";
	}

	/**
	 * 
	 * @param tableName 테이블 이름
	 * @return List<CategoryType>
	 */
	@ResponseBody
	@RequestMapping(value = "category/type", produces = "application/json;charset=utf8")
	public List<CategoryType> type(String tableName) {
		List<CategoryType> result = adminService.selectCategory(tableName);
		return result;
	}

	/**
	 * 
	 * @param tableName 테이블 이름
	 * @param code      코드
	 * @param sort      순서
	 * @param name      이름
	 * @param yn        사용여부
	 * @return
	 */
	@RequestMapping("update_category")
	public String updateCategory(String tableName, String code, String sort, String name, String yn) {
		adminService.updateCategoey(tableName, code, sort, name, yn);
		return "redirect: /admin/category";
	}
}
