<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">이 달의 해피밀</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WinDelivery</a></li>
				<li class="breadcrumb-item active"><a href="happyPromotion.mdo">이 달의 해피밀</a></li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					WinDelivery의 이 달의 해피밀<a target="_blank" href="main.do">WinDelivery</a>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>이 달의 해피밀
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${happyPromotionList}" var="happyPromotionList">
							<tr>
								<td>${promotionList.hp_code}</td>
								<td><a href="happyPromotionDetail.mdo?hp_code=${happyPromotionList.hp_code}">${happyPromotionList.hp_title}</a></td>
								<td><fmt:formatDate value="${happyPromotionList.hp_regdate}" pattern="yyyy.MM.dd" var="regdate"/>${regdate}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<a class="btn btn-primary" href="addHappyPromotion.mdo">등록하기</a>
			</div>
		</div>
	</main>

<%@ include file="footer.jsp" %>