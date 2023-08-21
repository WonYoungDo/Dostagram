package com.tawny.dostagram.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.dostagram.like.repository.LikeRepository;

@Service
public class LikeService {
	
	@Autowired
	private LikeRepository likeRepository;
	
	// 좋아요 기능
	public int like(int postId, int userId) {
		return likeRepository.insertLike(postId, userId);
	}
	
	// 좋아요 취소 기능
	public itn unlike(int postId, int userId) {
		return
	}
}
