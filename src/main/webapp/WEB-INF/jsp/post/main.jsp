<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
	<div class="contaimer">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<!-- 타임라인 -->
			<div class="timeLine bg-warning">
				<!-- 입력박스 -->
				<div class="input-box border rounded">
					<textarea rows="4" class="form-control border-0"></textarea>
					<div class="d-flex justify-content-between p-2">
						<input type="file">
						<button>업로드</button>
					</div>
				</div>
				<!-- 입력박스 -->
				
				<!-- 카드 리스트 -->
				<div class="card-list">
					<!-- 카드 -->
					<div class="card">
						<div>
							<div></div>
						</div>
					</div>
				</div>
				<!-- 카드 리스트 -->
			</div>
			<!-- 타임라인 -->
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
</html>