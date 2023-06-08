package com.home.pooh.model.service.comment;

import java.util.List;

import com.home.pooh.domain.Comment;
import com.home.pooh.domain.Recomment;

public interface CommentService {
	public List commentSelectAll();
	public List commentSelectAll(int board_id);
	public int registComment(Comment comment);
	public void deleteComment(int board_id);
	public void updateComment(int board_id);
	
	
	public List recommentSelectList(int comments_id);
	public int recommentRegist(Recomment recommnet);
}
