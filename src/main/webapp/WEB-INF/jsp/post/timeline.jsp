<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TimeLine</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="d-flex">
			<!-- menu -->
			<div class="menu bg-warning col-3 my-1">
				<!-- current-page -->
				<div class="py-4 text-center text-info"><h1>타임라인</h1></div>
				<!-- /current-page -->			
				<!-- menu-list -->
				<div class="pt-2 pl-1">
					<ul class="nav flex-column">
						<li class="nav-items py-1"><h3><a class="nav-link text-info font-weight-bold" href="/post/timeline-view"><i class="bi bi-houses-fill text-info pr-2"></i>홈</a></h3></li>
						<li class="nav-items"><h3><a class="nav-link text-info font-weight-bold" href="#"><i class="bi bi-chat-fill text-info pr-2"></i>메세지</a></h3></li>
						<li class="nav-items py-1"><h3><a class="nav-link text-info font-weight-bold" href="#"><i class="bi bi-person-plus-fill text-info pr-2"></i>친구추가</a></h3></li>
						<li class="nav-items"><h3><a class="nav-link text-info font-weight-bold" href="#"><i class="bi bi-search text-info pr-2"></i>검색</a></h3></li>
						<li class="nav-items py-1"><h3><a class="nav-link text-info font-weight-bold" href="#"><i class="bi bi-universal-access text-info pr-2"></i>마이페이지</a></h3></li>
						<li class="nav-items"><h3><a class="nav-link text-info font-weight-bold" href="#"><i class="bi bi-wrench-adjustable text-info pr-2"></i>설정</a></h3></li>				
					</ul>
				</div>
				<!-- /menu-list -->
			</div>
			<!-- /menu -->
			<!-- content -->
			<div class="content d-flex justify-content-center bg-primary col-6 m-1">
				<!-- timeLineList -->
				<div class="timeLineList col-8 h-25 bg-white p-0 custom-border">		
					<!-- inputBox -->
					<div>
						<textarea rows="3" placeholder="나의 지금 상태를 입력해주세요." class="form-control border-0"></textarea>
					</div>
					<!-- /inputBox -->
					<!-- inputButton -->
					<div class="d-flex justify-content-between py-2">
						<div>
							<i class="bi bi-rocket-takeoff-fill icon-size-sm"></i>
							<input type="file" class="d-none">
						</div>
						<button type="button" class="btn btn-sm">올리기</button>
					</div>
					<!-- /inputButton -->
					<!--  -->
					<div>
						<div class="bg-warning d-flex justify-content-between align-items-center px-2">
							<b>원영도</b>
							<i class="bi bi-three-dots icon-size-sm"></i>
						</div>
						<img class="w-100" alt="사진" src="/static/image/인스타그램 로고.jpg">
					</div>
					<!--  -->
				</div>
				<!-- /timeLineList -->
			</div>
			<!-- /content -->
			<!-- user -->
			<div class="user bg-info my-1"></div>
			<!-- /user -->
			<!--  -->
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>