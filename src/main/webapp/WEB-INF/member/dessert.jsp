<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/bam.css">

	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu04">
					<div class="inner">
						<h1 class="titDep1">사이드 &amp; 디저트</h1>
						<p class="subCopy">가볍게 즐겨도, 버거와 함께 푸짐하게 즐겨도,<br>
						언제나 맛있는 사이드와 디저트 메뉴!</p>
						<ul class="navPath">
							<li><a href="main.do">Home</a></li>
							<li><a href="burger.do">Menu</a></li>
							<li><a href="side.do">사이드 &amp; 디저트</a></li>
						</ul>
					</div>
				</div>
    			<div class="contArea">
					<div class="inner">
						<ul class="tabType01">
							<li data-title="사이드" data-desc="사이드메뉴"><a href="side.do" role="button">사이드</a></li><!-- 선택 된 태그에 aria-selected="true" 추가 -->
							<li data-title="디저트" data-desc="디저트메뉴"><a href="dessert.do" role="button" aria-selected="true">디저트</a></li>
						</ul>
						<div class="mcMenu">
							<p class="count" id="count"><b>${selectDessert.size()}</b> Products</p>
							<ul class="menuList" id="menuList">
								<c:forEach items="${selectDessert}" var="selectDessert">
									<li>
										<a href="#" data-seq="300">
											<div class="thum">
												<img src="${selectDessert.dessert_img_path}" alt="${selectDessert.dessert_name}" onclick="javascript:location.href='detail.do?dessert_code=${selectDessert.dessert_code}'">
											</div>
											<div class="name">
												<strong class="ko">${selectDessert.dessert_name}</strong>
												<em class="en">${selectDessert.dessert_e_name}</em>
												<div class="product-cost">
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${selectDessert.dessert_price}"/>
													<span class="starting-price" style="margin-top:5px;">&#8361; ${formatPrice}</span>
												</div>
											</div>
										<button style="background-color:#ffbc0d; color:white; margin-top:30px; border-radius:25px; width:90px; height:30px;" 
													onclick="javascript:location.href='order.do?dessert_code=${selectDessert.dessert_code}'"><h4>주문하기</h4></button>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			 <form id="searchForm" method="post">
				<input type="hidden" name="page" id="page" value="1">
				<input type="hidden" name="seq" id="seq">
				<input type="hidden" name="sub_category_seq" id="sub_category_seq" value="1">
			</form>
		</div>
		<div class="aside">
			<a href="burger.do" class="goDelivery" target="_blank" title="새창 열림">CART</a>
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