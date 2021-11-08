<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu01">
					<div class="inner">
						<h1 class="titDep1">버거</h1>
						<p class="subCopy">빅맥<sub class="reg">®</sub>에서 맥스파이시<sub class="reg">®</sub> 상하이버거까지, <br>주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.</p>
						<ul class="navPath">
							<li><a href="/">Home</a></li>
							<li><a href="burger.do">Menu</a></li>
							<li><a href="burger.do">버거</a></li>
						</ul>
					</div>
				</div>
    			<div class="contArea">
					<div class="inner">
						<ul class="tabType01">
							<li data-title="버거" data-desc="버거메뉴"><a href="burger.do" role="button" aria-selected="true">메뉴</a></li><!-- 선택 된 태그에 aria-selected="true" 추가 -->
							<!-- <li><a href="javascript:gotoMenu(2);" role="button">세트메뉴</a></li> -->
						</ul>
						<div class="mcMenu">
							<p class="count" id="count">21 Products</p>
							<ul class="menuList" id="menuList">
								<c:forEach items="${selectBurger}" var="selectBurger">
									<li>
										<a href="javascript:location.href='detail.do?b_code=${selectBurger.b_code}'" data-seq="${selectBurger.b_code}">
											<div class="thum">
												<img src="${selectBurger.b_img_path}" alt="${selectBurger.b_name}">
											</div>
											<div class="name">
												<strong class="ko">${selectBurger.b_name}</strong>
												<em class="en">${selectBurger.b_e_name}</em>
												<div class="product-cost">
													<span class="starting-price" style="margin-top:5px;">${selectBurger.b_price}</span>
												</div>
											</div>
										</a>
										<button style="background-color:#ffbc0d; color:white; margin-left:150px; border-radius:25px; width:90px; height:30px;" 
													onclick="javascript:location.href='order.do?b_code=${selectBurger.b_code}'"><h4>주문하기</h4></button>
									</li>
								</c:forEach>
							</ul>
							<div class="btnMore" id="btnMore">
								<button type="button" class="more" onclick="more()">더보기</button>
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