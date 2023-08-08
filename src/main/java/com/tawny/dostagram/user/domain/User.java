package com.tawny.dostagram.user.domain;

import java.time.ZonedDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor // 기본 생성자를 사용하게 해줌
@AllArgsConstructor // 생성자 자동 생성 (기존에 있던 기본 생성자는 자동으로 사라짐)
@Builder(toBuilder=true)
@Getter // 맴벼 변수 사용
@Table(name="user") // 테이블 연결
@Entity
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="loginId")
	private String loginId;
	
	private String password;
	private String name;
	
	@Column(name="phoneNumber")
	private String phoneNumber;
	private String email;
	
	@UpdateTimestamp
	@Column(name="createdAT", updatable=false)
	private ZonedDateTime createdAT;
	
	@UpdateTimestamp
	@Column(name="updatedAT")
	private ZonedDateTime updatedAT;
}
