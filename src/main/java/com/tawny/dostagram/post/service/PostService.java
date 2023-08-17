package com.tawny.dostagram.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tawny.dostagram.common.FileManager;
import com.tawny.dostagram.post.domain.Post;
import com.tawny.dostagram.post.dto.PostDetail;
import com.tawny.dostagram.post.repository.PostRepository;
import com.tawny.dostagram.user.domain.User;
import com.tawny.dostagram.user.service.UserService;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	
	// 사용자가 업로드한 게시물을 저장하는 기능
	public int addPost(int userId, String contents, MultipartFile file) {
		
		String imagePath = FileManager.saveFile(userId, file);
		
		return postRepository.insertPost(userId, contents, imagePath);
	}
	
	// 사용자들이 업로드한 게시물들을 보여주는 기능
	public List<Post> getPostList() {
		return postRepository.selectPost();					
	}
	
}
