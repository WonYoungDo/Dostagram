package com.tawny.dostagram.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tawny.dostagram.post.domain.Post;
import com.tawny.dostagram.post.dto.PostDetail;
import com.tawny.dostagram.post.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	// 타임라인 화면 
	@GetMapping("/timeline-view")
	public String timeLine(Model model, HttpSession session) {
		
		// 컨트롤러는 service와 다르게 파라미터 대신 세션으로 userId를 가져온다.
		int userId = (Integer)session.getAttribute("userId");
		
		// 사용자들이 업로드한 정보를 보여주는 기능
		List<PostDetail> postList = postService.getPostList(userId);
		model.addAttribute("postList", postList);
		return "post/timeline";
	}
}
