<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">공지사항 관리</h1> <!-- 최고 관리자: 매장테이블, 매장: 메뉴테이블 -->
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WinDelivery</a></li>
				<li class="breadcrumb-item active">공지사항 관리</li>
			</ol>
			<div class="card mb-4">
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>공지사랑 관리
				</div>
				<div class="card-body">
					<button class="addboard" id="addboard"
						onclick="location='addboard.mdo'"
						style="background-color: #0d6efd; width: 150px; font-size: 15px; padding: 0px; color: white; border-radius: 5px; border: solid 1px #0d6efd;">공지사항
						등록</button>
					<hr>
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>제목</th>
								<th>내용</th>
								<th>등록일</th>
								<th>공지사항 삭제</th>
							</tr>
						</thead>
						<tbody id="ajaxBoard">
						<c:forEach var="Board" items="${Board}" varStatus="status">
							<tr>
								<td>${Board.notice_title}</td>
								<td>${Board.notice_content}</td>
								<td><fmt:formatDate value="${Board.notice_regdate}" pattern="yyyy-MM-dd"/></td>
								<td><button class="boardDelete" id="boardDelete" onClick="noticeDelete()" style="background-color: #0d6efd; color:white; border-radius: 5px; border : solid 1px #0d6efd;">삭제</button></td>
							</tr>					
						</c:forEach>							
						</tbody>
					</table>
				</div>
			</div>
		</div>	
	</main>


	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">WinDelivery &copy; 대표이사 : Tommy.Lee </div>
				<div>
					<a href="../main.mdo">Privacy Policy</a> &middot; <a href="#">Term
						&amp; Conditions</a>
				</div>
			</div>
		</div>
	</footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminScripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminDatatables-simple-demo.js"></script>
</body>
</html>
