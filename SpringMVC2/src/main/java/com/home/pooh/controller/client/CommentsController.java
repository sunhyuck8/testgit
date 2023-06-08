package com.home.pooh.controller.client;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.home.pooh.domain.Comment;
import com.home.pooh.domain.Member;
import com.home.pooh.domain.Recomment;
import com.home.pooh.exception.LoginFailException;
import com.home.pooh.model.service.comment.CommentService;

@Controller
public class CommentsController {
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value = "/{boardtype}/commentRegist")
	public String commentRegist(HttpServletRequest request,Comment comment) {
		System.out.println("commentRegist 호출!");
		int result = commentService.registComment(comment);
		String referer = request.getHeader("Referer");
		return "redirect:"+ referer;
	}
	
	
	//이건 대댓할때 사용
	@RequestMapping(value = "/{boardtype}/comments", produces = "application/text; charset=utf8" )
	@ResponseBody
	public String registComments(Comment comment, HttpServletRequest request) {
		String json= "";
		try {
			json = new ObjectMapper().writeValueAsString(comment);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		System.out.println("호출됨");
		return json;
	}
	
	@RequestMapping(value = "/col1/recommentRegist", produces = "application/text; charset=utf8")
	@ResponseBody
	public String recommentRegist(HttpServletRequest request, Recomment recomment) throws JsonProcessingException {
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("userInfo");
		
		String testRwriter="";
		String json= "";
		try {
			testRwriter = user.getName();
			recomment.setRwriter(testRwriter);
			recomment.setComments_id(Integer.parseInt(request.getParameter("comment_id")));
			commentService.recommentRegist(recomment);
			json = new ObjectMapper().writeValueAsString(recomment);
			System.out.println(json);
		} catch (Exception e) {
			System.out.println("에러 : "+e);
		}
		
		
		return json;
	}
	@RequestMapping(value = "/col1/recommentList",  produces = "application/text; charset=utf8")
	@ResponseBody
	public String recommentShowList(HttpServletRequest request) throws JsonProcessingException {
		int commnet_id = Integer.parseInt(request.getParameter("comment_id"));
		List list = commentService.recommentSelectList(commnet_id);
		//System.out.println(list);
		String json ="";
		json = new ObjectMapper().writeValueAsString(list);
		//System.out.println(json);
		return json;
	}
}
