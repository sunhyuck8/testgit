package com.home.pooh.domain;

import lombok.Data;

@Data
public class Comment {
	private int board_id;
	private int comments_id;
	private String cmsg;
	private String cwriter;
	private String cregdate;
	private int clike_cnt;
	
}
