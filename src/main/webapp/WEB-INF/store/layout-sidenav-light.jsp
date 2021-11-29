<!-- store의 1:1 고객문의 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">공지사항</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.sdo">WinDelivery</a></li>
				<li class="breadcrumb-item active">공지사항</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					WinDelivery 관리자 공지사항 <a target="_blank" href="main.do">WinDelivery</a>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 공지사항
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>날짜</th>
							</tr>
						</thead>
						<!-- <tfoot>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
								
							</tr>
						</tfoot> -->
						<tbody>
						<c:forEach items="${noticeList}" var="noticeList">
							<tr>
								<td>${noticeList.notice_seq}</td>
								<td>${noticeList.notice_title}</td>
								<td><a href="noticeDetail.sdo?notice_seq=${noticeList.notice_seq}">${noticeList.notice_content}</a></td>
								<td><fmt:formatDate value="${noticeList.notice_regdate}" pattern="yyyy.MM.dd"/></td>
							</tr>
						</c:forEach>
						</tbody>
						
					</table>
				</div>
			</div>
		</div>
	</main>
	
<%@ include file="footer.jsp" %>
