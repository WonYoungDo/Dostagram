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
		<section class="my-1 bg-secondary">
			<div class="find col-8 bg-white">
				<div class="find-logo d-flex justify-content-center align-items-center">
					<i class="bi bi-instagram icon-size-md"></i>		
					<h2 class="text-dark pt-1 pl-1">Dostagram</h2>
				</div>
				<div class="find-info d-flex">
					<div class="find-id bg-white col-6 p-1"></div>
					<div class="find-password bg-primary col-6"></div>
				</div>
			</div>
					
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
</html>