package com.tawny.dostagram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tawny.dostagram.user.domain.User;
import com.tawny.dostagram.user.service.UserService;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	// 회원가입 기능
	@PostMapping("/join")
	public Map<String, String> join(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("email") String email
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {		
		int count = userService.addJoin(loginId, password, email, name, phoneNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 로그인 기능
	public Map<String, String> login(@RequestParam("loginId") String loginId, @RequestParam("password") String password) {
		
		
	}
	
	
	
	
}
