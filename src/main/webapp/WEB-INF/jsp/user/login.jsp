<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="d-flex justify-content-center bg-white my-1">
			<div class="login-box col-4">
				<div class="logo d-flex justify-content-center pt-3">
						<i class="bi bi-instagram icon-size-md"></i>		
						<h2 class="text-dark pt-1 pl-1">Dostagram</h2>
				</div>
				<div class="login pt-5">
					<div class="pt-4 ml-3 mr-3">
						<form id="loginForm">
							<div class="mb-2">
								<label class="text-dark font-weight-bold pt-3">아이디</label>
								<input type="text" class="col-12 form-control" id="idInput">
								<div class="text-warning small d-none" id="idCheck">아이디를 입력해주세요!</div>	
							</div>
							<div class="mb-3">
								<label class="text-dark font-weight-bold">비밀번호</label>
								<input type="password" class="col-12 form-control" id="passwordInput">
								<div class="text-warning small d-none" id="passwordCheck">비밀번호를 입력해주세요!</div>	
							</div>
							<div>
								<div class="d-flex justify-content-between mb-3">
									<a href="/user/join-view" class="btn col-3 btn-dark p-0">회원가입</a>
									<a href="/user/find-view" class="btn btn-dark p-0 col-6">아이디/비밀번호 찾기</a>
								</div>
								<button type="submit" class="btn btn-block col-12 btn-dark font-weight-bold" id="loginBtn">로그인</button>
							</div>
						</form>
					</div>
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
			
			// 엔터 키를 클릭했을 때 버튼이 클릭되 도록 form태그 안에 submit
			$("#loginForm").on("submit", function(e) {
				// 이벤트 고유 기능 취소
				e.preventDefault();
				
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				
				// 유효성 검사
				if(id == "") {
					$("#idCheck").removeClass("d-none");
					return;
				} else {
					$("#idCheck").addClass("d-none");
				}
				if(password == "") {
					$("#passwordCheck").removeClass("d-none");
					return;
				} else {
					$("#passwordCheck").addClass("d-none");
				}
				
				$.ajax({
					type:"post"
					, url:"/user/login"
					, data:{"loginId":id, "password":password}
					, success:function(data) {
						if(data.result == "success") {
							location.href="/post/timeline-view";
						} else {				 
							alert("아이디와 비밀번호를 확인해주세요.");
						}
					}
					, error:function() {
						alert("로그인 에러");
					}
				});
			});
		});
	</script>
</body>
</html>