package com.home.pooh.domain;

import lombok.Data;

@Data
public class InputFiles {
	private int board_id;
	private int file_id;
	private String originfilename;
	private String refilename;
	private long filesize;
	private int filelevel;
	
}
