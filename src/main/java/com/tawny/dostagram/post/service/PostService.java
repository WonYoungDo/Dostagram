package com.tawny.dostagram.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.dostagram.post.domain.Post;
import com.tawny.dostagram.post.repository.PostRepository;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	public int addPost(int userId, String contents) {
		return postRepository.insertPost(userId, contents);
	}
}
