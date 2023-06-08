package com.home.pooh.model.service.admin;

import java.util.List;

import com.home.pooh.domain.Admin;
import com.home.pooh.domain.Member;

public interface AdminService {
	public Admin login(Admin admin);
	public void regist(Admin admin);
	public void update(Admin admin);
	public void delete(Admin admin);
	public List selectAll();
	public Member login(Member member);
}
