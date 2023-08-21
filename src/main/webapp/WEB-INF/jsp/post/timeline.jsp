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
						<div class="d-flex justify-content-between align-items-center px-2 bg-secondary text-white">
							<b>${post.userName}</b>
							<i class="bi bi-three-dots icon-size-sm" data-toggle="modal" data-target="#moreModal"></i>
						</div>
						<div>
							<img alt="${post.id}" class="w-100" src="${post.imagePath }">
						</div>
						<div class="d-flex justify-content-between align-items-center">
							<div class="d-flex align-items-center">
								<i data-post-id="${post.id }" class="bi bi-heart-fill icon-size-xs px-1 like-btn"></i>
								좋아요 2개
							</div>
							<div>							
								<i class="bi bi-send-fill icon-size-xs pr-2"></i>						
							</div>
						</div>
						<div class="border-top d-flex p-1">
							<b class="pl-1 pr-4">${post.userName} </b>
							${post.contents }
						</div>
						<div class="small p-1">
							<b>댓글</b> <br>
							<c:forEach var="comment" items="${post.commentList }">
								<b>${comment.userName }</b> ${comment.comment } <br>
							</c:forEach>			
						</div>
						<div class="border-top d-flex align-items-center justify-content-between p-1">
							<input type="text" class="form-control col-10" id="commentInput${post.id }">
							<button type="button" class="btn comment-btn" data-post-id="${post.id }">입력</button>
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
	<!-- Modal -->
	<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-body">
	        삭제하기
	      </div>
	    </div>
	  </div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			
			// 댓글 입력 버튼
			$(".comment-btn").on("click", function() {
				
				// 댓글 작성 게시글 id과 댓글 내용 필요
				let postId = $(this).data("post-id");

//				let comment = $("#commentInput" + postId).val();
				let comment = $(this).prev().val();				

				$.ajax({
					type:"post"
					, url:"/post/comment/create"
					, data:{"postId":postId, "comment":comment}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 입력 실패");
						}
					}
					, error:function() {
						alert("댓글 에러");
					}
				});
			});
			
			// 좋아요 
			$(".like-btn").on("click", function() {
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"post"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					}
					, error:function() {
						alert("좋아요 에러");
					}
				});
			});
			
			
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
	
				var formData = new FormData();
				formData.append("contents", contents);
				formData.append("file", file.files[0]);
				
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
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