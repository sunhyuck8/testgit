package com.home.pooh.model.repository.rest;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.pooh.domain.Member;

@Repository
public class MybatisMemberDAO implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Member LoginCheck(Member member) {
		System.out.println(member);
		return sqlSessionTemplate.selectOne("Member.authCheck", member);
	}

	@Override
	public void regist(Member member) {
		sqlSessionTemplate.insert("Member.insertMember", member);
	}

	@Override
	public void update(Member member) {
		
	}

	@Override
	public void delete(Member member) {
		
	}

	@Override
	public List selectAll() {
		return null;
	}

}
