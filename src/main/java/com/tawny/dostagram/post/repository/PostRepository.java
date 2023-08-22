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
			, @Param("contents") String contents
			, @Param("imagePath") String imagePath);
	
	// 여러 사용자들이 업로드한 게시물들을 가져오기
	public List<Post> selectPost();
	
	
	// 게시물의 아이디를 기반으로 한 행을 조회 
	public Post selectPostId(@Param("id") int id);
	
	// postId를 기반으로 한 행 삭제
	public int deletePost(@Param("postId") int PostId);
}
