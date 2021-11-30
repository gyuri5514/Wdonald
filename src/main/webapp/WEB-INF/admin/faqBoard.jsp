<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">FAQ</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WDonald</a></li>
				<li class="breadcrumb-item active">FAQ</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					WDonald의 FAQ <a target="_blank" href="main.do">WDonald</a>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> FAQ
				</div>
				<div class="card-body">
				<a class="btn btn-primary" href="addFaq.mdo">등록하기</a>
				<hr>
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>카테고리</th>
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
						<c:forEach items="${faqList}" var="faqList" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="faqDetail.mdo?faq_seq=${faqList.faq_seq}">${faqList.faq_title}</a></td>
								<td>${faqList.faq_content}</td>
								<td>${faqList.faq_name}</td>
								
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	
<%@ include file="footer.jsp" %>
