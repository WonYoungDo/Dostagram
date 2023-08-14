package com.tawny.dostagram.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	// 타임라인 화면 
	@GetMapping("/timeline-view")
	public String timeLine(Model model) {

		
		
		return "post/timeline";
	}
}
