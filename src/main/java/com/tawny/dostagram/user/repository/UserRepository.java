package com.tawny.dostagram.user.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository {
	
	// 회원가입 (사용자가 입력한 정보를 입력받고 쿼리에 저장하는 기능)
	public int insertJoin(
			@Param("loginId") String loginId  
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
}
