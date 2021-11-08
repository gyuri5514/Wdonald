<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Wcdonald's</title>
<meta name="description" id="description" content="메뉴, 레스토랑, 프로모션 등 안내"/>
<meta name="keywords" content="McDonald's, McDrive, McDelivery, McMorning, Happy Meal, Signature Burger, McAllday, McCafe"/>
<link rel="shortcut icon" type="image/x-icon" href="https://www.mcdonalds.co.kr/kor/images/favicon.ico">
<link rel="stylesheet" href="resources/css/main/custom.css?t=20211031"> 
<link rel="alternate" href="https://www.mcdonalds.co.kr">
<script src="/kor/js/libs.js"></script>
<script src="/kor/js/popup.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=66de1c95d1d79be93897b045b9aca54a&libraries=services,clusterer,drawing"></script>
<script defer src="https://www.googletagmanager.com/gtag/js?id=UA-15032749-2"></script>
<script src="https://kit.fontawesome.com/d0b304acae.js" crossorigin="anonymous"></script> <!-- fontawesomeCDN -->
<!-- naver login -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/custom.js?t=2021031801"></script>
<script src="resources/js/commons.js"></script>
</head>
<body>
<c:if test="${!empty status }">
	<c:choose>
		<c:when test="${status eq 0}">
		<script>
			alert('탈퇴한 회원입니다.');
			</script>
		</c:when>
		<c:when test="${status eq 2}">
		<script>
			alert('정지당한 회원입니다.');
			</script>
		</c:when>
		<c:when test="${status eq 3}">
		<script>
			alert('이메일 인증을 완료해주세요.');
			</script>
		</c:when>
		<c:when test="${status eq 6}">
		<script>
			alert('옳바른 아이디를 입력해주세요.');
			</script>
		</c:when>
		<c:when test="${status eq 7}">
		<script>
			alert('비밀번호가 옳바르지않습니다.');
			</script>
		</c:when>
	</c:choose>
</c:if>
	<div class="skipMenu"><a href="#container">본문 바로가기</a></div>
	<div class="wrapper ">
		<header class="header"><!-- 상단 고정 fixed 클래스 추가, 메뉴의 depth1 오버시 open 클래스 추가 -->
			<div class="headArea">
				<strong class="hLogo"><a href="main.do" class="logo" title="메인으로 이동"><img src="resources/wcdonald.png" alt="맥도날드"></a></strong>
				<nav class="hMenu">
					<div class="menu">
						<ul class="depth1">
							<li><!-- li 오버시 on 클래스 추가 -->
								<a href="javascript:gotoMenu(1);" class="dth1">Menu</a><!-- 현재페이지 메뉴에 current 클래스 추가 -->
								<ul class="depth2">
									<li><a href="burger.do" class="dth2">버거</a></li>
									<li><a href="javascript:gotoMenu(14);" role="button">맥런치</a></li>
									<li><a href="morning.do" class="dth2">맥모닝</a></li>
									<li><a href="javascript:gotoMenu(15);" role="button">해피 스낵</a></li>
									<li><a href="side.do" class="dth2">사이드 &amp; 디저트</a></li>
									<li><a href="drink.do" class="dth2">맥카페 &amp; 음료</a></li>
									<li><a href="javascript:gotoMenu(5);" class="dth2">해피밀</a></li>
									<!-- <li><a href="javascript:gotoMenu(11);" class="dth2">365일 즐거운 혜택</a></li> -->
								</ul>
							</li>
							<li>
								<a href="#" class="dth1 ">Store</a>
								<ul class="depth2">
									<li><a href="store.do" class="dth2">매장찾기</a></li>
									<li><a href="mcdelivery.do" class="dth2">맥딜리버리</a></li>
									<li><a href="mcdrive.do" class="dth2">맥드라이브</a></li>
									<li><a href="rental.do" class="dth2">임차문의</a></li>
								</ul>
							</li>
							<li>
								<a href="/kor/promotion/list.do" class="dth1">What’s New</a>
								<ul class="depth2">
									<li><a href="promotion.do" class="dth2">프로모션</a></li>
									<li><a href="/kor/news/list.do" class="dth2">새로운 소식</a></li>
									<!--  li><a href="/kor/kitchen.do" class="dth2">주방공개의 날</a></li -->
								    <li><a href="/kor/happymeal/list.do" class="dth2">이달의 해피밀</a></li> 
								</ul>
							</li>
							<li>
								<a href="main.do" class="dth1">Story</a>
								<ul class="depth2">
									<li><a href="brandintro.do" class="dth2">브랜드 소개</a></li>
									<li><a href="list.do" class="dth2">사회적 책임과 지원</a></li>
									<li><a href="competition.do" class="dth2">맥도날드 경쟁력</a></li>
									<li><a href="crew.do" class="dth2">맥도날드 사람들</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<!-- //menu -->
					<form id="commonSearchForm" method="post">
					<div class="util">
					
					<c:choose>
						<c:when test="${not empty sessionScope.user_email}">
							<a href="logout.do" class="btn_register" title="로그아웃">로그아웃</a>					
							<a href="mypageupdate.do" class="btn_register" title="마이페이지">마이페이지</a>
							<a href="order.do" class="btn_cart" title="카트로 이동">카트</a>
						</c:when>
						<c:when test="${not empty sessionScope.kakaoSession}">
							<a href="#" class="btn_register"  onclick="javascript:kakaoLogout()" title="로그아웃">로그아웃</a>					
							<a href="mypageupdate.do" class="btn_register" title="마이페이지">마이페이지</a>
							<a href="order.do" class="btn_cart" title="카트로 이동">카트</a>
						</c:when>
						<c:when test="${not empty sessionScope.naverSession}">
							<a href="#" onclick="naverLogout('${sessionScope.naverAccessKey}')" class="btn_register" title="로그아웃">로그아웃</a>					
							<a href="mypageupdate.do" class="btn_register" title="마이페이지">마이페이지</a>
							<a href="order.do" class="btn_cart" title="카트로 이동">카트</a>
						</c:when>
						<c:when test="${empty sessionScope.user_email && empty sessionScope.kakaoSession && empty sessionScope.naverSession}">
							<a href="#login_pop" class="btn_login" title="로그인으로 이동">로그인</a>					
						<a href="join.do" class="btn_register" title="회원가입으로 이동">회원가입</a>
						<a href="order.do" class="btn_cart" title="카트로 이동">카트</a>
						</c:when>
					</c:choose>
						<div class="topSearch"><!-- 검색 활성화인 경우 open 클래스 추가 -->
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
					<!-- //util -->
					<!-- 로그인 폼 -->
					<div id="login_pop" class="close">
						<div class="wrapper shadow clearfix">
							<div>
								<p class="roboto">Wcdonalds</p>
								<h3 class="tit01 tit_ico key01">일반 로그인</h3>
								<form action="memLogin.do" method="post" >
									<div class="input">
										<input id="id" type="text" placeholder="아이디를 입력하세요" name="user_email" data-role="textfield">
									</div>
									<div class="input">
										<input id="password" type="password" placeholder="비밀번호를 입력하세요"	name="user_password" data-role="textfield">
										<button type="button" tabindex="-1" class="btn_view01"></button>
									</div>
									<div class="check">
										<div>
											<i class="fas fa-check"></i>
										</div>
										<p>앞으로도 자동으로 로그인</p>
									</div>
									<div>
										<input type="submit" id="loginBtn" value="로그인">
									</div>
									<div>
										<a href="javascript:alert('회원가입페이지는 준비중입니다.')">회원가입</a> <a
											href="javascript:alert('비밀번호찾기 페이지는 준비중입니다.')">비밀번호 찾기</a>
									</div>
								</form>
								<!--아이디비번 버튼-->
							<!--로그인 창-->
							</div>
							<div class="simple_login">
								<div class="btn_x">
									<i class="fas fa-times"></i>
								</div>
								<h3 class="tit01 tit_ico lock">간편 로그인</h3>
								<ul class="list">
									<li class="naver"><a id="naverIdLogin_loginButton" href="javascript:void(0)"><span>네이버 로그인</span></a></li>
									<li class="kakao" onclick="kakaoLogin();"><a href="javascript:void(0)"><span>카카오톡 로그인</span></a></li>
								</ul>
							</div>
						</div>
						<!--//wrapper-->
						<div class="dimmed"></div>
					</div>
				</nav>
			</div>
			
			<form id="gotoMenuForm" method="post">
				<input type="hidden" name="sub_category_seq" id="gotoform_sub_category_seq">
			</form>
		</header>
		<!-- //header -->
