<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminScripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/store/chart-area-demo.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/store/chart-pie-demo.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/store/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/store/datatables-demo.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminDatatables-simple-demo.js"></script>
<c:if test="${error eq 1}">
<script type="text/javascript">
	alert('권한이 필요한 작업입니다. 로그인해주세요.');
</script>
</c:if>
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
					<i class="fas fa-table me-1"></i>장난감 수량
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>이름</th>
								<th>종류</th>
								<th>수량</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${toy}" var="toy">
							<tr>
								<td>${toy.ht_name}</td>
								<td>${toy.ht_series}</td>
								<td>${toy.ht_count}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>


<%@ include file="footer.jsp" %>
