package com.tawny.dostagram.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.dostagram.like.repository.LikeRepository;

@Service
public class LikeService {
	
	@Autowired
	private LikeRepository likeRepository;
	
	public int like(int postId, int userId) {
		return likeRepository.insertLike(postId, userId);
	}
}
