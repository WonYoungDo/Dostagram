package com.tawny.dostagram.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
