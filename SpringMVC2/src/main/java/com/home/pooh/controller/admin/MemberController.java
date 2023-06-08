package com.home.pooh.controller.admin;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.home.pooh.domain.Member;
import com.home.pooh.model.repository.common.file.FileManager;
import com.home.pooh.model.service.member.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = "/member/detail", method = RequestMethod.GET)
	public String memberDetail(HttpServletRequest request) {
		ServletContext context= request.getServletContext();
		
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		Member member = (Member) memberService.detail(member_id);
		HttpSession session = request.getSession();
		session.setAttribute("member", member);
		System.out.println(context.getRealPath(member.getFilename()));
		return "admin/member/index";
	}

	@RequestMapping(value = "/member/Update", method = RequestMethod.POST)
	public String memberUpdate(Member member, HttpServletRequest request) {
		System.out.println("들어온 member : " + member);
		String preFilename = member.getFilename();
		if (member.getPhoto().getSize() != 0) {// 첨부파일 있을 때 1. filename있을때, 없을때

			MultipartFile photo = member.getPhoto();
			ServletContext context = request.getServletContext(); 
			
			/* if(preFilename!=null) { fileManager.deleteFile(context, preFilename); } */
			 
			long time = System.currentTimeMillis();
			String fileName = time + "." + fileManager.getExt(photo.getOriginalFilename());
			fileManager.saveFile(context, fileName, photo);
			member.setFilename(fileName);
		}
		memberService.update(member);
		String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
		return "redirect:" + referer;
	}
	
	
	@RequestMapping(value = "/member/selectAll")
	public String memberSelectAll(HttpServletRequest request) {
		List<Member> list= memberService.selectAll();
		
		HttpSession session = request.getSession();
		session.setAttribute("memberList",list);
		return "admin/member/memberLookup";
	}
	
	@RequestMapping(value = "/member/test")
	public String test(HttpServletRequest request) {
		List<Member> list= memberService.selectAll();
		
		HttpSession session = request.getSession();
		session.setAttribute("memberList",list);
		return "admin/member/pagingTest";
	}
	
	
	
	public String memberInsert() {
		return null;
	}

	public String memberDelete() {
		return null;
	}
	@RequestMapping(value = "/member/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/rest/loginform";
	}
}
