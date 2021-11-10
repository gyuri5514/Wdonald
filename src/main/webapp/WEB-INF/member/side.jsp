<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="/resources/js/menu/menu.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bam.css">

	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu04">
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
						<div class="mcMenu">
							<p class="count" id="count">8 Products</p>
							<ul class="menuList" id="menuList">
								<c:forEach items="${selectSide}" var="selectSide">
									<li>
										<a href="#" data-seq="${selectSide.s_code}">
											<div class="thum">
												<img src="${selectSide.s_img_path}" alt="${selectSide.s_name}" onclick="javascript:location.href='detail.do?s_code=${selectSide.s_code}'">
											</div>
											<div class="name">
												<strong class="ko">${selectSide.s_name}</strong>
												<em class="en">${selectSide.s_e_name}</em>
												<div class="product-cost">
													<span class="starting-price" style="margin-top:5px;">&#8361; ${selectSide.s_price}</span>
												</div>
											</div>
										<button style="background-color:#ffbc0d; color:white; margin-top:30px; border-radius:25px; width:90px; height:30px;" 
													onclick="javascript:location.href='order.do?s_code=${selectSide.s_code}'"><h4>주문하기</h4></button>
                    					</a>
									</li>
								</c:forEach>
							</ul>
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