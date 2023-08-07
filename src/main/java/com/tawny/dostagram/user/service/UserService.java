package com.tawny.dostagram.user.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.dostagram.common.EncryptUrils;
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
	public User getLogin(String loginId, String password, HttpSession session) {
		
		String ecryptPassword = EncryptUrils.md5(password);
		
		User userList = userRepository.selectUserList(loginId, ecryptPassword);
		if(userList == null) { // 존재하지 않을 경우
			return null;
		} else { // 존재할 경우
//			userList.get(0);
		}
		return userList;
	}
}
