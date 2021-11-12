<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/bam.css">

<div class="content">
	<div class="visualArea bgWhats01">
		<div class="inner">
			<h1 class="titDep1" data-title="맥도날드 프로모션" data-desc="맥도날드 프로모션">맥도날드
				프로모션</h1>
			<ul class="navPath">
				<li><a href="/kor/main.do">Home</a></li>
				<li><a href="/kor/promotion/list.do">What's New</a></li>
				<li><a href="/kor/promotion/list.do">맥도날드 프로모션</a></li>
			</ul>
		</div>
	</div>
	<!-- //visualArea -->
	<div class="contArea">
		<div class="inner">
			<div class="bbsDetail">
				<div class="bbsTit">
					<h2>
						맥도날드 앱에서 만나는 <br>달콤한 바닐라 라떼 무료 쿠폰!
					</h2>
					<span class="date"> <em><b class="hide">등록일 :</b>
							21.10.28</em> <em><b class="hide">조회수 :</b> 31097</em>
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
						<img src="${detailPromotion.p_detail_img_path}" alt="" onclick="javascript:location.href='promotionDetail.do?p_code=${selectPromotion.p_code}'">
							<a href="https://www.mcdonalds.co.kr/kor/store/main.do?utm_medium=Corp_site&utm_source=landing_Button_Shop&utm_campaign=1104_VanillaGMAL"
							class="link link1">가까운 매장 찾기
							</a>
						<div class="blind">
							<h1>오직 맥도날드 앱에서만! 모든 메뉴 구매 시 사용 가능한 바닐라 라떼 쿠폰 증정!</h1>
							<ul>
								<li>커피 판매 시간에 한함</li>
								<li>본 행사는 운영 사정에 따라 사전 고지 없이 종료될 수 있음</li>
								<li>쿠폰 단독 사용은 불가하며, 다른 메뉴와 함께 주문 시 사용</li>
								<li>모바일 쿠폰은 맥도날드 매장 방문 시 사용 가능하며, 키오스크에서도 사용 가능</li>
								<li>모바일 쿠폰은 바닐라 라떼(M) 단품 쿠폰 1장이며, 다른 메뉴로 교환할 수 없음. 단, 아이스
									바닐라 라떼(M)으로 교환은 가능</li>
								<li>1주문 당 1장 사용 가능 / 타 쿠폰 및 할인 프로모션과 중복 사용 불가</li>
								<li>배달 주문 및 일부 매장에서 사용 불가(쿠폰 사용 가능 매장은 앱 내 '맥도날드앱 사용팁' 에서
									확인 가능)</li>
							</ul>
							<p>맥딜리버리 앱으로 빠르고! 간편하게!</p>
							<p>지금 QR코드를 스캔하여 맥도날드 앱을 다운 받아 보세요!</p>
							<p>지금 맥도날드 앱 가입하면 맥스파이시 상하이 버거가 2,000원!</p>
							<p>지금 QR코드를 스캔하여 맥도날드 앱을 다운 받아 보세요!</p>
						</div>
					</div>
				</article>
				<div class="btnArea">
					<a href="promotion.do" role="button" class="btnMC btnM"><span>목록보기</span></a>
					<button type="button" onclick="javascript:location.href='promotionDetail.do?p_code=${detailPromotion.p_code + 1}'"
						class="next">다음 글 보기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- //contArea -->
</div>
<div class="aside">
	<a href="cart.do" class="goDelivery" target="_blank" title="새창 열림">Mcdelivery</a>
</div>
<form id="searchForm" method="post">
	<input type="hidden" name="page" id="page" value="1"> <input
		type="hidden" name="seq" id="seq" value="345"> <input
		type="hidden" name="rnum" id="rnum"> <input type="hidden"
		name="searchStatus" id="searchStatus" value="I"> <input
		type="hidden" name="urlCode" id="urlCode">
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

<script type="text/javascript"> 
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
</script>
<div class="aside">
	<a href="https://www.mcdelivery.co.kr/kr/" class="goDelivery" target="_blank" title="새창 열림">Mcdelivery</a>
</div>
<button type="button" class="btnTop">맨 위로 가기</button>
<!-- //container -->
<!-- //wrapper -->

<script type="text/javascript">
	$(function()
		{
		
		});
	</script>
</body>
</html>
