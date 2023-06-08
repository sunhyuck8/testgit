package com.home.pooh.model.repository.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.pooh.domain.Comment;
import com.home.pooh.domain.Recomment;

@Repository
public class MybatisCommentDAO implements CommentDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
		
	@Override
	public List commentSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List commentSelectAll(int board_id) {
		return sqlSessionTemplate.selectList("Comment.commentSelectAllbyInt", board_id);
	}

	@Override
	public int commentRegist(Comment comment) {
		return sqlSessionTemplate.insert("Comment.commentRegist", comment);
	}

	@Override
	public void deleteComment(int board_id) {
		
	}

	@Override
	public void updateComment(int board_id) {
		
	}
	
	
	
	@Override
	public List recommentSelectList(int comments_id) {
		return sqlSessionTemplate.selectList("Recomment.recommentSelectList", comments_id);
	}
	@Override
	public int recommentRegist(Recomment recommnet) {
		return sqlSessionTemplate.insert("Recomment.recommentRegist", recommnet);
	}



}
