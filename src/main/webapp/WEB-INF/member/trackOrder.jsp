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
<!-- 
	<div class="skipMenu"><a href="#container">본문 바로가기</a></div>
	<div class="wrapper ">
		<header class="header">상단 고정 fixed 클래스 추가, 메뉴의 depth1 오버시 open 클래스 추가
			<div class="headArea">
				<strong class="hLogo"><a href="main.do" class="logo" title="메인으로 이동"><img src="resources/wcdonald.png" alt="맥도날드"></a></strong>
				<nav class="hMenu">
					<div class="menu">
						<ul class="depth1">
							<li>li 오버시 on 클래스 추가
								<a href="javascript:gotoMenu(1);" class="dth1">Menu</a>현재페이지 메뉴에 current 클래스 추가
								<ul class="depth2">
									<li><a href="list.do" class="dth2">버거</a></li>
									<li><a href="javascript:gotoMenu(14);" role="button">맥런치</a></li>
									<li><a href="javascript:gotoMenu(3);" class="dth2">맥모닝</a></li>
									<li><a href="javascript:gotoMenu(15);" role="button">해피 스낵</a></li>
									<li><a href="javascript:gotoMenu(7);" class="dth2">사이드 &amp; 디저트</a></li>
									<li><a href="javascript:gotoMenu(9);" class="dth2">맥카페 &amp; 음료</a></li>
									<li><a href="javascript:gotoMenu(5);" class="dth2">해피밀</a></li>
									<li><a href="javascript:gotoMenu(11);" class="dth2">365일 즐거운 혜택</a></li>
								</ul>
							</li>
							<li>
								<a href="#" class="dth1 ">Store</a>
								<ul class="depth2">
									<li><a href="store.do" class="dth2">매장찾기</a></li>
									<li><a href="/kor/store/mcdelivery.do" class="dth2">맥딜리버리</a></li>
									<li><a href="/kor/store/mcdrive.do" class="dth2">맥드라이브</a></li>
									<li><a href="/kor/store/rental.do" class="dth2">임차문의</a></li>
								</ul>
							</li>
							<li>
								<a href="/kor/promotion/list.do" class="dth1">What’s New</a>
								<ul class="depth2">
									<li><a href="/kor/promotion/list.do" class="dth2">프로모션</a></li>
									<li><a href="/kor/news/list.do" class="dth2">새로운 소식</a></li>
									 li><a href="/kor/kitchen.do" class="dth2">주방공개의 날</a></li
								    <li><a href="/kor/happymeal/list.do" class="dth2">이달의 해피밀</a></li> 
								</ul>
							</li>
							<li>
								<a href="/kor/story/main.do" class="dth1">Story</a>
								<ul class="depth2">
									<li><a href="/kor/story/intro/brandintro.do" class="dth2">브랜드 소개</a></li>
									<li><a href="/kor/story/society/list.do" class="dth2">사회적 책임과 지원</a></li>
									<li><a href="/kor/story/competition/farmToRestaurant.do" class="dth2">맥도날드 경쟁력</a></li>
									<li><a href="/kor/story/people/crew.do" class="dth2">맥도날드 사람들</a></li>
								</ul>
							</li>
						</ul>
					</div>
					//menu
					<form id="commonSearchForm" method="post">
					<div class="util">
						<a href="#login_pop" class="btn_login" title="로그인으로 이동">로그인</a>					
						<a href="join.do" class="btn_register" title="회원가입으로 이동">회원가입</a>
						<a href="cart.do" class="btn_cart" title="카트로 이동">카트</a>
						<div class="topSearch">검색 활성화인 경우 open 클래스 추가
							<button type="button" class="srch">검색 열기</button>
							<fieldset class="srchField">
								<legend>통합검색</legend>
								<div class="form">
									<input type="text" name="commonSearchWord" id ="commonSearchWord" placeholder="매장 또는 메뉴정보를 검색하실 수 있습니다." title="검색어 입력" onkeypress="if( event.keyCode==13 ){gotoCommonSearch();}" >
									<button type="button" class="btnMC btnM" onclick="gotoCommonSearch()">검색하기</button>
								</div>
								<button type="button" class="close">검색 닫기</button>
							</fieldset>
						</div>
					</div>
					</form>
					//util
					로그인 폼
					<div id="login_pop" class="close">
						<div class="wrapper shadow clearfix">
							<div>
								<p class="roboto">Wcdonalds</p>
								<h3 class="tit01 tit_ico key01">일반 로그인</h3>
								<form action="#" method="post">
									<div class="input">
										<input id="id" type="text" placeholder="아이디를 입력하세요" name="#" data-role="textfield">
									</div>
									<div class="input">
										<input id="password" type="password" placeholder="비밀번호를 입력하세요"	name="#" data-role="textfield">
										<button type="button" tabindex="-1" class="btn_view01"></button>
									</div>
									<div class="check">
										<div>
											<i class="fas fa-check"></i>
										</div>
										<p>앞으로도 자동으로 로그인</p>
									</div>
									<div>
										<input type="submit" value="로그인">
									</div>
									<div>
										<a href="javascript:alert('회원가입페이지는 준비중입니다.')">회원가입</a> <a
											href="javascript:alert('비밀번호찾기 페이지는 준비중입니다.')">비밀번호 찾기</a>
									</div>
								</form>
								아이디비번 버튼
							로그인 창
							</div>
							<div class="simple_login">
								<div class="btn_x">
									<i class="fas fa-times"></i>
								</div>
								<h3 class="tit01 tit_ico lock">간편 로그인</h3>
								<ul class="list">
									<li class="naver"><a><span>네이버 로그인</span></a></li>
									<li class="kakao"><a><span>카카오톡 로그인</span></a></li>
								</ul>
							</div>
						</div>
						//wrapper
						<div class="dimmed"></div>
					</div>
				</nav>
			</div>
			<form id="gotoMenuForm" method="post">
				<input type="hidden" name="sub_category_seq" id="gotoform_sub_category_seq">
			</form>
		</header>
		//header -->
		
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
</script>

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
				<tr>
					<td class="trackorder_td">
						<a href="javascript:order_detail_show()" id="order_detail" title="주문 상세 내역 보기">주문번호</a>
					</td>
					<td class="trackorder_td">예상 배달 시간</td>
					<td class="trackorder_td_img"><img class="trackorder_receive" src="resources/img/notes.png"></td>
					<td class="trackorder_td_img"><img class="trackorder_receive" src="resources/img/cook.png"></td>
					<td class="trackorder_td_img"><img class="trackorder_receive" src="resources/img/delivery-man.png"></td>
					<td class="trackorder_td_img"><img class="trackorder_receive" src="resources/img/burger.png"></td>
				</tr>
			</tbody>
			<tfoot class="table_foot_trackorder">
				<tr class="table_foot_tr">
					<td colspan="6" class="table_foot_td"><a data-toggle="modal" class="btn btn-red btn-lg" href="list.do">새로운 주문하기</a>
						<p>
							<a href="#trackOrder" data-toggle="modal" class="action-secondary action-link">
								<i class="fa fa-caret-right"></i> 주문 조회가 안 되시나요?
							</a>
						</p>
					</td>
				</tr>
			</tfoot>
		</table>
		<div id="order_detail_table">
			<table>
				<!-- <thead class="table_head_trackorder">
					<tr>
						<td class="table_head_td">주문 상품</td>
						<td class="table_head_td">총 결제 금액</td>
					</tr>
				</thead> -->
				<tbody class="table_body_trackorder">
					<tr>
						<td class="trackorder_td">
							빅맥<br>
							<small>라지세트 : 37,650원</small>
						</td>
						<td class="trackorder_td_totalprice">37,650원</td>
					</tr>
				</tbody>
				<tfoot>
					<tr> 
						<td>
							총 주문금액
						</td>
					</tr>
					<tr>
						<td>
							배달팁
						</td>
					</tr>
					<tr>
						<td>
							총 결제금액
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>