<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">쿠폰관리</h1> <!-- 최고 관리자: 매장테이블, 매장: 메뉴테이블 -->
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WinDelivery</a></li>
				<li class="breadcrumb-item active">쿠폰관리</li>
			</ol>
			<div class="card mb-4">
			</div>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>쿠폰관리
				</div>
				<div class="card-body">
					<button class="addcoupon" id="addcoupon" onclick="location='addcoupon.mdo'">프로모션쿠폰 등록</button>
					<hr>
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>쿠폰코드</th>
								<th>쿠폰명</th>
								<th>분류</th>
								<th>쿠폰등록일</th>
								<th>유효일자</th>
								<th>사용가능여부</th>
								<th>쿠폰삭제</th>
							</tr>
						</thead>
						<tbody id="ajaxCoupon">
						<c:forEach var="vo" items="${vo}">
							<tr>
								<td>${vo.coupon_code}</td>
								<td>${vo.coupon_title}</td>
								<td>${vo.coupon_type}</td>
								<td><fmt:formatDate value="${vo.coupon_regdate}" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${vo.coupon_enddate}" pattern="yyyy-MM-dd"/></td>
								<td style="text-align: center;">
									<div class="coupon_canuse" style="width: 80%; margin: 0 auto">
										<select id="coupon_canuse${vo.coupon_code}" name="coupon_canuse" class="btn btn-Default dropdown-toggle">
											<option value="Y" ${vo.coupon_check == "Y" ? 'selected="selected"' : ''}>Y</option>
											<option value="N" ${vo.coupon_check == "N" ? 'selected="selected"' : ''}>N</option>
										</select>
									</div>
								</td>
								<td><button class="couponDelete" id="couponDelete" style="background-color: #0d6efd; color:white; border-radius: 5px; border : solid 1px #0d6efd;">삭제</button></td>
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
