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
	public int deleteLike(int postId, int userId) {
		return likeRepository.insertLike(postId, userId);
	}
	
	// postId와 일치하는 좋아요 개수 조회
	public int getCountByPostId(int postId) {
		return likeRepository.selectCountByPostId(postId);
	}
	
	// postId와 userId가 일치하는 행 조회(좋아요 여부 확인 기능)
	public boolean isLike(int postId, int userId) {
		int count = likeRepository.selectCountBypostIdUserId(postId, userId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// 게시물을 삭제시 좋아요도 함께 삭제
	public int deleteLikeByPostId(int postId) {
		return likeRepository.deleteLikeByPostId(postId);
	};
}
