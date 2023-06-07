package kh.final_project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.final_project.dto.CategoryType;
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

	@RequestMapping("chart")
	public String chart() {
		return "/admin/chart";
	}

	@RequestMapping("join")
	public String join() {
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
//		Map<String, CategoryType> result = adminService.selectCategory();
//		model.addAttribute(result);
		return "/admin/category";
	}
	
	@ResponseBody
	@RequestMapping(value = "category/type", produces = "application/json;charset=utf8")
	public List<CategoryType> type(String tableName) {
		List<CategoryType> result = adminService.selectCategory(tableName);
		return result;
	}
	@RequestMapping("test")
	public void Test() {
		adminService.selectGenreType();
	}
}
