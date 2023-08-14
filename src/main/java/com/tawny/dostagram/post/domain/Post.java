package com.tawny.dostagram.post.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Post {
	
	private int id;
	private int userId;
	private String contents;
	private String imagePath;
	private Date createdAT;
	private Date updatedAT;
}
