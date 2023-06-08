package com.home.pooh.model.repository.rest;

import java.util.List;

import com.home.pooh.domain.Member;

public interface MemberDAO {
	public Member LoginCheck(Member member);
	public void regist(Member member);
	public void update(Member member);
	public void delete(Member member);
	public List selectAll();
}
