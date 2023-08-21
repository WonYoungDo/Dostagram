package com.tawny.dostagram.comment.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class CommentDetail {
	
	private int id;
	private int userId;
	private String userName;
	private String comment;
	
}
