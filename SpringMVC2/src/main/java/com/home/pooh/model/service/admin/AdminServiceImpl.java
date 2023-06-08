package com.home.pooh.model.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.pooh.domain.Admin;
import com.home.pooh.domain.Member;
import com.home.pooh.model.repository.admin.AdminDAO;
@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
		
	public Admin login(Admin admin) {
		return adminDAO.Login(admin);
	}

	@Override
	public void regist(Admin admin) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Admin admin) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Admin admin) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member login(Member member) {
		return adminDAO.Login(member);
	}
	
}
