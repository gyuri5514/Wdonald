<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="resources/css/bam.css">
<link rel="stylesheet" href="resources/css/promotion/promotion.css">
	<div class="content">
		<div class="visualArea bgWhats01">
			<div class="inner">
				<h1 class="titDep1" data-title="윈딜리버리 프로모션" data-desc="윈딜리버리 프로모션">윈딜리버리 프로모션</h1>
				<ul class="navPath">
					<li><a href="/controller/main.do">Home</a></li>
					<li><a href="/controller/promotion.do">What's New</a></li>
					<li><a href="/controller/promotion.do">프로모션</a></li>
				</ul>
			</div>
		</div>
		<!-- //visualArea -->
		<div class="contArea bgG">
			<div class="inner">
				<ul class="tabType01">
					<!-- 선택 된 태그에 aria-selected="true" 추가 -->
					<li data-tab="tab-1" class='tab-link current'><a href="#" id="ing" role="button">진행중</a></li>
					<li data-tab="tab-2" class='tab-link'><a href="#" id="end" role="button">종료</a></li>
				</ul>
				<div id="tab-1" class="tab-content current">
					<ul class="cardBanner" id="tabcontent">
					<c:forEach items="${selectPromotionIng}" var="selectPromotionIng">
						<li data-tab="tab1" class='tabmenu' id="default">
							<a href="#" data-seq="${selectPromotionIng.p_code}">
								<div class="tmb">
									<img src="${selectPromotionIng.p_img_path}" alt="${selectPromotionIng.p_name}" onclick="javascript:location.href='promotionDetail.do?p_code=${selectPromotionIng.p_code}'">
								</div>
								<div class="con">
									<strong class="tit"> ${selectPromotionIng.p_title} </strong> 
									<span id="statusSpan"></span>
								</div>
							</a>
						</li>
					</c:forEach>
					</ul>
				</div>
				<div id="tab-2" class="tab-content">
					<ul class="cardBanner" id="tabcontent">
					<c:forEach items="${selectPromotionEnd}" var="selectPromotion">
						<li data-tab="tab1" class='tabmenu' id="default">
							<a href="#" data-seq="${selectPromotion.p_code}" class="end">
								<div class="tmb">
									<img src="${selectPromotion.p_img_path}" alt="${selectPromotion.p_name}" onclick="javascript:location.href='promotionDetail.do?p_code=${selectPromotion.p_code}'">
								</div>
								<div class="con">
									<strong class="tit"> ${selectPromotion.p_title} </strong> 
									<span id="statusSpan">종료된 행사입니다</span>
								</div>
							</a>
						</li>
					</c:forEach>
					</ul>
				</div>
				<!-- 행사 있을 경우 종료된 행사일 경우 class값 end 추가-->
				<!-- //행사 있을 경우-->
				<!-- 행사 없을 경우 -->

				<!-- //행사 없을 경우 -->
			</div>
		</div>
		<!-- //contArea -->
	</div>
	<div class="aside">
		<a href="/controller/main.do" class="goDelivery" target="_blank" title="새창 열림">Wdelivery</a>
	</div>
	<script>
		$(document).ready(function() {
			$('ul.tabType01 li').click(function() {
				
				var tab_id = $(this).attr('data-tab');
				
				$('ul.tabType01 li').removeClass('current');
				$('.tab-content').removeClass('current');
				
				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			});
		});
	</script>
	<button type="button" class="btnTop">맨 위로 가기</button>
	<!-- //container -->
</body>
<%@ include file="footer.jsp" %>