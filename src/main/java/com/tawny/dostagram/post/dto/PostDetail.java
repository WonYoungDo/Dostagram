package com.tawny.dostagram.post.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class PostDetail {
	
	private int id;
	private String userId;
	private String contents;
	private String imagePath;
	private String userName;
}
