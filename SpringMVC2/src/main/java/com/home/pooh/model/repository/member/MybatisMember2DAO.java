package com.home.pooh.model.repository.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.pooh.domain.Member;
@Repository
public class MybatisMember2DAO implements Member2DAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
		
	@Override
	public Member detail(int member_id) {
		return sqlSessionTemplate.selectOne("Member.memberDetail", member_id);
	}

	@Override
	public Member select(int member_id) {
		return null;
	}

	@Override
	public int update(Member member) {
		return sqlSessionTemplate.update("Member.memberUpdate", member); 
	}

	@Override
	public void regist(Member member) {
		
	}

	@Override
	public List selectAll() {
		
		return sqlSessionTemplate.selectList("Member.selectAll");
	}

	@Override
	public void delete() {
		
	}

	@Override
	public int idDupl(String user_id) {
		return sqlSessionTemplate.selectOne("Member.userIdCheck", user_id);
	}

}
