package com.home.pooh.controller.admin;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.util.WebUtils;

import com.home.pooh.HomeController;
import com.home.pooh.domain.Admin;
import com.home.pooh.domain.Member;
import com.home.pooh.model.service.admin.AdminService;

@Controller
public class AdminController {
		
		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		@Autowired
		private AdminService adminService;
		
		/**
		 * Simply selects the home view to render by returning its name.
		 */
		@RequestMapping(value = "/test", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
			logger.info("Welcome home! The client locale is {}.", locale);
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			
			model.addAttribute("serverTime", formattedDate );
			System.out.println("adminController");
			return "home";
		}
		
		
		@RequestMapping(value = "/loginform", method = RequestMethod.GET)
		public String loginForm(HttpServletRequest request) {
			return "admin/login/loginform";
		}
		
		
		@RequestMapping(value="/login")
		public String login(Admin admin, HttpServletRequest request) {
			
			
			//3단계: 일 시키기 
			Admin obj=adminService.login(admin);
			
			//4단계: 저장 
			HttpSession session=request.getSession();
			session.setAttribute("admin", obj);// request가 아닌 세션에 저장함 
			return "admin/main/index"; //어드민 메인페이지 명
		} 
	
		
		
		@RequestMapping(value="/memberlogin2", method = RequestMethod.GET)
		public String login(Member member, HttpServletRequest request) {
			
			//3단계: 일 시키기 
//			Admin obj=adminService.login(admin);
			Member memberTest = (Member)WebUtils.getSessionAttribute(request, "test");
			HttpSession session = request.getSession();
			session.setAttribute("test", memberTest);
			return "admin/main/index"; //어드민 메인페이지 명
		} 
		
		
		
		
		
		@RequestMapping(value="/memberLogin", method = RequestMethod.POST)
		public String MemberLogin( HttpServletRequest request) {
			Member member= (Member)request.getAttribute("user");
			HttpSession session = request.getSession();
			session.setAttribute("user", member);
			WebUtils.setSessionAttribute(request, "test", member);
			return "redirect:/admin/memberlogin2"; 
		} 
		
		@RequestMapping(value="/memberDetail", method=RequestMethod.POST)
		public String memberDetail(HttpServletRequest request) {
			return null;
		}
		
		 
		
}
