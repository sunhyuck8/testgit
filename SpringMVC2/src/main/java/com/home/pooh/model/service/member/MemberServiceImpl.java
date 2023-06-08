package com.home.pooh.model.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.pooh.domain.Member;
import com.home.pooh.model.repository.common.file.FileManager;
import com.home.pooh.model.repository.member.Member2DAO;
import com.home.pooh.model.repository.rest.MemberDAO;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private Member2DAO member2DAO;
	
	@Override
	public Member LoginCheck(Member member) {
		return memberDAO.LoginCheck(member);
	}

	@Override
	public void regist(Member member) {
		memberDAO.regist(member);
	}

	@Override
	public Member detail(int member_id) {
		return member2DAO.detail(member_id);
	}
	
	
	@Override
	public int update(Member member) {
		return member2DAO.update(member);
	}

	@Override
	public void delete(Member member) {
		
	}

	@Override
	public List selectAll() {
		return member2DAO.selectAll();
	}


	@Override
	public void select(int member_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int idDupl(String user_id) {
		return member2DAO.idDupl(user_id);
	}

}
