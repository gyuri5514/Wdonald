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
					실시간 매출
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>주문 날짜</th>
								<th>매장 코드</th>
								<th>주문 상태</th>
								<th>결제 정보</th>
								<th>결제 금액</th>
								<th>Salary</th>
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
						<c:forEach items="${paymentList}" var="paymentList">
						<tbody>
							<tr>
								<td><fmt:formatDate value="${paymentList.order_date }" pattern="yyyy-MM-dd"/></td>
								<td>${paymentList.store_name }</td>
								<td>${paymentList.order_status }</td>
								<td>${paymentList.payment_type }</td>
								<td>${paymentList.final_price }</td>
								<td>${paymentList.final_price }</td>
							</tr>
						</tbody>
						</c:forEach> 
					</table>
				</div>
			</div>
		</div>
	</main>


<%@ include file="footer.jsp" %>
