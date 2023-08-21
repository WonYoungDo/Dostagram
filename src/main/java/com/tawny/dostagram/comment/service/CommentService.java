package com.tawny.dostagram.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.dostagram.comment.repository.CommentRepository;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;
	
	// 사용자가 입력한 댓글 추가
	public int addComment(int postId, String comment, int userId) {
		return commentRepository.insertComment(postId, comment, userId);
	}
	
}
