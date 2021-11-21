<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">주문</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.sdo">WinDelivery</a></li>
				<li class="breadcrumb-item active">주문</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					매장 주문 관리 <a target="_blank" href="tables.sdo">WinDelivery 주문관리</a>
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>주문현황
				</div>
				<form action="">
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th style="display:none;">seq</th>
								<th>주문 날짜</th>
								<th>주소</th>
								<th>주문자</th>
								<th>주문자번호</th>
								<th>결제금액</th>
								<th>주문 상태</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${orderCancel}" var="orderCancel">
						
						<fmt:formatDate var="orderDate" value="${orderCancel.order_date}" pattern="yyyy.MM.dd HH:mm:ss"/>
							<tr>
								<td style="display:none;">${orderCancel.order_seq}</td>
								<td>${orderDate}</td>
								<td>${orderCancel.user_address}</td>
								<td>${orderCancel.user_name}</td>
								<td>${orderCancel.user_phone}</td>
								<td>${orderCancel.final_price}</td>
								<td>${orderCancel.order_status}</td>
							</tr>
							</c:forEach>
						</tbody>	
					</table>
				</div>
				</form>
			</div>
			
		</div>
	</main>


	<footer class="py-4 bg-light mt-auto">
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-muted">WinDelivery &copy; 대표이사 : Tommy.Lee </div>
				<div>
					<a href="main.do">WinDelivery</a> &middot; <a href="#">Team &amp; 2</a>
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
