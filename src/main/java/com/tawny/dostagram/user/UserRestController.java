package com.tawny.dostagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
			@RequestParam("name") String name	
			, @RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email) {
		User user = userService.addUser(name, loginId, password, phoneNumber, email);
		
		Map<String, String> resultMap = new HashMap<>();
		if(user != null) { // 전달 받은 값이 비어있지 않을 때
			resultMap.put("result", "success");
		} else { 
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	// 중복확인 기능
	@GetMapping("/duplication")
	public Map<String, Boolean> duplication(@RequestParam("loginId") String loginId) {
		
		boolean isDuplicate = userService.isDuplicatedId(loginId);
	
		Map<String, Boolean> resultMap = new HashMap<>();
		if(isDuplicate) { // 아이디가 중복이 된 상태일 때
			resultMap.put("isDuplicate", true);
		} else {
			resultMap.put("isDuplicate", false);
		}
		return resultMap;
	}
	
	// 로그인 기능
	@PostMapping("/login")
	public Map<String, String> login(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpSession session) {
		User user = userService.getUser(loginId, password);
		Map<String, String> resultMap = new HashMap<>();
		if(user != null) { // 입력받은 회원 정보가 저장되어 있을 때
			resultMap.put("result", "success");
			
			// 필요한 사용자 정보를 세션에 저장
			// user 테이블 id, user의 이름을 세션에 저장
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	
	
}
