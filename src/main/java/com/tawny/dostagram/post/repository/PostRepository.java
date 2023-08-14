package com.tawny.dostagram.post.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tawny.dostagram.post.domain.Post;

@Repository
public interface PostRepository {
	
	public int insertPost(
			@Param("userId") int userId
			, @Param("contents") String contents);

}
