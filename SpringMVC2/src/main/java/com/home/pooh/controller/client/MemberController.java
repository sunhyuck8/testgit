package com.home.pooh.controller.client;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.home.pooh.domain.Member;
import com.home.pooh.model.repository.common.file.FileManager;
import com.home.pooh.model.service.board.BoardService;
import com.home.pooh.model.service.member.MemberService;



@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private BoardService boardService;
	
	
	
	@RequestMapping(value = "/login")
	public String login() {
		return "client/member/loginform";
	}
	
	@GetMapping("/member/registForm")
	public String showRegistForm() {
		return "/client/member/registForm";
	}
	
	@RequestMapping("/member/ajaxTest" )
	@ResponseBody
	public int ajaxtest(@RequestParam("id") String user_id) {
		int result = memberService.idDupl(user_id);
		return result;
	}
	
	@RequestMapping(value = "/member/memberUpdateForm")
	public String showUserUPdateForm(HttpServletRequest request){
		
		return "/client/member/userInfoUpdateForm";
	}
	
	@RequestMapping(value = "/member/memberUpdate", method = RequestMethod.POST)
	public String UserInfoUpdate(HttpServletRequest request, Member member){
		if(member.getPhoto().getSize()!=0) {
			MultipartFile photo = member.getPhoto();
			ServletContext context= request.getServletContext();
			long time = System.currentTimeMillis();
			String fileName = time +"." + fileManager.getExt(photo.getOriginalFilename());
			fileManager.saveFile(context, fileName, photo);
			member.setFilename(fileName);
		}
		memberService.update(member);
		
		
		HttpSession session = request.getSession();
		session.setAttribute("userInfo", member);
		
		return "client/member/userInfoIndex";
	}
	
	
	@RequestMapping(value = "/member/deleteUser")
	public String deleteMember(HttpServletRequest request) {//맴버삭제, 작성글, 댓글, 대댓글 name '탈퇴한 맴버로 바꿔주기' 
		int board_id = Integer.parseInt(request.getParameter("member_id"));
		System.out.println(board_id);
		
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	//내정보 메뉴 - 내가 작성한 글 
	@RequestMapping(value = "/userInfo/board")
	 public String UserInfoBoard(HttpSession session, Model model) {
			Member member = (Member)session.getAttribute("userInfo");
			List boardList = boardService.selectListAll(member.getName());
			
			model.addAttribute("boardList", boardList);
		 return "/client/member/userInfoBoard";
	 }
	
	
	
	
	
}
