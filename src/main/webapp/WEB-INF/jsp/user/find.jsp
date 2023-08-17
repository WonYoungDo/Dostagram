<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 찾기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="my-1 bg-secondary d-flex justify-content-center">
			<!-- side -->
			<div class="col-2 bg-white"></div>
			<!-- /side -->
			<!-- findBox -->
			<div class="find col-8 bg-white">
				<!-- logo -->
				<div class="find-logo d-flex justify-content-center align-items-center">
					<i class="bi bi-instagram icon-size-md"></i>		
					<h2 class="text-dark pt-1 pl-1">Dostagram</h2>
				</div>
				<!-- /logo -->
				<!-- findInfo -->
				<div class="find-info d-flex pb-1">
					<!-- findID -->
					<div class="find-id bg-white col-6 p-5 border rounded">
						<h4>아이디 찾기</h4>
						<label class="pt-3"><b>이름 입력</b></label>
						<input type="text" class="form-control">
						<label class="pt-3"><b>이메일 입력</b></label>
						<input type="text" class="form-control">
						<label class="pt-3"><b>인증번호 입력</b></label>
						<input type="text" class="form-control">
						<div class="d-flex align-items-center pt-5 pb-2">
							<label class="col-3 small"><b>아이디:</b></label>
							<input type="text" class="form-control col-9">
						</div>
						<button type="button" class="btn btn-block btn-dark">아이디 찾기</button>
					</div>
					<!-- /findID -->
					<!-- findPW -->
					<div class="find-pw bg-white col-6 p-5 border-top border-right border-bottom rounded rounded">
						<h4>비밀번호 찾기</h4>
						<label class="pt-3"><b>아이디 입력</b></label>
						<input type="text" class="form-control">
						<label class="pt-3"><b>이메일 입력</b></label>
						<input type="text" class="form-control">
						<label class="pt-3"><b>인증번호 입력</b></label>
						<input type="text" class="form-control">
						<div class="d-flex align-items-center pt-5 pb-2">
							<label class="col-4 small"><b>비밀번호:</b></label>
							<input type="text" class="form-control col-8">
						</div>
						<button type="button" class="btn btn-block btn-dark">비밀번호 찾기</button>
					</div>
					<!-- /findPW -->
				</div>
				<!-- /findInfo -->
			</div>
			<!-- /findBox -->
			<!-- side -->
			<div class="col-2 bg-white"></div>
			<!-- /side -->
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			
		});
	</script>
</body>
</html>