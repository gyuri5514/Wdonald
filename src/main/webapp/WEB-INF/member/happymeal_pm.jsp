<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="/resources/js/menu/menu.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bam.css">

	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu03">
					<div class="inner">
						<h1 class="titDep1">해피밀</h1>
						<p class="subCopy">맛과 즐거움 모두 해피밀을 통해 느껴보세요!</p>
						<ul class="navPath">
							<li><a href="main.do">Home</a></li>
							<li><a href="burger.do">Menu</a></li>
							<li><a href="happymeal.do">해피밀</a></li>
						</ul>
					</div>
				</div>
    			<div class="contArea">
					<div class="inner">
						<ul class="tabType01">
							<li data-title="해피밀 " data-desc="해피밀메뉴"><a href="happymeal.do" role="button">AM 04:00~AM 10:30</a></li><!-- 선택 된 태그에 aria-selected="true" 추가 -->
							<li ><a href="happymeal_pm.do" role="button" aria-selected='true'>AM 10:30~AM 04:00</a></li>
						</ul>
						<div class="mcMenu">
							<p class="count" id="count"><b>${selectHappyMealPM.size()}</b> Products</p>
							<ul class="menuList" id="menuList">
								<c:forEach items="${selectHappyMealPM}" var="selectHappyMealPM">
									<li>
										<a href="#" data-seq="${selectHappyMealPM.h_code}">
											<div class="thum">
												<img src="${selectHappyMealPM.h_img_path}" alt="${selectHappyMealPM.h_name}" onclick="javascript:location.href='detail.do?h_code=${selectHappyMealPM.h_code}'">
											</div>
											<div class="name">
												<strong class="ko">${selectHappyMealPM.h_name}</strong>
												<em class="en">${selectHappyMealPM.h_e_name}</em>
												<div class="product-cost">
													<span class="starting-price" style="margin-top:5px;">&#8361; ${selectHappyMealPM.h_price}</span>
												</div>
											</div>
											<button style="background-color:#ffbc0d; color:white; margin-top:30px;border-radius:25px; width:90px; height:30px;" 
													onclick="javascript:location.href='order.do?h_code=${selectHappyMealPM.h_code}'"><h4>주문하기</h4></button>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				 <form id="searchForm" method="get">
					<input type="hidden" name="page" id="page" value="1">
					<input type="hidden" name="seq" id="seq">
					<input type="hidden" name="sub_category_seq" id="sub_category_seq" value="6">
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
	function gotoMenu(val){
		$("#gotoform_sub_category_seq").val(val);
		$("#gotoMenuForm").attr("action","happymeal.do");
		$("#gotoMenuForm").submit();
	}
</script>
<%@ include file="footer.jsp" %>