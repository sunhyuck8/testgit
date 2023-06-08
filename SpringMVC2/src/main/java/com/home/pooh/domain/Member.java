package com.home.pooh.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	private int member_id;
	private String user_id;
	private String password;
	private String name;
	private MultipartFile photo;
	private String filename;
	private String regdate;
	private int auth;
	
}
