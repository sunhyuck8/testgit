package com.home.pooh.controller.client;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.home.pooh.HomeController;
import com.home.pooh.domain.Board;
import com.home.pooh.domain.BoardFiles;
import com.home.pooh.domain.InputFiles;
import com.home.pooh.domain.Member;
import com.home.pooh.model.repository.common.page.Paging;
import com.home.pooh.model.service.board.BoardService;
import com.home.pooh.model.service.member.MemberService;

@Controller
public class ClientController {
		
		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		
		
		@Autowired
		private BoardService boardService;
		
		@Autowired
		private MemberService memberService;
		
		@Autowired
		private Paging paging;
		
		@RequestMapping(value = "/userlogin")
		public String user_login(HttpServletRequest request, Member member) {
			Member userInfo = memberService.LoginCheck(member);
			System.out.println("로그인 되었다."+userInfo);
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", userInfo);
			return "redirect:/";
		}
		
		@RequestMapping(value = "/logout")
		public String user_logout(HttpServletRequest request) {
			HttpSession session = request.getSession();
			session.invalidate();
			return "redirect:/";
		}
		
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
			//logger.info("Welcome home! The client locale is {}.", locale);
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			
			
			return "client/main/index";
		}
		
		@RequestMapping(value = "/col1", method = RequestMethod.GET)
		public String home1(Model model, HttpServletRequest request) {
			List list= boardService.selectAll();
			paging.pagingInit(request, list, 1, 5);
			model.addAttribute("boardList", list);
			model.addAttribute("paging", paging);
			return "client/temporary/col1";
		}
		
		
		
		@RequestMapping(value = "/col2", method = RequestMethod.GET)
		public ModelAndView home2(HttpServletRequest request, ModelAndView mav) {
			List list = boardService.selectAll(2);
			Map<Board, List<InputFiles>> boardListMap =new LinkedHashMap<Board, List<InputFiles>>();
			for(int i =0;i<list.size();i++) {
				Board board = (Board) list.get(i);
				List inputFileList = boardService.selectFileList(board.getBoard_id());
				boardListMap.put(board, inputFileList);
			}
				mav.setViewName("client/temporary/col2");
				mav.addObject("boardData", boardListMap);
			return mav;
		}
		
		
		@RequestMapping(value = "/col3", method = RequestMethod.GET)
		public String home3(Locale locale, Model model) {
			//logger.info("Welcome home! The client locale is {}.", locale);
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			
			model.addAttribute("serverTime", formattedDate );
			return "client/temporary/col3";
		}
		
		@RequestMapping(value = "/col4", method = RequestMethod.GET)
		public String home4(Locale locale, Model model) {
			return "client/temporary/col4";
		}

		@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
		public String myInfo(HttpServletRequest request) {
			return "client/member/userInfoIndex";
		}
	
		@RequestMapping(value = "/testpage", method = RequestMethod.GET)
		public String testPage(HttpServletRequest request) {
			return "client/temporary/test";
		}
		
		public String deleteUser() {
			//세션 아웃, db에서 아웃, 삭제할지 되묻기 
			
			return null;
		}
		
		public String showListWriting(){
			//작성글, 작성댓글 , 작성대댓
			return null;
		}
		
		public String showUpdateFormUser() {
			// 사진 삭제 , 수정 , 없을시 기본 사진 
			return null;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
