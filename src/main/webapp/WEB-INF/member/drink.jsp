<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="/resources/js/menu/menu.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bam.css">

	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu01">
					<div class="inner">
						<h1 class="titDep1">맥카페 &amp; 음료</h1>
						<p class="subCopy">언제나 즐겁게, 맥카페와 다양한 음료를 부담없이 즐기세요!</p>
						<ul class="navPath">
							<li><a href="/">Home</a></li>
							<li><a href="burger.do">Menu</a></li>
							<li><a href="drink.do">맥카페 &amp; 음료</a></li>
						</ul>
					</div>
				</div>
    			<div class="contArea">
					<div class="inner">
						<div class="mcMenu">
							<p class="count" id="count">19 Products</p>
							<ul class="menuList" id="menuList">
								<c:forEach items="${selectDrink}" var="selectDrink">
									<li>
										<a href="#" data-seq="${selectDrink.d_code}">
											<div class="thum">
												<img src="${selectDrink.d_img_path}" alt="${selectDrink.d_name}" onclick="javascript:location.href='detail.do?d_code=${selectDrink.d_code}'">
											</div>
											<div class="name">
												<strong class="ko">${selectDrink.d_name}</strong>
												<em class="en">${selectDrink.d_e_name}</em>
												<div class="product-cost">
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${selectDrink.d_price}"/>
													<span class="starting-price" style="margin-top:5px;">&#8361; ${formatPrice}</span>
												</div>
											</div>
										<button style="background-color:#ffbc0d; color:white; margin-top:30px; border-radius:25px; width:90px; height:30px;" 
													onclick="javascript:location.href='order.do?d_code=${selectDrink.d_code}'"><h4>주문하기</h4></button>
										</a>
									</li>
								</c:forEach>
							</ul>
							<!-- <div class="btnMore" id="btnMore">
								<button type="button" class="more" onclick="more()">더보기</button>
							</div> -->
						</div>
					</div>
				</div>
			 <form id="searchForm" method="get">
				<input type="hidden" name="page" id="page" value="1">
				<input type="hidden" name="seq" id="seq">
				<input type="hidden" name="sub_category_seq" id="sub_category_seq" value="1">
			</form>
		</div>
		<div class="aside">
			<a href="cart.do" class="goDelivery" target="_blank" title="새창 열림">CART</a>
		</div>
		<button type="button" class="btnTop">맨 위로 가기</button>
	</div>
<script type="text/javascript">
	function goDetail(seq) {
		$('#seq').val(seq);
		$('#searchForm').attr("action","detail.do");
		$('#searchForm').submit();
	}
</script>
<%@ include file="footer.jsp" %>