package com.home.pooh.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContentController {
	@GetMapping("/board/list")
	public String getList(HttpSession session) {
		return "admin/board/index";
	}
}
