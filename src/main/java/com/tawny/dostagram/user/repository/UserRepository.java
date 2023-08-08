package com.tawny.dostagram.user.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tawny.dostagram.user.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	
	// 아이디가 중복 되는지 확인해주는 메소드
	public int countByLoginId(String loginId);

}
