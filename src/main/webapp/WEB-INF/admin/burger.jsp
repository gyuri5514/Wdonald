<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<script>
	$('#dataTable-selector').click(function(){
		alert('perPageNum' + $('#dataTable-selector').val());
	})
</script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Burger</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.mdo">HOME</a></li>
				<li class="breadcrumb-item active">윈딜리버리 버거</li>
			</ol>
			<div style="height: 100vh">
				<!-- 표 -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 윈딜리버리 버거 내역
					</div>
					<div class="card-body">
					<button class="addcoupon" id="addBanner" onclick="location='bannerRegister.mdo'">등록</button>
					<hr>
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>이름</th>
									<th>가격</th>
									<th>코드</th>
									<th>칼로리</th>
									<th>등록일</th>
									<th>상태</th>
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
								<c:forEach items="${burgerVO}" var="b_list" varStatus="status">
									<tr id="show${status.count}">
										<td>${b_list.b_name}</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${b_list.b_price}"/>
													<span class="starting-price" style="margin-top:5px;"> &#8361; ${formatPrice}</span>
										</td>
										<td>${b_list.b_code}</td>
										<td>${b_list.b_kcal} Kcal</td>
										<td><fmt:formatDate value="${b_list.b_regdate}" pattern="yyyy-MM-dd" /></td>
										<td><c:set var="status" value="${b_list.b_status }" />
											<c:choose>
												<c:when test="${status eq '0'}"><span style="color: red">비활성화</span></c:when>
												<c:when test="${status eq '1'}"><span style="color: blue">활성화</span></c:when>
												<c:when test="${status eq '2'}"><span style="color: red">재고소진</span></c:when>
												<c:when test="${status eq '3'}"><span style="color: red">출시대기</span></c:when>
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
									<a class="page-link" href='<c:url value="/layoutStatic.mdo?page=${pageMaker.startPage - 1}"/>'><i class="fa fa-chevron-left"></i></a>
								</li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
								<li class="page-item">
									<a class="page-link" href='<c:url value="/layoutStatic.mdo?page=${pageNum}"/>'><i class="">${pageNum}</i></a>
								</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
								<li class="page-item">
									<a class="page-link" href='<c:url value="/layoutStatic.mdo?page=${pageMaker.endPage + 1}"/>'><i class="fa fa-chevron-right"></i></a>
								</li>
								</c:if>
							</ul>
						</div> --%><!-- 페이징 끝 -->
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="footer.jsp"%>