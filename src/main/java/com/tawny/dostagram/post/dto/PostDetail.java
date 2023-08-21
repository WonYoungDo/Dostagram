package com.tawny.dostagram.post.dto;

import java.util.List;

import com.tawny.dostagram.comment.dto.CommentDetail;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class PostDetail {
	
	private int id;
	private int userId;
	private String contents;
	private String imagePath;
	private String userName;
	private String comment;
	
	// 댓글 목록
	private List<CommentDetail> commentList;
}
