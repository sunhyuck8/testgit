package com.home.pooh.model.service.board;

import java.util.List;

import javax.servlet.ServletContext;

import com.home.pooh.domain.Board;
import com.home.pooh.domain.BoardFiles;
import com.home.pooh.domain.BoardVO;

public interface BoardService {
	public List selectAll();
	public List selectAll(int type);//게시판별 게시물 보고싶어서
	public Board detail(int board_id);
	public void delete(int board_id);
	public void update(Board board);
	public List selectList(String searchItem);
	public int regist(Board board);
	public int regist(BoardFiles boardFiles,ServletContext context);
	
	public List selectListAll(String writer);
	public List selectFileList(int board_id);
	
	public BoardVO detail2(int board_id);
}
