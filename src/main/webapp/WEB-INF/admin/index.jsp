<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!-- !! Admin Main !! -->
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Dashboard</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">WinDelivery</li>
			</ol>
			<div class="row">
				<!-- <div class="col-xl-3 col-md-6">
					<div class="card bg-primary text-white mb-4"> -->
						<!-- <div class="card-body">Primary Card</div>
						토글
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div> -->
				<!-- </div> -->
<!-- 				<div class="col-xl-3 col-md-6"> -->
<!-- 					<div class="card bg-warning text-white mb-4"> -->
<!-- 						<div class="card-body">Warning Card</div> -->
<!-- 						<div -->
<!-- 							class="card-footer d-flex align-items-center justify-content-between"> -->
<!-- 							<a class="small text-white stretched-link" href="#">View -->
<!-- 								Details</a> -->
<!-- 							<div class="small text-white"> -->
<!-- 								<i class="fas fa-angle-right"></i> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-xl-3 col-md-6"> -->
<!-- 					<div class="card bg-success text-white mb-4"> -->
<!-- 						<div class="card-body">Success Card</div> -->
<!-- 						<div -->
<!-- 							class="card-footer d-flex align-items-center justify-content-between"> -->
<!-- 							<a class="small text-white stretched-link" href="#">View -->
<!-- 								Details</a> -->
<!-- 							<div class="small text-white"> -->
<!-- 								<i class="fas fa-angle-right"></i> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-xl-3 col-md-6"> -->
<!-- 					<div class="card bg-danger text-white mb-4"> -->
<!-- 						<div class="card-body">Danger Card</div> -->
<!-- 						<div -->
<!-- 							class="card-footer d-flex align-items-center justify-content-between"> -->
<!-- 							<a class="small text-white stretched-link" href="#">View -->
<!-- 								Details</a> -->
<!-- 							<div class="small text-white"> -->
<!-- 								<i class="fas fa-angle-right"></i> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
	 			</div>
			<!-- Ã¬Â°Â¨Ã­ÂÂ¸ -->
			<div class="row">
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i> 일별 매출액
						</div>
						<div class="card-body">
							<canvas id="myAreaChart" width="100%" height="40"></canvas>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-bar me-1"></i> 월별 총 매출액
						</div>
						<div class="card-body">
							<canvas id="myBarChart" width="100%" height="40"></canvas>
						</div>
					</div>
				</div>
			</div>
			<!-- 표 -->
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>
					매장 리스트
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>매장 이름</th>
								<th>매장 코드</th>
								<th>관리자</th>
								<th>매장 주소</th>
								<th>매장 번호</th>
								<th>매장 상태</th>
							</tr>
						</thead>
					    <!-- <tfoot>
							<tr>
								<th>Name</th>
								<th>Position</th>
								<th>Office</th>
								<th>Age</th>
								<th>Start date</th>
								<th>Salary</th>
							</tr>
						</tfoot> -->
						
						<tbody>
						<c:forEach items="${adminList}" var="adminList">
							<tr>
								<td>${adminList.store_name }</td>
								<td>${adminList.store_code }</td>
								<td>${adminList.admin_name }</td>
								<td>${adminList.store_address }</td>
								<td>${adminList.store_phone }</td>
								<td>
								<c:set var="status" value="${adminList.store_status }" />
									<c:choose>
										<c:when test="${status eq '1' }">정상영업</c:when>
										<c:when test="${status eq '0' }"><span style="color:red;">영업마감</span></c:when>	
										<c:when test="${status eq '2' }"><span style="color:blue;">준비중</span></c:when>										
									</c:choose>
								</td>
							</tr>
							</c:forEach> 
						</tbody>
						
					</table>
					<%-- <div class='btnPaging'>
							<ul class="pagination pagination-sm" >
								<c:if test="${pageMaker.prev}">
								<li class="page-item">
									<a class="page-link" href='<c:url value="/index.mdo?page=${pageMaker.startPage - 1}"/>'><i class="fa fa-chevron-left"></i></a>
								</li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
								<li class="page-item">
									<a class="page-link" href='<c:url value="/index.mdo?page=${pageNum}"/>'><i class="">${pageNum}</i></a>
								</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
								<li class="page-item">
									<a class="page-link" href='<c:url value="index.mdo?page=${pageMaker.endPage + 1}"/>'><i class="fa fa-chevron-right"></i></a>
								</li>
								</c:if>
							</ul>
						</div> --%><!-- 페이징 끝 -->
				</div>
			</div>
		</div>
	</main>


<%@ include file="footer.jsp" %>
