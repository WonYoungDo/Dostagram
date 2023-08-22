package com.tawny.dostagram.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.dostagram.comment.domain.Comment;
import com.tawny.dostagram.comment.dto.CommentDetail;
import com.tawny.dostagram.comment.repository.CommentRepository;
import com.tawny.dostagram.user.domain.User;
import com.tawny.dostagram.user.service.UserService;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private UserService userService;
	
	// 사용자가 입력한 댓글 추가
	public int addComment(int postId, String comment, int userId) {
		return commentRepository.insertComment(postId, comment, userId);
	}
	
	
	// 사용자들이 입력한 댓글 목록 불러오기
	public List<CommentDetail> getCommentList(int postId) {
		List<Comment> commentList = commentRepository.selectCommentByPostId(postId);
		List<CommentDetail> commentDetailList = new ArrayList<>(); 
	
		for(Comment comment : commentList) {
			
			User user = userService.getUserId(comment.getUserId());
			
			CommentDetail commentDetail = CommentDetail.builder()
													   .id(comment.getId())
													   .comment(comment.getComment())
													   .userId(comment.getUserId())
													   .userName(user.getName())
													   .build();
			commentDetailList.add(commentDetail);
		}
		return commentDetailList;
	}
	
	// 게시물을 삭제시 댓글 정보도 함께 삭제
	public int deleteCommentByPostId(int postId) {
		return commentRepository.deleteCommentByPostId(postId);
	}
}
