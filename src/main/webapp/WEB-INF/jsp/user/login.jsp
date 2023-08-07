<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
				<div class="join pt-5">
					<div class="pt-4 ml-3 mr-3">
					
						<select class="form-control">
							<option class="text-center">원영도</option>
							<option class="text-center">유재석</option>
						</select> <br>
						<label class="text-info font-weight-bold pt-3">아이디</label>
						<input type="text" class="col-12 form-control mb-2" id="idInput">
						<label class="text-info font-weight-bold">비밀번호</label>
						<input type="password" class="col-12 form-control mb-4" id="passwordInput">
						<div>
							<div class="d-flex justify-content-between mb-3">
								<button type="button" class="btn col-3 btn-success font-weight-bold p-0" id="joinBtn">회원가입</button>
								<button type="button" class="btn col-6 btn-success font-weight-bold p-0" id="findBtn">아이디/비밀번호 찾기</button>
							</div>
							<button type="button" class="btn btn-block col-12 btn-success font-weight-bold" id="loginBtn">로그인</button>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>