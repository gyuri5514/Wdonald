<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="/resources/js/menu/menu.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bam.css">
<c:if test="${menuAvailable == 'n' }">
	<script>
		alert('주문 가능한 시간대가 아닙니다.');
		window.location.href='/controller/burger.do';
	</script>
	</c:if>
	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu02">
				<div class="inner">
					<h1 class="titDep1">윈모닝</h1>
					<p class="subCopy">새벽 4시부터 오전 10시 30분까지<br>
					갓 구워내 신선한 맥모닝으로 따뜻한 아침 식사를 챙겨 드세요!</p>
					<ul class="navPath">
						<li><a href="main.do">Home</a></li>
						<li><a href="burger.do">Menu</a></li>
						<li><a href="morning.do">윈모닝</a></li>
					</ul>
				</div>
			</div>
    		<div class="contArea">
				<ul class="tabType01">
							<!-- <li data-title="버거" data-desc="버거메뉴"><a href="burger.do" role="button" aria-selected="true">메뉴</a></li>선택 된 태그에 aria-selected="true" 추가 -->
							<!-- <li><a href="javascript:gotoMenu(2);" role="button">세트메뉴</a></li> -->
						</ul>
				<div class="inner">
					<div class="mcMenu">
						<p class="count" id="count"><b>${selectWinMorning.size()}</b> Products</p>
						<ul class="menuList" id="menuList">
							<c:forEach items="${selectWinMorning}" var="selectWinMorning">
								<li>
									<a href="#" data-seq="${selectWinMorning.w_code}">
										<div class="thum">
											<img src="${selectWinMorning.w_img_path}" alt="${selectWinMorning.w_name}" onclick="javascript:location.href='detail.do?w_code=${selectWinMorning.w_code}'">
										</div>
										<div class="name">
											<strong class="ko">${selectWinMorning.w_name}</strong>
											<em class="en">${selectWinMorning.w_e_name}</em>
											<div class="product-cost">
												<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${selectWinMorning.w_price}"/>
												<span class="starting-price" style="margin-top:5px;"> &#8361; ${formatPrice}</span>
											</div>
										</div>
									<button style="background-color:#ffbc0d; color:white; margin-top:30px; border-radius:25px; width:90px; height:30px;" 
													onclick="javascript:location.href='order.do?w_code=${selectWinMorning.w_code}'"><h4>주문하기</h4></button>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
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
		<a href="burger.do" class="goDelivery" target="_blank" title="새창 열림">CART</a>
	</div>
	<button type="button" class="btnTop">맨 위로 가기</button>
<script type="text/javascript">
	function goDetail(seq) {
		$('#seq').val(seq);
		$('#searchForm').attr("action","detail.do");
		$('#searchForm').submit();
	}
</script>
<%@ include file="footer.jsp" %>