package com.tawny.dostagram.user.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tawny.dostagram.user.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	
	// 아이디가 중복 되는지 확인해주는 메소드
	public int countByLoginId(String loginId);
	
	// 로그인 화면에서 아이디와 비밀번호가 일치하는지 확인해주는 메소드
	public List<User> findByLoginIdAndPassword(String loginId, String password);
	
}
