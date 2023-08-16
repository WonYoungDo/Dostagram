package com.tawny.dostagram.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.dostagram.post.domain.Post;

@Repository
public interface PostRepository {
	
	// 사용자가 업로드힌 게시물을 쿼리에 저장
	public int insertPost(
			@Param("userId") int userId
			, @Param("contents") String contents);
	
	// 여러 사용자들이 업로드한 게시물들을 가져오기
	public List<Post> selectPost();

}
