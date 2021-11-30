<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
@font-face {
    font-family: SpeedeeK;
    font-weight: 400;
    font-style: normal;
    src: url("/resources/font/Speedee_K_L.woff") format('woff'); 
}

@font-face {
    font-family: SpeedeeK;
    font-weight: 500;
    font-style: normal;
    src: url("../font/Speedee_K_R.woff") format('woff'), 
         url("../font/Speedee_K_R.ttf") format('truetype'); 
}
@font-face {
    font-family: SpeedeeK;
    font-weight: 600;
    font-style: normal;
    src: url("../font/Speedee_K_B.woff") format('woff'), 
         url("../font/Speedee_K_B.ttf") format('truetype'); 
}

body {
	font-family: SpeedeeK;
	font-weight: 400;
}
</style>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">프로모션</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WDonald</a></li>
				<li class="breadcrumb-item active"><a href="promotion.mdo">프로모션</a></li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					WDonald의 프로모션&nbsp;&nbsp;<a target="_blank" href="main.do">WDonald</a>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>프로모션
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>진행 여부</th>
								<th>등록날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${promotionList}" var="promotionList">
							<tr>
								<td>${promotionList.p_code}</td>
								<td><a href="promotionDetail.mdo?p_code=${promotionList.p_code}">${promotionList.p_name}</a></td>
								<td>${promotionList.p_status}</td>
								<td><fmt:formatDate value="${promotionList.p_regdate}" pattern="yyyy.MM.dd" var="regdate"/>${regdate}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<a class="btn btn-primary" href="addPromotion.mdo">등록하기</a>
			</div>
		</div>
	</main>

<%@ include file="footer.jsp" %>