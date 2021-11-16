<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="/resources/js/popup.js"></script>
<script type="text/javascript" src="/resources/js/libs.js"></script>
<script type="text/javascript" src="/resources/js/KmcCert.js"></script>

<script>
function promotionShow(status) {
	if (status == '') {
		$('#all').attr('aria-selected', 'true');
		$('#end').attr('aria-selected', 'false');
		$('ing').attr('aria-selected', 'false');
		
		if ($('#promotion_ing').css("display") == "none" || $('#promotion_end').css("display") == "none") {
			alert("전체");
			$('#promotion_ing').show();
			$('#promotion_end').show();
		}
	} else if (status == 'I') {
		$('#all').attr('aria-selected','false');
		$('#end').attr('aria-selected','false');
		$('#ing').attr('aria-selected','true');
		
		if ($('#promotion_ing').css("display") == "none" || $('#promotion_end').css("display") == "none") {
			alert("진행중");
			$('#promotion_ing').show();
			$('#promotion_end').hide();
		}
	} else if (status =='E'){
		$('#all').attr('aria-selected','false');
		$('#end').attr('aria-selected','true');
		$('#ing').attr('aria-selected','false');
		
		if ($('#promotion_ing').css("display") == "none" || $('#promotion_end').css("display") == "none") {
			alert("종료");
			$('#promotion_ing').hide();
			$('#promotion_end').show();
		}
	}
	
}
</script>

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
					<li><a href="javascript:promotionShow('');" id="all" role="button">전체보기</a></li>
					<!-- 선택 된 태그에 aria-selected="true" 추가 -->
					<li><a href="javascript:promotionShow('I');" id="ing" role="button">진행중</a></li>
					<li><a href="javascript:promotionShow('E')" id="end" role="button">종료</a></li>
				</ul>
				<!-- 행사 있을 경우 종료된 행사일 경우 class값 end 추가-->
				<ul class="cardBanner" id="promotionList">
					<c:forEach items="${selectPromotion}" var="selectPromotion">
						<li id="promotion_ing">
							<a href="#" data-seq="${selectPromotion.p_code}">
								<div class="tmb">
									<img src="${selectPromotion.p_img_path}" alt="${selectPromotion.p_name}" onclick="javascript:location.href='promotionDetail.do?p_code=${selectPromotion.p_code}'">
								</div>
								<div class="con">
									<strong class="tit">
										${selectPromotion.p_title}
									</strong>
									<span id="statusSpan"></span>
								</div>
							</a>
						</li>
					</c:forEach>
					<c:forEach items="${selectPromotionEnd}" var="selectPromotionEnd">
						<li id="promotion_end">
							<a href="#" data-seq="${selectPromotionEnd.p_code}" class="end">
								<div class="tmb">
									<img src="${selectPromotionEnd.p_img_path}" alt="${selectPromotionEnd.p_name}" onclick="javascript:location.href='promotionDetail.do?p_code=${selectPromotionEnd.p_code}'">
								</div>
								<div class="con">
									<strong class="tit">
										${selectPromotionEnd.p_title}
									</strong>
									<span id="statusSpan">종료된 행사입니다.</span>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
				<div class="btnMore" id="btnMore">
					<a href="javascript:more();" class="more">더보기</a>
				</div>
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
	<form id="searchForm" name="searchForm" method="get">
		<input type="hidden" name="page" id="page" value="1"> 
		<input type="hidden" name="seq" id="seq"> 
		<input type="hidden" name="searchStatus" id="searchStatus"> 
		<input type="hidden" name="urlCode" id="urlCode">
	</form>

	<script type="text/javascript">
		var init_page =0;
		var totalPage =0;	
		var page_status = "";
		
		var isCertificate = false;
		
		$(document).ready(function (){
			getList(1,'');
		});
		
		function getList(page_val,status){
			$.get("/controller/promotion.do",
					{	
						page:page_val,
						searchStatus: status
						
					},	function(data){
						if(data.is_ok=="ok"){
							if(page_status!=status){
							$("#promotionList").empty();
							}
							totalPage=data.totalPage;
							init_page=data.page;
							page_status = data.status;
							
							
							if(data != null && data != ''){
							for(var i=0;i<data.list.length;i++){
								
								if(data.list[i].status_text=="E"){
									data.list[i].end="end";
									data.list[i].end_text = "종료된 행사입니다.";
								}else{
									data.list[i].end="";
									data.list[i].end_text = "";
								}
								$("#promotionList").append(addList(data.list[i]));
							}
							}else{
								$("#promotionList").append(addList());
							}
							altEscapeTag();
							if(totalPage==page_val){
								$("#btnMore").hide();
							}else{
								$("#btnMore").show();
							}
							if(status==''){
								$('#all').attr('aria-selected','true');
								$('#end').attr('aria-selected','false');
								$('#ing').attr('aria-selected','false');
								
							}else if(status == 'I'){
								$('#all').attr('aria-selected','false');
								$('#end').attr('aria-selected','false');
								$('#ing').attr('aria-selected','true');
							}else if (status =='E'){
								$('#all').attr('aria-selected','false');
								$('#end').attr('aria-selected','true');
								$('#ing').attr('aria-selected','false');
							}else{
								alert("잘못된 접근입니다.");
							}
							if(page_val>1){
								$("[data-seq='"+data.list[0].seq+"']").focus();
							}
						}else{
							alert("목록가져오기에 실패하였습니다\관리자에게 문의하세요");
							if(status==''){
								$('#all').attr('aria-selected','true');
								$('#end').attr('aria-selected','false');
								$('#ing').attr('aria-selected','false');
								
							}else if(status == 'I'){
								$('#all').attr('aria-selected','false');
								$('#end').attr('aria-selected','false');
								$('#ing').attr('aria-selected','true');
							}else if (status =='E'){
								$('#all').attr('aria-selected','false');
								$('#end').attr('aria-selected','true');
								$('#ing').attr('aria-selected','false');
							}else{
								alert("잘못된 접근입니다.");
							}
						}
					}
			);
		}
		function addList(data){
			/*if(data.status == "E"){
				
				document.getElementById("listPromotion").add("end")
				;
				
				document.getElementById("statusSpan").innerHTML = "종료된 행사입니다.";
				
			}*/
			return makeHtml("promotion",data);
		}
		function addList2(data){ 
			return makeHtml("promotionNull",data);
		}
		function more(){
			getList(init_page+1,page_status);
		}
		
		/* function goDetail(element){	
		    var data = $(element).attr("data").split(",");
		    var form_data = KmcCert.getUrlCode(data[0],"json");
		
		    $("#seq").val(data[0]);
		    $("#urlCode").val(form_data["urlCode"]);
		    $("#searchStatus").val(page_status);
		
		    var certification = data[2];
		    if(certification !== "N" && isCertificate ){
		        certification = "N";
		    }
		
			if(certification !== "N"){
			    var certPopup = window.open('about:blank','certviewer','width=846,height=700,scrollbars=no,resize=no');
				certPopup.resizeTo(846,700);
		        $("#searchForm").attr("action", "/cert/popup.do");
		        $("#searchForm").attr("target", "certviewer");
		    } else {
		    	$("#searchForm").attr("target", "");
		        $("#searchForm").attr("action","/promotionDetail.do");
		    }
		    $("#searchForm").submit();	
		} */
		
		function certificate(){
			isCertificate = true;
			$("#searchForm").attr("target", "");
		    $("#searchForm").attr("action","/promotionDetail.do");
		    $("#searchForm").submit();	
		}
		
	
	</script>

	<button type="button" class="btnTop">맨 위로 가기</button>
	<!-- //container -->
</body>
<%@ include file="footer.jsp" %>