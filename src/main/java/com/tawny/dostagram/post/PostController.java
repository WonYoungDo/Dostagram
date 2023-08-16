package com.tawny.dostagram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tawny.dostagram.post.domain.Post;
import com.tawny.dostagram.post.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	// 타임라인 화면 
	@GetMapping("/timeline-view")
	public String timeLine(Model model) {
		
		// 사용자들이 업로드한 정보를 보여주는 기능
		List<Post> postList = postService.getPostList();
		model.addAttribute("postList", postList);
		return "post/timeline";
	}
}
