package com.home.pooh.model.repository.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.pooh.domain.Admin;
import com.home.pooh.domain.Member;

@Repository
public class MybatisAdminDAO implements AdminDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Admin Login(Admin admin) {
		Admin obj = sqlSessionTemplate.selectOne("Admin.login", admin);
		return obj;
	}

	public void regist(Admin admin) {
		
	}

	public void update(Admin admin) {
		
	}

	public void delete(Admin admin) {
		
	}

	public List selectAll() {
		return null;
	}

	@Override
	public Member Login(Member member) {
		Member obj = sqlSessionTemplate.selectOne("Member.MemberLogin", member);
		return obj;
	}

}
