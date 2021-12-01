<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/bam.css">

<div class="content">
	<div class="visualArea bgWhats01" data-title="새로운 소식"
		data-desc="새로운 소식">
		<div class="inner">
			<h1 class="titDep1">새로운 소식</h1>
			<ul class="navPath">
				<li><a href="/main.do">Home</a></li>
				<li><a href="/store.do">Store</a></li>
				<li><a href="/drive.do">윈드라이브</a></li>
			</ul>
		</div>
	</div>
	<!-- //visualArea -->
	<div class="contArea">
		<div class="inner">
			<h2 class="titDep2">윈드라이브는 어떻게 이용하나요?</h2>
			<p role="text" class="txtInfo">
				운전 중에도 24시간 간편하고 빠르게!<br> 차 안에서 주문하고, 차 안에서 바로 받아 맛있는 윈도날드를 즐겨보세요.
			</p>
			<div class="driveVideo">

				<iframe title="주차보다 쉬운 윈드라이브!" width="100%" height="650px"
					src="https://www.youtube.com/embed/BiMkqfVNmnk?controls=1&amp;cc_lang_pref=ko&cc_load_policy=1"
					frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen>
				</iframe>
			</div>
			<!-- 
				<h3 class="titDep3">차에서 내리지 않고 즐길 수 있는 윈드라이브!</h3>
				<div class="stepFlow driveStep">
					<img src="/kor/images/store/drive_step.gif" alt="주차보다 쉽게! 주차 고민하지 않아도,차에서 창문만 내리면 주문할 수 있어요. 주유보다 빠르게! 자리 잡을 고민 없이 차 안에서 주문하고 바로 받아 시간을 아낄 수 있어요. 차 안에서 맛있게! 주문과 동시에  갓 조리한 음식으로 따뜻하고 맛있게 즐기실 수 있어요.">
				</div>
				<!--<ul class="stepFlow driveStep">
					<li class="s1"><span class="step">주차보다 쉽게!</span> 주차 고민하지 않아도, <br>차에서 창문만 내리면 주문할 수 있어요.</li>
					<li class="s2"><span class="step">주유보다 빠르게!</span> 자리 잡을 고민 없이 차 안에서 주문하고 <br>바로 받아 시간을 아낄 수 있어요.</li>
					<li class="s3"><span class="step">차 안에서 맛있게!</span> 주문과 동시에  갓 조리한 음식으로 <br>따뜻하고 맛있게 즐기실 수 있어요.</li>
					<li class="s4"><span class="step">네번째, 깔끔세팅!</span> 피크닉이나 야외에서도 <br>먹기 편하게 세팅해 드립니다.</li>
				</ul>-->
			<!-- //수정 -->
			<div class="btnArea">
				<a href="javascript:go();" class="btnMC btnL">윈드라이브 매장 검색하기</a>
			</div>
		</div>
	</div>
	<form id="detailForm" method="post">
		<input type="hidden" name="mcdrive_yn" value="Y">
	</form>

	<script>
		function go(){
			$("#detailForm").attr("action","/kor/store/list.do");
			$("#detailForm").submit();
		}
	</script>
</div>
<!-- //contArea -->
<div class="aside">
	<a href="burger.do" class="goDelivery" target="_blank" title="새창 열림">WDonald</a>
</div>

<button type="button" class="btnTop">맨 위로 가기</button>
<!-- //container -->
<%@ include file="footer.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66de1c95d1d79be93897b045b9aca54a&libraries=services"></script>
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
		url : "/kor/store/mcdeliveryCheck.do",
        method : "GET",
        data : { "address": encodeURI($("#addr1").val()),
		     	 "lat"    : $("#lat").val(),
			     "lng"    : $("#lng").val()
		},
		dataType:"json",
        jsonpCallback:"callback",
        success : function(obj) {

            //var obj = eval("("+response+")");
            var deliveryOk = "N";
            var comment = "";
            var sayu = "";
            //alert(obj.Delivery_yn + "," + obj.ResultCode);

            if (obj.ResultCode == "1") deliveryOk = "Y";

            var addr_str = $("#addr1").val()+" "+$("#addr2").val();
            if ($("#dong").val() != "") {
                addr_str = addr_str +" "+$("#dong").val()+"동 "+$("#ho").val()+"호<br />";
            }


            if (deliveryOk == "N") {
                //alert(obj.ResultCode);
                if (obj.ResultCode == "-5000") {
                    alert("아파트의 경우 동, 호수를 입력하셔야 정확한 검색이 가능합니다");
                } else {
                	/*
                    if (obj.ResultCode == "-4002") {
                        sayu = "<br/>배달불가 (사유: 주소이상)"; // 주소이상
                    } else if (obj.ResultCode == "-4005") {
                        sayu = "<br/>배달불가 (사유: 배달시간 외 주문)"; // 배달시간 외 주문
                    } else if (obj.ResultCode == "-4006") {
                        sayu = "<br/>배달불가 (사유: 배달 불배 지역)"; // 배달 불배 지역
                    } else if (obj.ResultCode == "-4008") {
                        sayu = "<br/>배달불가 (사유: 기상상태 악화로 인한 배달불가)"; // 기상상태 악화로 인한 배달불가
                    } else {
                        sayu = ""; // 기타
                    }
                    sayu = "";
                    comment = "<div class='inner'><p><strong>"+addr_str+"</strong> 는(은) 배달가능지역이 아니므로<br /> 직접 매장에 방문하셔야 합니다."+sayu+"</p>"
                                 + "<!--<a href='/www/kor/findus/district.do?sSearch_yn=Y&skey=2&skeyword="+$("#addr1").val()+"'>근처 매장찾기</a>--></div>";
                    $("#resultDefault").hide();
                    $("#resultOk").hide();
                    $("#resultFail").html(comment);
                    $("#resultFail").show();
                    */
                	$("#default").hide();
                    $('#ok').parent('.rBox').removeClass('ok');
                    $('#ok').parent('.rBox').addClass('fail');
                	$("#fail").show();
                	$("#ok").hide();
                	$("#fail > a").focus();
                    
                }
            } else if (deliveryOk == "Y") {
            	/*
                //alert($("#addr1").val() + "지역은 배달 가능지역 입니다.");
                comment = "<div class='inner'><p><strong>"+addr_str+"</strong> 는(은) 배달가능지역입니다.<br/>전화 또는 온라인으로 주문할 수 있습니다.</p>"
                             + "<!--<a href='https://www.mcdelivery.co.kr/kr/' target='_blank'>온라인 주문하기</a>--></div>";
                $("#resultDefault").hide();
                $("#resultFail").hide();
                $("#resultOk").html(comment);
                $("#resultOk").show();
            	*/
            	$("#default").hide();
            	$('#ok').parent('.rBox').addClass('ok');
            	$('#ok').parent('.rBox').removeClass('fail');
            	$("#fail").hide();
            	$("#ok").show();
            	$("#ok > a").focus();
            } else {
                alert("오류가 발생했습니다.");
            }
            return;
        },
        error : function(request, status, error) {
				alert('request='+request+'status='+ status+'error='+ error);
            if (request.status != '0') {
                alert("오류가 발생했습니다.");
                return false;
            }
        }
    });
    return;
}
</script>