package com.tawny.dostagram.like.repository;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeRepository {
	
	// 사용자가 누른 좋아요를 저장
	public int insertLike(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	// 게시물에 저장된 좋아요의 개수를 확인
	public int selectCountByPostId(@Param("postId") int postId);
	
	// 게시물마다 특정 사용자가 좋아요를 눌렀는지 저장
	public int selectCountBypostIdUserId(
			@Param("postId") int postId
			, @Param("userId") int userId);
			
	// userId와 postId를 기반으로 좋아요를 취소
	public int deleteLike(
			@Param("postId") int postId
			, @Param("userId") int userId);

	// 게시물을 삭제 시 해당 좋아요 정보도 삭제
	public int deleteLikeByPostId(@Param("postId") int postId);
}
