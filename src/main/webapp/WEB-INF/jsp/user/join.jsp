<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>		
		<section class="d-flex justify-content-center bg-white my-1">
			<div class="join-box col-4">
				<div class="logo d-flex justify-content-center pt-2">
					<i class="bi bi-instagram icon-size-md"></i>				
					<h2 class="text-dark pt-1 pl-1">Dostagram</h2>
				</div>
				<div class="join pt-3 ml-3 mr-3">
					<div class="name-box">
						<label class="text-dark font-weight-bold">이름</label><input type="text" class="col-12 form-control mb-1" id="nameInput">
						<div class="text-warning small d-none" id="nameCheck">이름을 입력해주세요!</div>	
					</div>
					<div class="id-box">
						<label class="text-dark font-weight-bold">아이디</label>
						<div class="d-flex">
							<input type="text" class="col-9 form-control mb-1" id="idInput">
							<button type="button" class="btn btn-dark col-3 p-0 mb-1 font-weight-bold btn-sm" id="duplicateBtn">중복확인</button>
						</div>
						<div class="text-warning small d-none" id="idCheck">아이디를 입력해주세요!</div>
						<div class="text-primary small d-none" id="duplicatedCheck">중복확인을 해주세요!</div>	
						<div class="text-success small d-none" id="availableId">사용가능한 아이디입니다.</div>
						<div class="text-danger small d-none" id="duplicateId">중복된 아이디입니다.</div>	
					</div>
					<div>
						<label class="text-dark font-weight-bold">비밀번호</label><input type="password" class="col-12 form-control mb-1" id="passwordInput">
						<div class="text-warning small d-none" id="passwordCheck">비밀번호를 입력해주세요!</div>	
					</div>
					<div>
						<label class="text-dark font-weight-bold">비밀번호 확인</label><input type="password" class="col-12 form-control mb-1" id="passwordCheckInput">
						<div class="text-danger small d-none" id="missMatchPassword">비밀번호가 일치하지 않습니다!</div>	
					</div>
					<div>
						<label class="text-dark font-weight-bold">전화번호</label><input type="text" class="col-12 form-control mb-1" id="phoneNumberInput">
						<div class="text-warning small d-none" id="phoneNumberCheck">전화번호를 입력해주세요!</div>	
					</div>
					<div>
						<label class="text-dark font-weight-bold">이메일</label><input type="text" class="col-12 form-control mb-4" id="emailInput">
						<div class="text-warning small d-none" id="emailCheck">이메일을 입력해주세요!</div>	
					</div>
					<button type="button" class="btn btn-block col-12 btn-dark font-weight-bold" id="joinBtn">회원가입</button>
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
			
			// 아이디 중복 확인 여부
			var duplicateId = true; // 중복됨으로 세팅
			
			// 중복확인 버튼 확인 여부
			var checked = false; // 누르지 않은 상태로 세팅

			// id input 이벤트 초기화
			$("#idInput").on("input", function() {
				duplicateId	= true;
				checkd = false;
				$("#duplicateId").addClass("d-none");
				$("#availableId").addClass("d-none");
			});
			
			// 중복확인 버튼 클릭
			$("#duplicateBtn").on("click", function() {
				let id = $("#idInput").val();
				
				if(id == "") {
					$("#idCheck").removeClass("d-none");
					return;
				} else {
					$("#idCheck").addClass("d-none");
				} 
				
				$.ajax({
					type:"get"
					, url:"/user/duplication"
					, data:{"loginId":id}
					, success:function(data) {
						
						// 중복 확인을한 상태
						checked = true;
						
						// isDuplicate가 false이면 중복x / true면 중복o
						duplicateId = data.isDuplicate;
						
						if(data.isDuplicate) { // 중복 = isDuplicate가 true를 리턴할 때
							$("#duplicateId").removeClass("d-none");
							$("#availableId").addClass("d-none");
						} else { // 증복되지않음 = isDuplicate가 false를 리턴할 때
							$("#availableId").removeClass("d-none");
							$("#duplicateId").addClass("d-none");
						}
					}
					, error:function() {
						alert("중복확인 에러");
					}
				});
			});
			
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
					$("#nameCheck").removeClass("d-none");
					return;
				} else {
					$("#nameCheck").addClass("d-none");
				}
				
				if(id == "") {
					$("#idCheck").removeClass("d-none");
					return;
				} else {
					$("#idCheck").addClass("d-none");
				} 
				
				// 중복확인 버튼을 누르지 않았을 경우
				if(!checked) { //checked가 false일 경우 알림을 띄운다
					$("#duplicatedCheck").removeClass("d-none");
				}
				
				// 중복된 아이디일 경우
				if(duplicateId) { // duplicateId가 true일 경우 알림을 띄운다.
					$("#duplicateId").removeClass("d-none");
				}
				
				if(password == "") {
					$("#passwordCheck").removeClass("d-none");
					return;
				} else {
					$("#passwordCheck").addClass("d-none");
				}
				if(passwordCheck != password) {
					$("#missMatchPassword").removeClass("d-none");
					return;
				} else {
					$("#missMatchPassword").addClass("d-none");
				}
				if(phoneNumber == "") {
					$("#phoneNumberCheck").removeClass("d-none");
					return;
				} else {
					$("#phoneNumberCheck").addClass("d-none");
				}
				if(email == "") {
					$("#emailCheck").removeClass("d-none");
					return;
				} else {
					$("#emailCheck").addClass("d-none");
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