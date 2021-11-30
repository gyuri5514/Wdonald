<!-- store의 1:1 고객문의 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">1:1 고객문의</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.sdo">WDonald</a></li>
				<li class="breadcrumb-item active">1:1 고객문의</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					WDonald의 1:1 고객문의 <a target="_blank" href="main.do">WDonald</a>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 고객문의
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>번호</th>
								<th>이메일</th>
								<th>제목</th>
								<th>날짜</th>
								<th>답변 상태</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
							</tr>
						</tfoot>
						<tbody>
						<c:forEach items="${qnaList}" var="qnaList">
							<tr>
								<td>${qnaList.qa_seq}</td>
								<td>${qnaList.qa_email}</td>
								<td><a href="qnaDetail.sdo?qa_seq=${qnaList.qa_seq}">${qnaList.qa_title}</a></td>
								<td><fmt:formatDate value="${qnaList.qa_regdate}" pattern="yyyy.MM.dd"/></td>
								<c:if test="${qnaList.qa_status eq 0}">
									<td>미완료</td>
								</c:if>
								<c:if test="${qnaList.qa_status eq 1}">
									<td>완료</td>
								</c:if>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
<%@ include file="footer.jsp" %>