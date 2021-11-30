<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
		<div id="container">
			<div class="content">
				<div class="visualArea bgStore01" data-title="윈도날드" data-desc="윈도날드">
					<div class="inner">
						<h1 class="titDep1">윈도날드</h1>
						<ul class="navPath">
							<li><a href="main.do">Home</a></li>
							<li><a href="store">Store</a></li>
							<li><a href="delivery.do">윈도날드</a></li>
						</ul>
					</div>
				</div>
				<!-- //visualArea -->
				<div class="contArea">
					<div class="inner">
						<h2 class="titDep2">우리집에 윈도날드 배달이 되나요?</h2>
						<div class="deliverySrch">
							<fieldset class="sBox">
								<legend>윈도날드 가능여부 검색</legend>
								<!-- 20191112 수정 yjs -->
								<div class="frm frwWrap">
									<input type="hidden" id="lat" name="lat" value="">
									<input type="hidden" id="lng" name="lng" value="">
									<span><input type="text" class="addr1" id="addr1" placeholder="주소를 선택해주세요." readonly title="입력 된 주소"></span>
									<button type="button" class="btnMC btnM" onclick="openApiPost()" title="주소찾기 새창 열림">주소찾기</button>
									
								</div>
								<!-- //20191112 수정 yjs -->
								<div class="frm">
									<input type="text" class="addr2" id="addr2" title="상세주소 입력" placeholder="상세주소를 입력하세요."> 
									<input type="text" class="addr3" id="dong" title="동 입력"> <span class="unit">동</span>
									<input type="text" class="addr3" id="ho" title="호 입력"> <span class="unit">호</span>
								</div>
								<p class="txt">* 아파트의 경우 동, 호수를 입력하셔야 정확한 검색이 가능합니다.</p>
								<div class="btn">
									<button type="button" class="btnMC btnM" onclick="Submit()">검색하기</button>
								</div>
							</fieldset>
							<div class="rBox">
								<p role="text" class="default" id="default" style="display:inline-block"><strong>검색 결과가 나타납니다.</strong></p>
								<p role="text" class="result ok" id="ok" style="display:none"><strong style="color: #ffc836">윈도날드<br>배달이<br>가능합니다</strong> <span>전화 또는 온라인으로<br> 주문할 수 있습니다.</span></p>
								<p role="text" class="result fail" id="fail" style="display:none"><strong style="color: #ffc836">윈도날드<br>배달이<br>불가능합니다</strong> <span>빠른 시일 내에 고객님이 계신 곳에<br> 서비스가 가능하도록 노력하겠습니다.</span></p>
							</div>
						</div>
						<ul class="listDep1">
							<li>매장 별 무료 배달 주문 금액 및 소액주문비는 다르게 운영될 수 있으며, 주문 시 결제 페이지에서 미리 확인 하실 수 있습니다.</li>
							<li>윈도날드 가격은 매장과 상이합니다.</li>
							<li>배달 가능 구역 내에서도 기상조건이나 기타 매장의 사정에 따라 배달 서비스 이용이 어려울 수 있습니다.</li>
							<li>주문이 밀리는 시간대에는 배달이 다소 지연될 수 있습니다. 고객님의 너그러운 이해 부탁 드립니다.</li>
							<li>메뉴 주문 시 제공 되는 케찹류나 기타 물품의 경우 기본 제공 수량 기준으로 배달하여 드립니다.</li>
							<li>윈도날드의 운영 시간은 매장과 상이할 수 있습니다.</li>
						</ul>
						<div class="btnArea mcdelivery">
							<div class="appDown">
							    <div>
									<a href="burger.do" class="btnMC btnL action" target="_blank" title="새창 열림">윈도날드 온라인 주문하기</a>
								</div>
							</div>
								<div class="app_store">
									<div class="android">
										<a href="https://play.google.com/store/apps/details?id=com.mwos2.mcdelivery&hl=ko" target="_blank" title="새창열림">
											<img src="https://www.mcdonalds.co.kr/kor/images/store/img_app_android.png" alt="Google play 윈도날드 앱 다운로드 QR코드"></br>
											<strong>안드로이드 윈도날드 앱 다운</strong>
										</a>
									</div>
									<div class="ios">
										<a href="https://apps.apple.com/kr/app/%EB%A7%A5%EB%94%9C%EB%A6%AC%EB%B2%84%EB%A6%AC/id1027699629 " target="_blank" title="새창열림">
											<img src="https://www.mcdonalds.co.kr/kor/images/store/img_app_ios.png" alt="app store 윈도날드 앱 다운로드 QR코드"></br>
											<strong>아이폰 윈도날드 앱 다운</strong>
										</a>
									</div>
								</div>
<!-- 							<div class="tel">
								<img src="/kor/images/store/img_phone.png" alt="전화 주문하기" width=308 height=90/>
							</div> -->
						</div> <!-- #btnArea mcdelivery -->
					</div>
				</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7d2849da01922567115797fadd6e5ca4&libraries=services"></script>
<script type="text/javascript">
function openApiPost(){
	new daum.Postcode({
    	oncomplete: function(data) {
       		// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
       		// 예제를 참고하여 다양한 활용법을 확인해 보세요.
    		$("#addr1").val(data.address);
       		
    		var geocoder = new kakao.maps.services.Geocoder();
    		geocoder.addressSearch(data.address, function(result, status) {
    			 if (status === kakao.maps.services.Status.OK) {
    				 $("#lat").val( result[0].y )
    				 $("#lng").val( result[0].x );
    			 } else {
    				 alert("Error !!!")
    			 }
    		});
    	}
	}).open();
}

function openApiPostcode(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/event/kor/pc/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
function Submit() {

    if ($("#addr1").val() == "") {
        alert("주소를 입력하세요.");
        $("#addr1").focus();
        return;
    }

	$.ajax({

		crossDomain:true,
		url : "isDeliveryAvailable.do",
        method : "POST",
        data : { 
		     	 "lat"    : $("#lat").val(),
			     "lon"    : $("#lng").val()
		},
		dataType:"json",
        jsonpCallback:"callback",
        success : function(obj) {
			console.log(obj);
            //var obj = eval("("+response+")");
            var deliveryOk = "N";
            var comment = "";
            var sayu = "";
            //alert(obj.Delivery_yn + "," + obj.ResultCode);


            var addr_str = $("#addr1").val()+" "+$("#addr2").val();
            if ($("#dong").val() != "") {
                addr_str = addr_str +" "+$("#dong").val()+"동 "+$("#ho").val()+"호<br />";
            }


            if (obj!=null) {
            	
            	$("#default").hide();
            	$('#ok').parent('.rBox').addClass('ok');
            	$('#ok').parent('.rBox').removeClass('fail');
            	$("#fail").hide();
            	$("#ok").show();
            	$("#ok > a").focus();
            } 
            return;
        },
        error : function(request, status, error) {
            	$("#default").hide();
                $('#ok').parent('.rBox').removeClass('ok');
                $('#ok').parent('.rBox').addClass('fail');
            	$("#fail").show();
            	$("#ok").hide();
            	$("#fail > a").focus();
            	
            if (request.status != '0') {
                //alert("오류가 발생했습니다.");
                return false;
            }
        }
    });
    return;
}
</script>
<%@ include file="footer.jsp" %>