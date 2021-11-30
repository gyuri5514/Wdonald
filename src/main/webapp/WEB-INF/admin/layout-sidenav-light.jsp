<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">쿠폰관리</h1> <!-- 최고 관리자: 매장테이블, 매장: 메뉴테이블 -->
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">WDonald</a></li>
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
								<th>할인금액</th>
								<th>쿠폰등록일</th>
								<th>유효일자</th>
								<th>사용가능여부</th>
								<th>쿠폰삭제</th>
							</tr>
						</thead>
						<tbody id="ajaxCoupon">
						<c:forEach var="vo" items="${vo}" varStatus="status">
							<tr>
								<td id="coupon_code">${vo.coupon_code}</td>
								<td>${vo.coupon_title}</td>
								<td>${vo.coupon_type}</td>
								<td>${vo.coupon_discount }</td>
								<td><fmt:formatDate value="${vo.coupon_regdate}" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${vo.coupon_enddate}" pattern="yyyy-MM-dd"/></td>
								<td style="text-align: center;">
									<div class="coupon_status" style="width: 80%; margin: 0 auto">
										<select id="coupon_status${vo.coupon_code}" name="coupon_status" onchange="stateChanged('${vo.coupon_code }')" class="btn btn-Default dropdown-toggle">
											<c:if test="${vo.coupon_status == 0}">
												<option value="0" selected>Y</option>
												<option value="1">N</option>
											</c:if>
											<c:if test="${vo.coupon_status == 1}">
												<option value="0">Y</option>
												<option value="1" selected>N</option>
											</c:if>
										</select>
									</div>
								</td>
								<td><button class="couponDelete" id="couponDelete" onClick="couponDelete('${vo.coupon_code}')" style="background-color: #0d6efd; color:white; border-radius: 5px; border : solid 1px #0d6efd;">삭제</button></td>
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
				<div class="text-muted">WDonald &copy; 대표이사 : Tommy.Lee </div>
				<div>
					<a href="../main.mdo">Privacy Policy</a> &middot; <a href="#">Term
						&amp; Conditions</a>
				</div>
			</div>
		</div>
	</footer>
</div>

<script type="text/javascript">
	function couponDelete(index){
			$.ajax({
				type : 'post',
				url : '/controller/deleteCoupon.mdo',
				data : {
					coupon_code : index
				},
				dataType : 'json',
				success : function(data){
					if(data == 1)
						location.href = "layout-sidenav-light.mdo";
				}
			})
		}
	function stateChanged(code){
		var status = $('#coupon_status'+code).val();
		
		$.ajax({
			type : 'post',
			url : '/controller/statusCoupon.mdo',
			data : {
				coupon_code : code,
				status : status
			},
			dataType : 'json',
			success : function(data){
				
			}
		})
	
	}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminScripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script	src="${pageContext.request.contextPath}/resources/js/adminDatatables-simple-demo.js"></script>
</body>
</html>
