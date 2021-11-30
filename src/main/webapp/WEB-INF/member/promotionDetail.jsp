<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="resources/css/bam.css">
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

.bannerImg .inner {
   position: absolute;
   width: 72.8%;
   top: 18%;
   left: 13.61%;
   height: 11.35%;
}
.bannerImg .inner .video{
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
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
};
</style>

<div class="content">
<div class="content">
	<div class="visualArea bgWhats01">
		<div class="inner">
			<h1 class="titDep1" data-title="맥도날드 프로모션" data-desc="맥도날드 프로모션">윈도날드 프로모션</h1>
			<ul class="navPath">
				<li><a href="/kor/main.do">Home</a></li>
				<li><a href="/kor/promotion/list.do">What's New</a></li>
				<li><a href="/kor/promotion/list.do">윈도날드 프로모션</a></li>
			</ul>
		</div>
	</div>
	<!-- //visualArea -->
	<div class="contArea">
		<div class="inner">
			<div class="bbsDetail">
				<div class="bbsTit">
					<h2>
						${detailPromotion.p_title}
					</h2>
					<span class="date">
						<em><b class="hide">등록일 :</b><fmt:formatDate pattern="yy.MM.dd" value="${detailPromotion.p_regdate}"/></em>
						<em><b class="hide">조회수 :</b>${detailPromotion.p_count}</em>
					</span>
				</div>
				<article class="bbsCon">
					<div class="bannerImg">
						<img src="${detailPromotion.p_detail_img_path}" alt="" onclick="javascript:location.href='promotionDetail.do?p_code=${detailPromotion.p_code}'">
						<div class="inner">
						<c:if test="${!empty detailPromotion.p_youtube}">
						<iframe width="560" height="315" class="video" src="${detailPromotion.p_youtube}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="youtube video1"></iframe>
						</c:if>
						</div>
						<c:if test="${!empty detailPromotion.p_link1}">
						<a href="${detailPromotion.p_link1}" class="link link1">${detailPromotion.p_link1}</a>
						</c:if>
						<c:if test="${!empty detailPromotion.p_link2}">
						<a href="${detailPromotion.p_link2}" class="link link2">${detailPromotion.p_link2}</a>
						</c:if>
					</div>
				</article>
				<div class="btnArea">
					<c:if test="${detailPromotion.p_code ne 2001}">
						<button type="button" onclick="javascript:location.href='promotionDetail.do?p_code=${detailPromotion.p_code - 1}'" class="prev">이전 글 보기</button>
					</c:if>
					<a href="promotion.do" role="button" class="btnMC btnM"><span>목록보기</span></a>
					<c:if test="${detailPromotion.p_code ne 2012}">
						<button type="button" onclick="javascript:location.href='promotionDetail.do?p_code=${detailPromotion.p_code + 1}'" class="next">다음 글 보기</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- //contArea -->
</div>
</div>
<div class="aside">
	<a href="cart.do" class="goDelivery" target="_blank" title="새창 열림">WDonald</a>
</div>
<form id="searchForm" method="post">
	<input type="hidden" name="page" id="page" value="1">
	<input type="hidden" name="seq" id="seq" value="345">
	<input type="hidden" name="rnum" id="rnum">
	<input type="hidden" name="searchStatus" id="searchStatus" value="I">
	<input type="hidden" name="urlCode" id="urlCode">
</form>
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
<form id="reqKMCISForm" name="reqKMCISForm" method="post">
	<input type="hidden" name="tr_cert" id="tr_cert" value="">
	<input type="hidden" name="tr_url" id="tr_url" value="">
	<input type="hidden" name="tr_add" id="tr_add" value="Y">
</form>
<script type="text/javascript" src="/cert/js/KmcCert.js"></script>

<!-- <script type="text/javascript"> 
function goDetail(seq,rnum){

	$("#seq").val(seq);
	$("#rnum").val(rnum);

	$("#searchForm").attr("action","/kor/promotion/detail.do");
	$("#searchForm").submit();
}

//인증 팝업
function openCertPopup() {
	
    var form_data = KmcCert.getUrlCode($("#seq").val(),"json");
    
    $("#urlCode").val(form_data["urlCode"]);
    
    var certPopup = window.open('about:blank','certviewer','width=410,height=645,scrollbars=no, status=0, titlebar=0, toolbar=0');
    $.post("/cert/request.do", $("#searchForm").serialize() , function(response){
               
        $("#tr_url").val(KmcCert.getTargetUrl());
        $("#tr_cert").val(response.tr_cert);

        $("#reqKMCISForm").attr("action", "https://www.kmcert.com/kmcis/web/kmcisReq.jsp");
        //$("#reqKMCISForm").attr("action", "/cert/result.do");
        $("#reqKMCISForm").attr("target", "certviewer");
        $("#reqKMCISForm").submit();
        
	},"json");
 
	 
}

function certificate(result, name, phone){
	console.log(result, name, phone);
	
	if(result == true){
		commonUse.layerOpen('.adult_chk_completed');
	    phone = phone.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-");    

	    $("#form3 #name").val(name);
		$("#form3 #phone").val(phone);
				
	} else {
		commonUse.layerOpen('.adult_chk_fail');
	}
}

$(function(){

    $(".bannerImg .layerPopup").click(function(){
        $(".promo_landing_wrap .cont img").attr("src", $(".bannerImg .layerPopup").attr("href"));
        $("html, body").animate({scrollTop: 0}, 300);
        $(".promo_landing_wrap .promo_landing_pop").css({
                "top":  100 +"px",
                "left": (($(window).width()-$(".promo_landing_wrap .promo_landing_pop").outerWidth())/2+$(window).scrollLeft())+"px"
         });
        $(".promo_landing_wrap .promo_landing_mask").css("display","block");
        $(".promo_landing_wrap .promo_landing_pop").css("display","block");
    	$(".promo_landing_wrap .promo_landing_mask").height($(window).height());
        return false;
    });
    $(".promo_landing_wrap .btn_close").click(function(){
        $(".promo_landing_wrap .promo_landing_mask").css("display","none");
        $(".promo_landing_wrap .promo_landing_pop").css("display","none");
    });

    $(window).resize( function(){
    	$(".promo_landing_wrap .promo_landing_mask").height($(window).height());
    });
});
</script> -->
<div class="aside">
	<a href="burger.do" class="goDelivery" target="_blank" title="새창 열림">Mcdelivery</a>
</div>
<button type="button" class="btnTop">맨 위로 가기</button>
<!-- //container -->
<!-- //wrapper -->