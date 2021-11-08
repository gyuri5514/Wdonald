<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head profile="http://www.w3.org/2005/10/profile">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>McDonald's Crew</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="">
<meta name="author" content="Themelize.me">

<link rel="stylesheet" href="resources/css/main/custom.css?t=2021090901"> 

<script src="https://kit.fontawesome.com/d0b304acae.js" crossorigin="anonymous"></script> <!-- fontawesomeCDN -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="resources/js/join/datepicker.js"></script>
<script src="resources/js/commons.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/join/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/join/theme-style.min.css">
<link rel="stylesheet" href="resources/css/join/custom-style_sh.css">

</head>

<body class="page page-join">
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
									<li><a href="list.do" class="dth2">버거</a></li>
									<li><a href="javascript:gotoMenu(14);" role="button">맥런치</a></li>
									<li><a href="javascript:gotoMenu(3);" class="dth2">맥모닝</a></li>
									<li><a href="javascript:gotoMenu(15);" role="button">해피 스낵</a></li>
									<li><a href="javascript:gotoMenu(7);" class="dth2">사이드 &amp; 디저트</a></li>
									<li><a href="javascript:gotoMenu(9);" class="dth2">맥카페 &amp; 음료</a></li>
									<li><a href="javascript:gotoMenu(5);" class="dth2">해피밀</a></li>
									<!-- <li><a href="javascript:gotoMenu(11);" class="dth2">365일 즐거운 혜택</a></li> -->
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
								<a href="main.do" class="dth1">What’s New</a>
								<ul class="depth2">
									<li><a href="promotion.do" class="dth2">프로모션</a></li>
									<li><a href="/kor/news/list.do" class="dth2">새로운 소식</a></li>
									<!--  li><a href="/kor/kitchen.do" class="dth2">주방공개의 날</a></li -->
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
					<!-- //menu -->
					<form id="commonSearchForm" method="post">
					<div class="util">
						<a href="#login_pop" class="btn_login" title="로그인으로 이동">로그인</a>					
						<a href="join.do" class="btn_register" title="회원가입으로 이동">회원가입</a>
						<a href="cart.do" class="btn_cart" title="카트로 이동">카트</a>
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
								<!--아이디비번 버튼-->
							<!--로그인 창-->
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
		
<!--  Header 파일 끝, memberJoin.jsp  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	/* 
	 $(document).on( "click", "#zip_find", function( e ) {

	 $addressType   = $(this).attr("addressType");
	 $zip           = $(this).attr("zip");
	 $zip1          = $(this).attr("zip1");
	 $zip2          = $(this).attr("zip2");
	 $address       = $(this).attr("address");
	 $address1      = $(this).attr("address1");
	 $address2      = $(this).attr("address2");
	 $addressOption = $(this).attr("addressOption");
	 $focus         = $(this).attr("focus");

	 openDaumPostcode($addressType, $zip, $zip1, $zip2, $address, $address1, $address2, $addressOption, $focus);
	 });

	 });
	 addrType, zip, zip1, zip2, addr, addr1, addr2, addrOpt, addrFocus
	 */
	 
	function openDaumPostcode() {
		 var themeObj = {
				 bgColor: "#F8B01B"
				};
		new daum.Postcode({
			
			oncomplete : function(data) {
				document.querySelector("#m_zipcode").value = data.address;
			},
			theme: themeObj 
		}).open();
	}
</script>
		<div id="content">
		<div class="container" id="sub-page-content">
			<div class="row">
				<div class="col-md-3 sidebar">
					<div class="section-menu">
						<ul class="nav nav-list">
							<li class="nav-header lnb-header">회원가입<span>Join Us</span></li>
							<li class="active"><a href="join.asp" class="first">회원가입<small>Join Us</small><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
				</div>
					<div class="col-md-9">
					<script type="text/javascript" src="resources/js/join/memJoin.js"></script>
					<h3 class="title-divider mt_0">
						<span>회원가입</span>
						<small>Join Us</small>
					</h3>
					<form name="join_form" id="join_form" method="post" action="winMemJoin.do"  onsubmit="">
						<input type="hidden" id="ar1" value="" />
						<input type="hidden" name="id_chk_ok" id="id_chk_ok" value="" />
						<input type="hidden" name="pass_ok" id="pass_ok" value="" /> 
						<input type="hidden" name="pass_chk_ok" id="pass_chk_ok" value="" />
							<div class="box-info mb_20">
								모든 항목이 필수 입력항목입니다.<br />패스워드는 영문대문자, 영문소문자, 숫자 3가지가 혼합되어야 회원가입이
								됩니다.
							</div>
						
						<div class="form-group">
							<label for="m_email" class="dis_b">이메일</label>
							<input name="user_email" id="m_email" type="email"
								class="form-control placeholder" placeholder="example@wdonald.com" /><span id="emailchecktxt"></span>
						</div>
						<div class="form-group">
							<label for="m_name">성명</label> 
							<input type="text" name="user_name" id="m_name" class="form-control placeholder" />
						</div>
						<div class="form-group">
							<label for="m_password">패스워드</label>
							 <input type="hidden" id="login_pwd_chk" name="login_pwd_chk" value="0" /> 
							 <input type="password" id="m_password" name="user_password" value="" maxlength="16" class="form-control placeholder" /> 
							 <span id="pwd_chk_msg" class="f11_ment">
							  	
							  	<span class="pwd_str_msg" level="0" style="display: none;">
							  		<small>패스워드	안전도 : <strong class="level0 text-danger">사용불가</strong></small>
							  	</span> 
							  	
							  	<span class="pwd_str_msg" level="1" style="display: none;">
							  		<small>패스워드	안전도 : <strong class="level1 text-warning">낮음</strong></small>
							  	</span> 
							  	
							  	<span class="pwd_str_msg" level="2" style="display: none;">
							  		<small>패스워드	안전도 : <strong class="level2 text-primary">적정</strong></small>
							  	</span> 
							  	
							  	<span class="pwd_str_msg" level="3" style="display: none;">
									<small>패스워드	안전도 : <strong class="level3 text-success">높음</strong></small>
								</span>
								
							</span>
						</div>
						<div class="form-group">
							<label for="m_password2">패스워드 확인</label> 
							<input type="password" id="m_password2" value="" maxlength="16" class="form-control placeholder" />
								 <span id="pwd_chk_msg2" class="f11_ment"></span>
				
							<div class="box-info mt_10" id="collapseExam">
								<h5>
									<i class="fa fa-check-circle-o"></i> 패스워드 만들기
								</h5>
								<p>
									<small> 1) 비밀번호 작성 규칙은 3개 문자 조합으로 8자리 이상 가능합니다.<br />
										2) 비밀번호 작성 규칙은 2개 문자 조합으로 10자리 이상 가능합니다.<br /> 3) 주민번호, 생일,
										아이디, 전화번호, 연속된 숫자와 문자, <br /> 사전에 포함된 단어가 포함된 패스워드는 피해주시기
										바랍니다.<br /> 4) 타 사이트와 동일한 패스워드의 사용, 이전에 사용했던<br /> 패스워드의 재사용은
										안전하지 않을 수 있습니다.<br /> 5) 패스워드는 길수록, 그리고 많이 혼용할수록 안전합니다.<br />
									</small>
								</p>
								<h5>
									<i class="fa fa-check-circle-o"></i> 패스워드 안전도
								</h5>
								<p class="last">
									<strong>- 사용불가</strong> : 보안에 매우 취약하여 사용할 수 없습니다.<br /> <strong>-
										낮음</strong> : 사용은 가능하지만 보안에 다소 취약합니다.<br /> <strong>- 적정</strong> : 사용
									가능하며 적정수준의 안전한 패스워드입니다.<br /> <strong>- 높음</strong> : 매우 안전한
									패스워드입니다.
								</p>
							</div>
						</div>
						<!-- <a name="daumjuso"></a> -->
						<div class="form-group">
							<label for="m_zipcode" class="dis_b">주소</label>
							<div class="input-group">
								<input name="address1" id="m_zipcode" type="text" class="form-control placeholder" readonly="readonly" /> 
									<span class="input-group-btn">
									<a href="javascript:openDaumPostcode()"	class="btn btn-md btn-default" id="zip_find" zip="m_zipcode" address1="m_address" focus="address2">
									<i class="fa fa-search"></i></a></span>
							</div>
							<input name="address2" id="m_address" type="text" class="form-control placeholder mt_10" />
							<!-- <input type="hidden" name="d_key" value="1"> -->
						</div>						
						<div class="form-group">
							<label for="m_mobile1" class="dis_b" >핸드폰</label>
								<!-- <select	name="m_mobile1" id="m_mobile1" class="form-control dis_ib"	style="width: 30%">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> - 
								<input name="m_mobile2" id="m_mobile2" maxlength="4" type="text" class="form-control placeholder dis_ib" style="width: 30%" />
								 -  -->
								 <input name="user_phone" id="m_mobile3" maxlength="11" type="text"	class="form-control placeholder dis_ib" style="width: 30%" placeholder="'-'은 빼고 입력해주세요!"/>
								 <button type="button" class="btn btn-md btn-red" id="inputPhone">인증문자보내기</button><br/>
								 <input name="send_sms" id="send_sms" class="form-control placeholder dis_ib" maxlength="4" type="text" style="width: 30%; margin : 10px 0;" placeholder="숫자 4글자를 입력해주세요."/>
								 <button type="submit" class="btn btn-md btn-red" id="inputCertified" style="display : none;">인증번호확인</button>
								 <span class="successPhoneChk"></span>
								 <input type="hidden" id="sms_chk" value="0">
						</div>
							<a name="m_birth_cal"></a>
								<div class="form-group">
								<label for="m_birth">생년월일</label>
									<div class="input-group">
									<input type="text" name="user_birth" id="m_birth" maxlength="10" class="form-control placeholder" readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label for="m_sex" class="dis_b">성별</label>
							<label for="m_sex"	class="radio-inline">
								<input type="radio" name="user_gender" id="m_sex1" value="0" />남자</label>
								 <label for="m_sex" class="radio-inline">
								 <input type="radio" name="user_gender" id="m_sex2" value="1" />여자</label>
						</div>

						<label for="sms_agree_ck" class="checkbox-sms">
							 <input	type="checkbox" name="sms_agree" id="sms_agree_ck" value="1" />광고성 SMS 수신동의
						</label> <br> 
						<label for="email_agree_ck" class="checkbox-email">
							<input type="checkbox" name="email_agree" id="email_agree_ck" value="1" />광고성 E-Mail수신동의</label>
					<div class="b_btn_c">
					<!-- <input type="hidden" name="user_status" value="3"> -->
						<button class="btn btn-md btn-red" id="join_ok" type="submit" >확인</button>
						<a href="javascript:history.back();" class="btn btn-md btn-default">뒤로</a>
					</div>
					</form>

				</div>

			</div>
			<!-- //.row -->
		</div>
		<!-- //.container -->
	</div>
	<!-- //#content -->
	
	</div>
<%@ include file="footer.jsp"%>