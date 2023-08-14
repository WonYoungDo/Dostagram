<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<header class="d-flex align-items-center justify-content-between px-3 bg-white">
	<div class="d-flex">
		<i class="bi bi-instagram icon-size-md"></i>
		<h2 class="pt-1 pl-1 text-dark">Dostagram</h2>
	</div>
	<div class="d-flex mt-4">
		<c:if test="${not empty userId}"> 
			${userName }<a href="/user/logout" class="pl-2">로그아웃</a>
		</c:if>
	</div>
</header>