package com.home.pooh.model.repository.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.pooh.domain.Board;
import com.home.pooh.domain.BoardFiles;
import com.home.pooh.domain.InputFiles;
@Repository
public class MybatisBoardDAO implements BoardDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public List selectAll() {
		return sqlSessionTemplate.selectList("Board.boardSelectAll");
	}
	
	@Override
	public List selectAll(int type) {
		return sqlSessionTemplate.selectList("Board.boardSelectAllByType", type);
	}

	@Override
	public Board detail(int board_id) {
		return sqlSessionTemplate.selectOne("Board.boardDetail", board_id);
	}


	@Override
	public void delete(int board_id) {
		sqlSessionTemplate.delete("Board.boardDelete", board_id);
	}


	@Override
	public void update(Board board) {
		sqlSessionTemplate.update("Board.boardUpdate", board);
	}


	@Override
	public List selectList(String searchItem) {
		return sqlSessionTemplate.selectList("Board.boardSelectList", searchItem);
	}


	@Override
	public int insert(Board board) {
		System.out.println(board+"들어온 객체");
		return sqlSessionTemplate.insert("Board.boardRegist", board);
	}


	@Override
	public List selectListAll(String writer) {
		return sqlSessionTemplate.selectList("Board.boardSelectListWriter", writer);
	}


	@Override
	public void updateViewcnt(int board_id) {
		sqlSessionTemplate.update("Board.BoardUpdateViewcnt", board_id);
	}


	@Override
	public int insert(BoardFiles boardFiles) {
		return sqlSessionTemplate.insert("BoardFiles.boardRegist", boardFiles);
	}


	@Override
	public int insertFiles(InputFiles inputFile) {
		return sqlSessionTemplate.insert("InputFiles.InsertInputFiles", inputFile);
	}


	@Override
	public void updateThumnail(InputFiles inputFile) {
		sqlSessionTemplate.update("Board.setTumbnail", inputFile);
	}

	@Override
	public List selectAllFiles(int board_id) {
		return sqlSessionTemplate.selectList("InputFiles.selectAllInputFiles", board_id);
	}


	

}
