<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" /><!-- 아이콘 -->
<link rel="stylesheet" href="resources/css/mypage/trackOrder.css">
<script src="/resources/js/mypage/jquery-3.6.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>McDonald's Crew</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<!-- @todo: fill with your company info or remove -->
<meta name="description" content="">
<meta name="author" content="Themelize.me">
 
<link rel="stylesheet" href="resources/css/main/custom.css?t=2021090901"> 
<script src="https://kit.fontawesome.com/d0b304acae.js" crossorigin="anonymous"></script> <!-- fontawesomeCDN -->

<!-- Bootstrap CSS -->	
<link href="resources/css/join/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome -->
<link href="/m/appstrap/css/font-awesome.min.css" rel="stylesheet">

<!-- Mcdonalds Font -->
<link href="/m/appstrap/css/font-mcdonalds.css" rel="stylesheet">

<!-- Plugins -->
<link href="/m/appstrap/plugins/animate/animate.css" rel="stylesheet">
<!-- <link href="/m/appstrap/plugins/flexslider/flexslider.css" rel="stylesheet"> -->
<link href="/m/appstrap/plugins/clingify/clingify.css" rel="stylesheet">

<!-- Theme style -->
<link href="resources/css/join/theme-style.min.css" rel="stylesheet">

<!--Your custom colour override-->
<link href="/m/appstrap/css/colour-red_sh.css" id="colour-scheme" rel="stylesheet">

<link rel="stylesheet" href="/m/appstrap/css/font-awesome-4.5.0" />

<!-- Your custom override -->
<link href="resources/css/join/custom-style_sh.css" rel="stylesheet">

<!-- HTML5 shiv & respond.js for IE6-8 support of HTML5 elements & media queries -->
<!--[if lt IE 9]>
      <script src="/m/appstrap/plugins/html5shiv/dist/html5shiv.js"></script>
      <script src="/m/appstrap/plugins/respond/respond.min.js"></script>
    <![endif]-->
<!-- Le fav and touch icons - @todo: fill with your icons or remove -->
<link rel="shortcut icon" href="/m/appstrap/img/icons/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/m/appstrap/img/icons/114x114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/m/appstrap/img/icons/72x72.png">
<link rel="apple-touch-icon-precomposed" href="/m/appstrap/img/icons/default.png">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300|Rambla|Calligraffitti' rel='stylesheet' type='text/css'>

<!--Retina.js plugin - @see: http://retinajs.com/-->
<script src="/m/appstrap/plugins/retina/js/retina-1.1.0.min.js"></script>

<link rel="stylesheet" type="text/css" href="/js/jquery/ui/themes/base/jquery-ui.css" />

<!-- Scripts --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/m/appstrap/js/jquery.min.js"></script>
<script src="/m/appstrap/js/jquery-migrate-1.2.1.min.js"></script> <!--Legacy jQuery support for quicksand plugin--> 
</head>
<body>

		
<script type="text/javascript">

	$(document).ready(function() {
		
		var limit = $(".header").height();	
		var ch = false;
		
		$(document).scroll(scrollH);	//마우스 스크롤할떄마다 이벤트 발생
		
		$('.btnTop').click(function() {	//Top 클릭시 이벤트
			$('btnTop').removeClass("fixedB");
			$("body,html").animate({"scrollTop":0},200);
		});
		
		function scrollH(){	//마우스 스크롤 이벤트
			if($(".footer").length > 0) {
			       if($(document).scrollTop()+$(window).height() < $(".footer").offset().top ) {
                       $(".btnTop").removeClass('fixedB');
                       $(".aside").removeClass('fixedB');
                   }else{
                       if($(document).scrollTop() !== 0){
                    	   $(".btnTop").addClass('fixedB');
                    	   $('.aside').addClass('fixedB');
                       }
                   }
			}
			 if($(document).scrollTop() < limit ){	
				 $(".header").removeClass('fixed');
                 if(ch) {
                     ch = false;
                     $(".header").removeClass('fixed');
                     return;
                 }
             }else{
                 if(!ch) {
                     ch = true;
                     $(".header").addClass('fixed');
                     $(".header").stop().css({	//현재동작하는 애니메이션을 중지
                         'margin-top':'-30px'
                     }).animate({
                         'margin-top':0
                     },100,function(){	//animate({'속성명':'속성값'}, 가속도, 가속도함수) - animate로 보여지는 속도값지정
                     });
                     return;
                 }
             }
		};
		
		$(".menu").mouseover(function(e){	//메인 메뉴바에 마우스 오버시 이벤트
			$(".header").addClass("open");
		}).mouseout(function(e){			//메인 메뉴바에 마우스 아웃시 이벤트
			$(".header").removeClass("open");
		});

		$(".btn_login").click(function(e){	//로그인 버튼 클릭 이벤트
			e.preventDefault();
			$("#login_pop").slideDown(200);
			$("#login_pop").removeClass("close");
			$(".dimmed").attr("style", "display:block;");
		});
		
		$("#login_pop > .dimmed, #login_pop .btn_x").click(function(e){	//로그인 x버튼 클릭, 바탕 클릭시 이벤트
	 		e.preventDefault(); 
	  		e.stopPropagation();
	 		$("#login_pop").fadeOut(200);
	 		$("#login_pop").addClass("close");
	 		$(".dimmed").attr("style", "display:none;");
		});	
		
		 $("#login_pop .check").click(function(){
			 if($(this).hasClass("checked")){
			   $(this).removeClass("checked");
			 }else{
			   $(this).addClass("checked");
			 }
		 });
		 
		 var utils = {
			scrollDisabled : function()	{
				// console.log('idsenabled')
				$("html , body").css("overflow","hidden");
			},
			scrollEnabled : function() {
				$("html , body").css("overflow","");
			}
		};
		 
		 var topSearch = $(".topSearch")
         $(".srch").click(function(e) {	//검색 돋보기 클릭 이벤트
             utils.scrollDisabled();
             topSearch.addClass("open");
             e.preventDefault();
             topSearch.find(".dimmed").remove();
        	  // $('.dimmed').show();
             topSearch.append("<div class='dimmed'></div>");
             // open
         });
       	 topSearch.find(".close").click(function(e) {	//검색 닫기버튼 클릭 이벤트
             utils.scrollEnabled();
             e.preventDefault();
             topSearch.removeClass("open");
         	 // $('.dimmed').hide();
             topSearch.find(".dimmed").remove()
         });
       	 
       	 $(".btn_view01").click(function(){	//눈알 이미지 클릭 이벤트
       		if($(this).hasClass("on")){
       			$(this).removeClass("on");
       			$("#password").attr("type", "password");
       		} else {
       			$(this).addClass("on");
       			$("#password").attr("type", "text");
       		}
       	 });
       	 
         function clickItem(){	//이용가능한 메뉴 클릭 이벤트
             $(".storeFind .srvcFilter .service>span input").each(function(){	//각각의 input들을 가져오고 반복문을 돌림(for문과 같음)
                 $(this).click(function(){	//this = 클릭한input,  input 클릭시 이벤트(each로인해 반복됨(중복처리되는듯))
                     var chk = $(this).is(":checked");	//is(":checked") = 체크박스 체크여부
                     var dataOff = $(this).siblings("label").find("img").attr("data-off");	//siblings = this선택자를 제외한 같은 선상에있는 this들
                     var dataOn = $(this).siblings("label").find("img").attr("data-on");
                     if(chk){
                         $(this).prop("checked", true);	//this의 속성(checked)의 값을 true로 줌
                         $(this).parent("span").addClass("on");
                         $(this).siblings("label").find("img").attr({"src": dataOn});
                     }else{
                         $(this).prop("checked", false);
                         $(this).parent("span").removeClass("on");
                         $(this).siblings("label").find("img").attr({"src": dataOff});
                     }
                     
                 });
             });
         };
         clickItem();
	});
	
</script>
		<div style="padding: 40px 0px 40px;">
			<div class="container" id="sub-page-content">
				<div class="row">
					<div class="col-md-3 sidebar">
						<div class="section-menu">
							<ul class="nav nav-list">
								<li class="nav-header lnb-header">마이페이지<span>MyPage</span></li>
								<li class=""><a href="mypageupdate.do" class="first">마이페이지<small>MyPage</small><i class="fa fa-angle-right"></i></a></li>
								<li class=""><a href="addressBook.do" class="first">주소<small>Address</small><i class="fa fa-angle-right"></i></a></li>
								<li class="active"><a href="trackOrder.do" class="first">주문조회<small>Order check</small><i class="fa fa-angle-right"></i></a></li>
								<li class=""><a href="orderHistory.do" class="first">주문내역<small>Order details</small><i class="fa fa-angle-right"></i></a></li>
								<li><a href="coupon.do" class="first">쿠폰함<small>Coupon</small><i class="fa fa-angle-right"></i></a></li>
							</ul>
						</div>			
					</div>

<script>
function order_detail_show() {
	if ($("#order_detail_table").css("display") == "none") {
		$("#order_detail_table").show();
	} else {
		$("#order_detail_table").hide();
	}
}

function orderDetail(merchantUid){
		$.ajax({
			type:"POST",
			url :"getCartListByMerchantId.do?merchantuid="+merchantUid,
			contentType:"application/json",
			success : function(res){
				for(var i in res){
					$('#'+merchantUid).append(res[i].cart_product_name+"x"+res[i].cart_product_quantity+
							(res[i].cart_product_side_name!=null?"      <small>"+res[i].cart_product_side_name+"</small>":" ")+
							(res[i].cart_product_drink_name!=null?"<small>         "+res[i].cart_product_drink_name+"</small>":" ")+
							"<br>");
				}
				//var obj = JSON.parse(res);
			}
		}).done(function(){
			$('#alink'+merchantUid).attr("onclick","removeChildm('"+merchantUid+"');");			
		})
}
	
function removeChildm(merchantUid){
	$('#'+merchantUid).text("");
	$('#alink'+merchantUid).attr("onclick","orderDetail('"+merchantUid+"');");
}
</script>
<%-- "orderDetail('${payment.merchantuid }');" --%>
<div class="col-md-9">
	<h3 class="title-divider mt_0">
		<span>주문조회</span><small>Track Order</small>
	</h3>
	<div class="page-content">
		<table class="table-trackorder">
			<thead class="table_head_trackorder">
				<tr>
					<td class="table_head_td">주문 번호</td>
					<td class="table_head_td">예상 배달 시간</td>
					<td class="table_head_td_img">주문 접수</td>
					<td class="table_head_td_img">준비 중</td>
					<td class="table_head_td_img">배달 중</td>
					<td class="table_head_td_img">배달 완료</td>
				</tr>
			</thead>
			<tbody class="table_body_trackorder">
			<c:forEach var="payment"  step="1" begin="0" items="${paymentList}">
				<tr >
					<td class="trackorder_td">
						<input type="hidden" id="merchantuid" value="${payment.merchantuid }"><a href="javascript:void(0);" id="alink${payment.merchantuid }" onclick="orderDetail('${payment.merchantuid }');"   
						 title="주문 상세 내역 보기">${payment.merchantuid }</a>
					</td>
					<td class="trackorder_td">${payment.delivery_time}</td>
					<c:if test="${payment.order_status eq '주문 접수' || payment.order_status eq '준비 중' || payment.order_status eq '배달 중' || payment.order_status eq '배달 완료' }">
					<td class="trackorder_td_img"><img class="trackorder_receive" src="resources/img/notes.png"></td>
					</c:if>
						<c:if test="${payment.order_status eq '준비 중' || payment.order_status eq '배달 중' || payment.order_status eq '배달 완료' }">
					<td class="trackorder_td_img"><img class="trackorder_receive" src="resources/img/cook.png"></td>
					</c:if>
					<c:if test="${payment.order_status eq '배달 중' || payment.order_status eq '배달 완료' }">
					<td class="trackorder_td_img"><img class="trackorder_receive" src="resources/img/delivery-man.png"></td>
					</c:if>
					<c:if test="${ payment.order_status eq '배달 완료' }">
					<td class="trackorder_td_img"><img class="trackorder_receive" src="resources/img/burger.png"></td>
					</c:if>
					<tr ><td id="td${payment.merchantuid }" colspan="5"><span id="${payment.merchantuid }"></span></td></tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="footer.jsp"%>