package com.home.pooh.model.repository.member;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.home.pooh.domain.Member;

@Repository
public interface Member2DAO {
	
	public Member detail(int member_id);
	public Member select(int member_id);
	public int update(Member member);
	public void regist(Member member);
	public void delete();
	public List selectAll();
	public int idDupl(String user_id);
}
