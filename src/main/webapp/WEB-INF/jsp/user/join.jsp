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
						<h2 class="text-primary mt-1">Dostagram</h2>
					</div>
				</div>
				<div class="join pt-3 text-center">
					<label class="text-primary">이름</label><input type="text" class="col-8 form-control mb-1">
					<label class="text-primary">아이디</label><input type="text" class="col-8 form-control mb-1">
					<label class="text-primary">비밀번호</label><input type="password" class="col-8 form-control mb-1">
					<div class="d-flex">
						<div class="col-9">
							<label class="text-primary">비밀번호 확인</label><input type="password" class="form-control mb-1">
						</div>
						<button type="button" class="btn col-3">중복확인</button>
					</div>
					<label class="text-primary">전화번호</label><input type="text" class="col-8 form-control mb-1">
					<label class="text-primary">이메일</label><input type="text" class="col-8 form-control mb-4">
					<button type="button" class="btn btn-block col-8">회원가입</button>
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