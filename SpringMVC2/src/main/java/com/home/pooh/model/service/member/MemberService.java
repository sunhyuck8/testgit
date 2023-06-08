package com.home.pooh.model.service.member;

import java.util.List;

import com.home.pooh.domain.Member;

public interface MemberService {
	public Member LoginCheck(Member member);
	public void regist(Member member);
	public Member detail(int member_id);
	public void select(int member_id);
	public int update(Member member);
	public void delete(Member member);
	public List selectAll();
	public int idDupl(String user_id);
}
