package com.home.pooh.controller.rest;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.home.pooh.HomeController;
import com.home.pooh.domain.Member;
import com.home.pooh.model.repository.common.file.FileManager;
import com.home.pooh.model.service.member.MemberService;

@Controller
public class RestController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FileManager fileManager;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		System.out.println("restController");
		return "home";
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "/rest/login/loginform";
	}
	
	@GetMapping("/member/registForm")
	public String login() {
		System.out.println("rest-login호출");
		return "/rest/member/registForm";
	}
	
	
	
	@RequestMapping(value = "/loginCheck",method = RequestMethod.POST)
	public String loginCheck(Member member,HttpServletRequest request) {
			System.out.println(member);
			String forward = "";
			//request에 정보를 저장해서 forward 해보면될까
			Member user = memberService.LoginCheck(member);
			request.setAttribute("user", user);
			
			int MemberAuth = user.getAuth();
			if(MemberAuth==1||MemberAuth==0) {
				forward = "forward:/admin/memberLogin";
			}else if(MemberAuth==2) {
				forward = "forward:/userlogin";
				//client Controller 로 보낼것
			}
		return forward;
	}
	
	
	
	@RequestMapping(value="/registMember",method = RequestMethod.POST)
	public String registMember(Member member, HttpServletRequest request) {
		MultipartFile photo = member.getPhoto();
		ServletContext context = request.getServletContext();
		long time = System.currentTimeMillis();
		
		String fileName = time+"."+fileManager.getExt(photo.getOriginalFilename());
		fileManager.saveFile(context, fileName, photo);
		member.setFilename(fileName);
		System.out.println(context+" 경로 "+photo);
		memberService.regist(member);
		return "rest/popup/alert";
	}
	
	
	@RequestMapping(value="/member/detail" , method = RequestMethod.GET )
	public String DetailMember(@PathVariable int member_id) {
		System.out.println(member_id+"===restC===");
		return null;
	}
	
}
