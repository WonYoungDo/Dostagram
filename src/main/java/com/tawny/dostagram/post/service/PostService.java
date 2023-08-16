package com.tawny.dostagram.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.dostagram.post.domain.Post;
import com.tawny.dostagram.post.dto.PostDetail;
import com.tawny.dostagram.post.repository.PostRepository;
import com.tawny.dostagram.user.domain.User;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	// 사용자가 업로드한 게시물을 저장하는 기능
	public int addPost(int userId, String contents) {
		return postRepository.insertPost(userId, contents);
	}
	
	//
	public List<Post> getPostList() {
//		
//		List<Post> postList = postRepository.selectPost();
//															
//		List<PostDetail> postDetailList = new ArrayList<>();
		return postRepository.selectPost();											
	}
}
