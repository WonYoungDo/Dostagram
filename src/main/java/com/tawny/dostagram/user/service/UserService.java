package com.tawny.dostagram.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.dostagram.common.EncryptUtils;
import com.tawny.dostagram.user.domain.User;
import com.tawny.dostagram.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	// 회원가입 (사용자가 입력한 정보를 얻어 저장하는 기능)
	public User addUser(
			String name
			, String loginId
			, String password
			, String phoneNumber
			, String email) {

		// password를 전달 받고 암호화를 거쳐 변수에 저장
		String encryptPassword = EncryptUtils.md5(password);
		
		// builder를 통해서 객체를 생성
		User user = User.builder()
				.loginId(loginId)
				.name(name)
				.password(encryptPassword)
				.phoneNumber(phoneNumber)
				.email(email).build();
		
		// builder로 생성한 객체를 변수로 저장
		user = userRepository.save(user);
		return user;
	}
	
	// 중복확인 (같은 아이디가 존재하는지 확인하는 기능)
	public boolean isDuplicatedId(String loginId) {
		int count = userRepository.countByLoginId(loginId);
		
//		if(count == 0) { // 중복되지 않음
//			return false;
//		} else { // 중복됨
//			return true;
//		}
		// 중복이 되었을 떄를 리턴
		return count != 0;
	}
	
	// 로그인 기능
	public User getUser(String loginId, String password) {
		
		// 암호화한 비밀번호를 변수에 저장
		String encryptPassword = EncryptUtils.md5(password);
		
		List<User> userList = userRepository.findByLoginIdAndPassword(loginId, encryptPassword);
		if(userList.isEmpty()) { // 입력받은 정보가 없을 경우
			return null;
		} else {
			return userList.get(0);
		}
	}
	
	
}
