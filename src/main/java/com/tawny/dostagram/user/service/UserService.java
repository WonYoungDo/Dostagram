package com.tawny.dostagram.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.dostagram.user.domain.User;
import com.tawny.dostagram.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	
	// 회원가입 기능
	public int addJoin(
			String LoginId
			, String password
			, String email
			, String name
			, String phoneNumber) {
		int count = userRepository.insertJoin(LoginId, password, name, phoneNumber, email);
		return count;
	}
	
	// 로그인 기능
	public List<User> getLogin() {
		List<User> userList = userRepository.selectUserList();
		return userList;
	}
}
