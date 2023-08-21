package com.tawny.dostagram.comment.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.dostagram.comment.domain.Comment;

@Repository
public interface CommentRepository {
	
	// 사용자가 입력한 댓글 쿼리에 추가
	public int insertComment(
			@Param("postId") int postId
			, @Param("comment") String comment
			, @Param("userId") int userId);
	
	// 댓글 리스트 불러오기
	public List<Comment> selectCommentByPostId(int postId);
	
	// 댓글 삭제 
	public int deleteComment(@Param("postId") int postId);
}
