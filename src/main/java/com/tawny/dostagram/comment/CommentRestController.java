package com.tawny.dostagram.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.dostagram.comment.service.CommentService;

@RestController
public class CommentRestController {
	
	@Autowired
	private CommentService commentService;
	
	// 댓글 쓰기 기능
	@PostMapping("/post/comment/create")
	public Map<String, String> createComment(
			@RequestParam("postId") int postId
			, @RequestParam("comment") String comment
			, HttpSession session) {
		int userId = (Integer)session.getAttribute("userId");
		
		int count = commentService.addComment(postId, comment, userId);
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
