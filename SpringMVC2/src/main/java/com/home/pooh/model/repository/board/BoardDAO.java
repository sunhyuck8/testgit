package com.home.pooh.model.repository.board;

import java.util.List;

import com.home.pooh.domain.Board;
import com.home.pooh.domain.BoardFiles;
import com.home.pooh.domain.InputFiles;

public interface BoardDAO {
	public List selectAll();
	public List selectAll(int type);
	public Board detail(int board_id);
	public void delete(int board_id);
	public void update(Board board);
	public List selectList(String searchItem);
	public int insert(Board board);
	public int insert(BoardFiles boardFiles);
	public List selectListAll(String writer);
	public void updateViewcnt(int board_id);
	public int insertFiles(InputFiles inputFile);
	public void updateThumnail(InputFiles inputFile);
	public List selectAllFiles(int board_id);
}
