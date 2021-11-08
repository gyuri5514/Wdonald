<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu01">
					<div class="inner">
						<h1 class="titDep1">사이드 &amp; 디저트</h1>
						<p class="subCopy">가볍게 즐겨도, 버거와 함께 푸짐하게 즐겨도,<br>
						언제나 맛있는 사이드와 디저트 메뉴!</p>
						<ul class="navPath">
							<li><a href="/">Home</a></li>
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
							<p class="count" id="count">6 Products</p>
							<ul class="menuList" id="menuList">
								<c:forEach items="${selectDessert}" var="selectDessert">
									<li>
										<a href="javascript:goDetail(300)" data-seq="300">
											<div class="thum">
												<img src="${selectDessert.dessert_img_path}" alt="${selectDessert.dessert_name}">
											</div>
											<div class="name">
												<strong class="ko">${selectDessert.dessert_name}</strong>
												<em class="en">${selectDessert.dessert_e_name}</em>
												<div class="product-cost">
													<span class="starting-price" style="margin-top:5px;">${selectDessert.dessert_price}</span>
												</div>
											</div>
										</a>
										<button style="background-color:#ffbc0d; color:white; margin-left:150px; border-radius:25px; width:90px; height:30px;" 
													onclick="javascript:location.href='order.do?b_code=${selectDessert.dessert_code}'"><h4>주문하기</h4></button>
									</li>
								</c:forEach>
							</ul>
							<div class="btnMore" id="btnMore">
								<button type="button" class="more" onclick="more()">더보기</buttona>
							</div>
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