package com.home.pooh.domain;

import lombok.Data;

@Data
public class Board {
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
	
	
}
