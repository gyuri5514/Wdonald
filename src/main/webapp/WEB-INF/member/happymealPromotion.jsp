<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<link rel="stylesheet" type="text/css" href="resources/css/bam.css">
<link rel="stylesheet" href="resources/css/promotion/promotion.css">
	<div class="content">
		<div class="visualArea bgWhats01">
			<div class="inner">
				<h1 class="titDep1" data-title="윈딜리버리 프로모션" data-desc="윈딜리버리 프로모션">이달의 해피밀</h1>
				<ul class="navPath">
					<li><a href="/controller/main.do">Home</a></li>
					<li><a href="/controller/promotion.do">What's New</a></li>
					<li><a href="/controller/happymealPromotion.do">이달의 해피밀</a></li>
				</ul>
			</div>
		</div>
		<!-- //visualArea -->
		<div class="contArea bgG">
			<div class="inner">
				<ul class="tabType01">
					<li data-tab="tab-1" class='tab-link current'><a href="#" id="ing" role="button">진행중</a></li>
					<li data-tab="tab-2" class='tab-link'><a href="#" id="end" role="button">종료</a></li>
				</ul>
				<div id="tab-1" class="tab-content current">
					<ul class="cardBanner" id="promotionList">
						<c:forEach items="${selectHappyPromotion}" var="selectHappyPromotion">
							<li id="happy_ing">
								<a href="#" data-seq="${selectHappyPromotion.hp_code}">
									<div class="tmb">
										<img src="${selectHappyPromotion.hp_img_path}" alt="${selectHappyPromotion.hp_name}" onclick="javascript:location.href='happyPromotionDetail.do?hp_code=${selectHappyPromotion.hp_code}'">
									</div>
									<div class="con">
										<strong class="tit">
											${selectHappyPromotion.hp_title}
										</strong>
										<span id="statusSpan"></span>
									</div>
								</a>
							</li>
						</c:forEach>
					</ul>	
				</div>
				<div id="tab-2" class="tab-content">
					<ul class="cardBanner" id="tabcontent">
						<c:forEach items="${selectHappyPromotionEnd}" var="selectHappyPromotionEnd">
							<li id="happy_end">
								<a href="#" data-seq="${selectHappyPromotionEnd.hp_code}" class="end">
									<div class="tmb">
										<img src="${selectHappyPromotionEnd.hp_img_path}" alt="${selectHappyPromotionEnd.hp_name}" onclick="javascript:location.href='happyPromotionDetail.do?hp_code=${selectHappyPromotionEnd.hp_code}'">
									</div>
									<div class="con">
										<strong class="tit">
											${selectHappyPromotionEnd.hp_title}
										</strong>
										<span id="statusSpan">종료된 행사입니다.</span>
									</div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!-- //행사 있을 경우-->
				<!-- 행사 없을 경우 -->

				<!-- //행사 없을 경우 -->
			</div>
		</div>
		<!-- //contArea -->
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
	<div class="aside">
		<a href="burger.do" class="goDelivery" target="_blank" title="새창 열림">WDonald</a>
	</div>
	<button type="button" class="btnTop">맨 위로 가기</button>
	<!-- //container -->
</body>
<%@ include file="footer.jsp" %>