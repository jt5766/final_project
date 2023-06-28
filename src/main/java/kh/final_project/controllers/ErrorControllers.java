package kh.final_project.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class ErrorControllers {
	@ExceptionHandler(AdminController.class)
	public String Error() {
		return "/error/error";
	}
}
