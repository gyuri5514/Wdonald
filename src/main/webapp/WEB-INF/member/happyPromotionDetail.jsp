<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="resources/css/bam.css">
<link rel="stylesheet" href="resources/css/promotion/promotion.css">
<div class="content">
	<div class="visualArea bgWhats01">
		<div class="inner">
			<h1 class="titDep1" data-title="윈딜리버리 프로모션" data-desc="윈딜리버리 프로모션">이 달의 해피밀</h1>
			<ul class="navPath">
				<li><a href="/controller/main.do">Home</a></li>
				<li><a href="/controller/promotion.do">What's New</a></li>
				<li><a href="/controller/happypromotion.do">이 달의 해피밀</a></li>
			</ul>
		</div>
	</div>
	<!-- //visualArea -->
	<div class="contArea">
		<div class="inner">
			<div class="bbsDetail">
				<div class="bbsTit">
					<h2>${happyPromotionDetail.hp_title}</h2>
					<span class="date">
						<em><b class="hide">등록일 :</b><fmt:formatDate pattern="yy.MM.dd" value="${happyPromotionDetail.hp_regdate}" /></em>
						<em><b class="hide">조회수 :</b>${happyPromotionDetail.hp_count}</em>
					</span>
				</div>
				<article class="bbsCon">
					<style>
.bannerImg {
	position: relative;
	width: 1168px;
	margin: 0 auto;
}

.bannerImg img {
	width: 1168px;
}

.bannerImg .blind {
	position: absolute;
	left: -1000%;
	top: 0;
	width: 1px;
	height: 1px;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
}

.bannerImg .link {
	display: block;
	position: absolute;
	font-size: 0;
	line-height: 0;
	color: transparent;
	top: 1800px;
	width: 342px;
	height: 94px;
	transform: translateX(-50%);
	left: 50%;
}
</style>
					<div class="bannerImg">	
						<img src="${happyPromotionDetail.hp_detail_img_path}" alt="" onclick="javascript:location.href='happyPromotionDetail.do?hp_code=${happyPromotionDetail.hp_code}'">
						<a href="store.do" class="link link1">가까운 매장 찾기</a>
					</div>
				</article>
				<div class="btnArea">
					<c:if test="${happyPromotionDetail.hp_code != selectHappyPromotion_first}">
						<button type="button" onclick="javascript:location.href='happyProtionDetail.do?hp_code=${happyPromotionDetail.hp_code - 1}'" class="prev">이전 글 보기</button>
					</c:if>
					<a href="happymealPromotion.do" role="button" class="btnMC btnM"><span>목록보기</span></a>
					<c:if test="${happyPromotionDetail.hp_code != selectHappyPromotionEnd_end}">
						<button type="button" onclick="javascript:location.href='happyPromotionDetail.do?hp_code=${happyPromotionDetail.hp_code + 1}'" class="next">다음 글 보기</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- //contArea -->
</div>
<div class="aside">
	<a href="burger.do" class="goDelivery" target="_blank" title="새창 열림">Windelivery</a>
</div>
<div class="promo_landing_wrap">
	<div class="promo_landing_mask"></div>
	<div class="promo_landing_pop">
		<div class="promo_landing_pop_inner">
			<a href="javascript:;" class="btn_close">
				<img src="/kor/images/common/ko_m2_btn03.png" alt="">
			</a>
			<div class="cont">
				<img alt="popup">
			</div>
		</div>
	</div>
</div>
<button type="button" class="btnTop">맨 위로 가기</button>
<!-- //container -->
<!-- //wrapper -->
<%@ include file="footer.jsp"%>