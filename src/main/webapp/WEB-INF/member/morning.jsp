<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu01">
					<div class="inner">
						<h1 class="titDep1">윈모닝</h1>
						<p class="subCopy">새벽 4시부터 오전 10시 30분까지<br>
						갓 구워내 신선한 맥모닝으로 따뜻한 아침 식사를 챙겨 드세요!</p>
						<ul class="navPath">
							<li><a href="/">Home</a></li>
							<li><a href="burger.do">Menu</a></li>
							<li><a href="morning.do">윈모닝</a></li>
						</ul>
					</div>
				</div>
    			<div class="contArea">
					<div class="inner">
						<ul class="tabType01">
							<li data-title="윈모닝" data-desc="윈모닝메뉴"><a href="morning.do" role="button" aria-selected="true">메뉴</a></li><!-- 선택 된 태그에 aria-selected="true" 추가 -->
							<!-- <li><a href="javascript:gotoMenu(2);" role="button">세트메뉴</a></li> -->
						</ul>
						<div class="mcMenu">
							<p class="count" id="count">9 Products</p>
							<ul class="menuList" id="menuList">
								<c:forEach items="${selectWinMorning}" var="selectWinMorning">
									<li>
										<a href="javascript:goDetail(300)" data-seq="300">
											<div class="thum">
												<img src="${selectWinMorning.w_img_path}" alt="${selectWinMorning.w_name}">
											</div>
											<div class="name">
												<strong class="ko">${selectWinMorning.w_name}</strong>
												<em class="en">${selectWinMorning.w_e_name}</em>
												<div class="product-cost">
													<span class="starting-price" style="margin-top:5px;">${selectWinMorning.w_price}</span>
												</div>
											</div>
										</a>
										<button style="background-color:#ffbc0d; color:white; margin-left:150px; border-radius:25px; width:90px; height:30px;" 
													onclick="javascript:location.href='order.do?b_code=${selectWinMorning.w_code}'"><h4>주문하기</h4></button>
									</li>
								</c:forEach>
							</ul>
							<div class="btnMore" id="btnMore">
								<button type="button" class="more" onclick="more()">더보기</button>
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