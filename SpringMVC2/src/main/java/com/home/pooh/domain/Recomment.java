package com.home.pooh.domain;

import lombok.Data;

@Data
public class Recomment {
	
	private int recomments_id;
	private String rmsg;
	private String rwriter;
	private String rregdate;
	private int rlike_cnt;
	private int comments_id;
	
}
