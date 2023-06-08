package com.home.pooh.domain;

import java.util.List;

import lombok.Data;

@Data
public class BoardVO{
	private int board_id;
	private String title;
	private String writer;
	private String content;
	private String filename;
	private String regdate;
	private int like_cnt;
	private int view_cnt;
	private int type;
	
	
	//tpye;
	private BoardType boardType;
	
	//files
	private List inputFiles;
	
	
	public void setBoard(Board board) {
		this.board_id=board.getBoard_id();
		this.title=board.getTitle();
		this.writer=board.getWriter();
		this.content=board.getContent();
		this.filename=board.getFilename();
		this.regdate=board.getRegdate();
		this.like_cnt=board.getLike_cnt();
		this.view_cnt=board.getView_cnt();
		this.type=board.getType();
		this.boardType=board.getBoardType();
	}
	
}
