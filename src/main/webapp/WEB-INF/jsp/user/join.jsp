<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>		
		<section class="d-flex justify-content-center">
			<div class="join-box col-4">
				<div class="logo d-flex justify-content-center">
					<div>
						<img height="50" alt="인스타그램 로고" src="/image/인스타그램 로고.jpg">
					</div>
					<div>
						<h2 class="text-info mt-1">Dostagram</h2>
					</div>
				</div>
				<div class="join pt-3 ml-3 mr-3">
					<label class="text-info font-weight-bold">이름</label><input type="text" class="col-12 form-control mb-1" id="nameInput">
					<div>
						<label class="text-info font-weight-bold">아이디</label>
						<div class="d-flex">
							<input type="text" class="col-9 form-control mb-1" id="idInput">
							<button type="button" class="btn btn-success col-3 p-0 mb-1 font-weight-bold btn-sm" id="duplicationBtn">중복확인</button>
						</div>
					</div>
					<label class="text-info font-weight-bold">비밀번호</label><input type="password" class="col-12 form-control mb-1" id="passwordInput">
					<label class="text-info font-weight-bold">비밀번호 확인</label><input type="password" class="col-12 form-control mb-1" id="passwordCheckInput">
					<label class="text-info font-weight-bold">전화번호</label><input type="text" class="col-12 form-control mb-1" id="phoneNumberInput">
					<label class="text-info font-weight-bold">이메일</label><input type="text" class="col-12 form-control mb-4" id="emailInput">
					<button type="button" class="btn btn-block col-12 btn-success font-weight-bold" id="joinBtn">회원가입</button>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			
			// 중복확인 버튼 클릭
//			$("#duplicationBtn").on("click", function() {
//				let id = $("#idInput").val();
//				
//				
//				
//			});
			
			
			// 회원가입 버튼 클릭
			$("#joinBtn").on("click", function() {
				let name = $("#nameInput").val();
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				let passwordCheck = $("#passwordCheckInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				let email = $("#emailInput").val();
				
				// 유효성 검사
				if(name == "") {
					alert("이름을 입력해주세요.");
					return;
				}
				if(id == "") {
					alert("아이디를 입력해주세요.");
					return;
				}
				if(password == "") {
					alert("비밀번호를 입력해주세요.");
					return;
				}
				if(passwordCheck != password) {
					alert("비밀번호가 같지 않습니다.");	
					return;
				}
				if(phoneNumber == "") {
					alert("전화번호를 입력해주세요.");
					return;
				}
				if(email == "") {
					alert("이메일을 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/join"
					, data:{"name":name, "loginId":id, "password":password, "phoneNumber":phoneNumber, "email":email}
					, success:function(data) {
						if(data.result == "success") {
							location.href="/user/login-view";
						} else {
							alert("회원가입 실패");
						}
					}
					, error:function() {
						alert("회원가입 페이지 에러");
					}
				});
				
			});
		});
	</script>
</body>
</html>