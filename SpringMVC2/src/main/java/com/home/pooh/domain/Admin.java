package com.home.pooh.domain;

import lombok.Data;

@Data
public class Admin {
	private int admin_id;
	private String host_id;
	private String password;
	private String name;
	private String email;
}
