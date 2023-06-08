package com.home.pooh.controller.client;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.home.pooh.domain.Board;
import com.home.pooh.domain.BoardFiles;
import com.home.pooh.domain.BoardVO;
import com.home.pooh.model.repository.common.page.Paging;
import com.home.pooh.model.service.board.BoardService;
import com.home.pooh.model.service.comment.CommentService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private Paging paging;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/{boardType}/board/list")
	public String selectAll(@PathVariable("boardType")String type, HttpServletRequest request,Model model) {
		List list = boardService.selectList(request.getParameter("searchItem"));
		paging.pagingInit(request, list, 1, 5);
		model.addAttribute("boardList", list);
		model.addAttribute("paging", paging);
		model.addAttribute("searchItem", request.getParameter("searchItem"));
		return "client/board/list";
	}
	
	@RequestMapping("/{boardType}/board/detail")
	public String detail(@PathVariable("boardType")String type, HttpServletRequest request,Model model) {
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		List commentList= commentService.commentSelectAll(board_id);
		Board board = boardService.detail(board_id);
		model.addAttribute("board", board);
		model.addAttribute("commentList", commentList);
		return "client/board/detail";
	}
	
	
	@RequestMapping("/{boardType}/board/update")
	public String boardUpdate(@PathVariable("boardType")String type,Board board) {
		int board_id = board.getBoard_id();
		boardService.update(board);
		return "redirect:/col1/board/detail?board_id="+board_id;
	}
	@RequestMapping("/{boardType}/board/delete")
	public String boardDelete(@PathVariable("boardType")String type,int board_id) {
		boardService.delete(board_id);
		
		return "redirect:/"+type;
	}
	@RequestMapping("/{boardType}/board/registform")
	public String boardRegistform(HttpServletRequest request) {
		return "client/board/regist";
	}
	@RequestMapping("{boardType}/board/regist")
	public String boardRegist(@PathVariable("boardType")String boardType, Board board) {
		boardService.regist(board);
		return "redirect:/"+boardType;
	}
	
	//================ col2 =======================
	//게시판 1,2,3통용될수 있게 만들 예정
	@RequestMapping("/{boardType}/boardRegistForm")
	public String showBoardRegistForm(@PathVariable("boardType")String boardType,HttpServletRequest request) {
		
		return "/client/board/"+boardType+"/regist";
	}
	//col2 게시글 등록하기 
	@RequestMapping(value = "/{boardType}/boardContentRegist", method = RequestMethod.POST)
	public String BoardRegist(@PathVariable("boardType")String boardType, HttpServletRequest request,BoardFiles board) {
		ServletContext context=  request.getServletContext();
		boardService.regist(board,context);
		
		return "redirect:/"+boardType;
	}
	@RequestMapping("/{boardType}/board/detail2")
	public String boardDetail2(@PathVariable("boardType")String type,HttpServletRequest request, Model model) {
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		BoardVO boardVO = boardService.detail2(board_id);
		model.addAttribute("boardVO", boardVO);
		return "/client/board/col2/detail";
	}
	
	/*
	 * @RequestMapping("/{boardType}/board/detail") public String
	 * detail(@PathVariable("boardType")String type, HttpServletRequest
	 * request,Model model) { int board_id =
	 * Integer.parseInt(request.getParameter("board_id")); List commentList=
	 * commentService.commentSelectAll(board_id); Board board =
	 * boardService.detail(board_id); model.addAttribute("board", board);
	 * model.addAttribute("commentList", commentList); return "client/board/detail";
	 * }
	 */
	
}
