package com.home.pooh.model.repository.admin;

import java.util.List;

import com.home.pooh.domain.Admin;
import com.home.pooh.domain.Member;

public interface AdminDAO {
	public Admin Login(Admin admin);
	public void regist(Admin admin);
	public void update(Admin admin);
	public void delete(Admin admin);
	public List selectAll();
	public Member Login(Member member);
}
