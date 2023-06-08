package com.home.pooh.model.service.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.pooh.domain.Comment;
import com.home.pooh.domain.Recomment;
import com.home.pooh.model.repository.comment.CommentDAO;
@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public List commentSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List commentSelectAll(int board_id) {
		return commentDAO.commentSelectAll(board_id);
	}

	@Override
	public int registComment(Comment comment) {
		return commentDAO.commentRegist(comment);
	}

	@Override
	public void deleteComment(int board_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComment(int board_id) {
		// TODO Auto-generated method stub
		
	}

	
	
	@Override
	public List recommentSelectList(int comments_id) {
		return commentDAO.recommentSelectList(comments_id);
	}

	@Override
	public int recommentRegist(Recomment recommnet) {
		return commentDAO.recommentRegist(recommnet);
	}

}
