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
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="d-flex">
			<!-- menu -->
			<div class="menu col-3 my-1 bg-white">
				<!-- current-page -->
				<div class="py-4 text-center text-dark"><h1>타임라인</h1></div>
				<!-- /current-page -->			
				<!-- menu-list -->
				<div class="pt-2 pl-1">
					<ul class="nav flex-column">
						<li class="nav-items py-1"><h3><a class="nav-link text-dark font-weight-bold" href="/post/timeline-view"><i class="bi bi-houses-fill text-dark pr-2"></i>홈</a></h3></li>
						<li class="nav-items"><h3><a class="nav-link text-dark font-weight-bold" href="#"><i class="bi bi-chat-fill text-dark pr-2"></i>메세지</a></h3></li>
						<li class="nav-items py-1"><h3><a class="nav-link text-dark font-weight-bold" href="#"><i class="bi bi-person-plus-fill text-dark pr-2"></i>친구추가</a></h3></li>
						<li class="nav-items"><h3><a class="nav-link text-dark font-weight-bold" href="#"><i class="bi bi-search text-dark pr-2"></i>검색</a></h3></li>
						<li class="nav-items py-1"><h3><a class="nav-link text-dark font-weight-bold" href="#"><i class="bi bi-universal-access text-dark pr-2"></i>마이페이지</a></h3></li>
						<li class="nav-items"><h3><a class="nav-link text-dark font-weight-bold" href="#"><i class="bi bi-wrench-adjustable text-dark pr-2"></i>설정</a></h3></li>				
					</ul>
				</div>
				<!-- /menu-list -->
			</div>
			<!-- /menu -->
			
			<!-- content -->
			<div class="content d-flex justify-content-center col-6 m-1 bg-white">
			
				<!-- timeLine -->
				<div class="timeLine col-8 p-0 py-1">		
					<!-- inputBox -->
					<div class="input-box custom-border rounded">
						<textarea rows="3" placeholder="나의 지금 상태를 입력해주세요." class="form-control border-0" id="contentsInput"></textarea>
						<div class="d-flex justify-content-between px-2 pt-2">
							<div>
								<i class="bi bi-rocket-takeoff-fill icon-size-sm" id="addIcon"></i>
								<input type="file" class="d-none" id="addFile">
							</div>
							<div class="text-danger small pt-2 d-none" id="guideInput">내용을 입력해주세요!</div>
							<button type="button" class="btn btn-sm" id="uploadBtn">올리기</button>
						</div>
					</div>
					<!-- /inputBox -->
				
					<!-- timeLineList -->
					<c:forEach var="post" items="${postList }">
					<div class="mt-2 custom-border rounded">
						<div class="d-flex justify-content-between align-items-center px-2">
							<b>${post.userName }</b>
							<i class="bi bi-three-dots icon-size-sm"></i>
						</div>
						<div>
							<img alt="인스타그램 로고" height="300" class="col-12 p-0" src="/static/image/인스타그램 로고.jpg"> 
						</div>
						<div class="d-flex">
							<i class="bi bi-heart-fill icon-size-xs pl-1"></i>
							<i class="bi bi-chat-dots-fill icon-size-xs px-2"></i>
							<i class="bi bi-send-fill icon-size-xs"></i>						
						</div>
						<div class="border-top d-flex p-1">
							<b class="pl-1 pr-4">원영도 : </b>
							안녕하세요
						</div>
						<div class="border-top small d-flex align-items-center justify-content-between p-1">
							<b class="pl-1 pr-4">유재석 : </b>
							다른 사용자들이 입력한 댓글들...
							<button type="button" class="btn btn-sm p-0 ml-5">입력</button>
						</div>
					</div>
					</c:forEach>
					<!-- /timeLineList -->
				
				</div>
				<!-- /timeLine -->
			
			</div>
			<!-- /content -->
			
			<!-- user -->
			<div class="user bg-white my-1"></div>
			<!-- /user -->
			<!--  -->
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			
			// 나의 상태 버튼 
			$("#uploadBtn").on("click", function() {
				let contents = $("#contentsInput").val();
				let file = $("#addFile")[0];
			
				// 유효성 검사
				if(contents == "") {
					$("#guideInput").removeClass("d-none");
					return;
				} else {
					$("#guideInput").addClass("d-none");
				}
				// 파일이 선택되지 않은 경우
				if(file.files.length == 0) {
					alert("파일을 선택하세요");
					return;
				}
				
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:{"contents":contents}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {							
							alert("업로드 실패");
						}
					}
					, error:function() {
						alert("업로드 에러");
					}
				});
			});
			
			// 아이콘 클릭시 사진 첨부 기능 수행
			$("#addIcon").on("click", function() {
				$("#addFile").click();
			});
		});
	</script>
	
</body>
</html>