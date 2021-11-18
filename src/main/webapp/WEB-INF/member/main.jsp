<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ include file="header.jsp"%>
<c:choose>
<c:when test="${emailResult =='success'}">
	<script>
		alert('이메일 인증 성공')
	</script>
</c:when>
	<c:when test="${emailResult =='fail'}">
		<script>
		alert('이메일 인증 실패')
		</script>
	</c:when>
</c:choose>
<c:if test="${passwordChanged eq 'success' }">
	<script>
			alert('비밀번호 변경이 완료되었습니다.')
	</script>
</c:if>
<div id="container">
	<div class="content">
		<h1 class="hide" data-desc="메인">Main</h1>
		<!-- 
			basicSwiper > swiper ul li li의 업데이트 업데이트 이후 아래 함수 실행
			commonJs.swiperSetup( target ) 함수 실행 타겟은 $('#test1') 아이디나 클래스를 부여해 호출 클래스의 경우 중복인 경우는 순서에 맞춰서 호출해야 하기 때문에
			id를 부여하거나 commonJs.swiperSetup( $('.class:eq(0)') ) , commonJs.swiperSetup( $('.class:eq(1)') )  개별 호출이 필요
		 -->
		<!-- 배너 이미지 -->
		<div class="slideshow-container">
			<div class="mySliders fade">
				<div class="numbertext">1 / 7</div>
						<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1633519760853.png" alt="1955 스모키 더블 베이컨 버거 출시">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">2 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1633519887333.png">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">3 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1633532684256.png"	alt="맥런치 리힛">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">4 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1631842026946.png" alt="해피스낵 Q3">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">5 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1630301940217.png" alt="자두 칠러">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">6 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1621833457701.png" alt="트리플치즈버거">
			</div>
			<div class="mySliders fade">
				<div class="numbertext">7 / 7</div>
				<img style="width:100%" src="https://www.mcdonalds.co.kr/upload/main/banner/1617176534703.png" alt="">
			</div>
		</div>
		<div style="text-align:center">
		  <span class="dot" onclick="currentSlide(1)"></span> 
		  <span class="dot" onclick="currentSlide(2)"></span> 
		  <span class="dot" onclick="currentSlide(3)"></span> 
		  <span class="dot" onclick="currentSlide(4)"></span> 
		  <span class="dot" onclick="currentSlide(5)"></span> 
		  <span class="dot" onclick="currentSlide(6)"></span> 
		  <span class="dot" onclick="currentSlide(7)"></span> 
		</div>

		<!-- //mainEvent -->
		<div class="contArea mainCont">
			<div class="inner">
				<h2 class="titMain">WcDonald's LIVE</h2>
				<ul class="whatsNew" id="menuList">
					<c:forEach items="${selectPromotion}" var="main">
					<li id="promotion_ing">
						<a href="#" data-seq="${main.p_code}">
							<div class="tmb">
								<img src="${main.p_img_path}" alt="${main.p_name}" onclick="javascript:location.href='promotionDetail.do?p_code=${main.p_code}'">
							</div>
							<div class="con">
								<strong class="tit">
									${main.p_title}
								</strong>
								<span id="statusSpan"></span>
							</div>
						</a>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<form id="searchForm" name="searchForm" method="get"> 
			<input type="hidden" name="seq" id="seq">
			<input type="hidden" name="urlCode" id="urlCode">
			<input type="hidden" name="linkurl" id="linkurl">
		</form>
	</div>
	<div class="aside">
		<a href="order.do" class="goDelivery" title="새창 열림">Wcdelivery</a>
	</div>
	<button type="button" class="btnTop">맨 위로 가기</button>
</div>
<!-- //container -->
<script src="resources/js/banner.js"></script>
<%@ include file="footer.jsp"%>
<script>
var slider = {
		setup : function( target )
		{
			var sTarget = target.find('.swiper');
			sTarget.addClass('swiper-container');
			sTarget.find('>ul , >ol').addClass('swiper-wrapper');
			sTarget.find('>ul>li , >ol>li').addClass('swiper-slide');

			if( target.find('.swiper').data('swipe') )
			{
				target.find('.swiper').data('swipe').destroy();
				target.find('.indicator .bar').stop().css('width','0');
				// target.find('.slide-invisible-blank').remove();
			}

			var opt = {};
			if( target.hasClass('basicSwiper') )
			{
				// console.log('-- basic -')
				var transitionVisible = function()
				{
					bar.stop().css('width','0');
					target.find('.swiper-slide').css('visibility','visible');
				}
				var transitionHidden = function()
				{
					target.find('.swiper-slide').css('visibility','hidden');
					if( target.hasClass('swiperType02') ){
						target.find('.swiper-slide-next').css('visibility','visible');
					}
					target.find('.swiper-slide-active').css('visibility','visible');
				}
				opt = {
					delay : 5000 , 
					loop: true,
					navigation : {
						nextEl: target.find('.next'),
						prevEl: target.find('.prev'),
					},
					on : {
						transitionEnd : function(  )
						{
							if( target.find('.indicator button').hasClass('pause') ){
								nextH();
							}
							transitionHidden();
						},
						sliderMove 	:	transitionVisible,
						// slideChange 	:	transitionVisible,
						transitionStart	:	transitionVisible,
						// touchStart		:	transitionVisible
					}
				}
				// 다른 타입
				if( target.hasClass('swiperType02') ){
					opt.slidesPerView = 2;
					opt.slidesPerGroup =  2;
					opt.spaceBetween = 50;
				}

				var bar			= target.find('.indicator .bar');
				var inButton	= target.find('.indicator button');
				inButton.off().addClass('pause')

				inButton.on('click' , function(evt)
				{
					evt.preventDefault();
					if( $(this).hasClass('pause')  ){
						bar.stop().css('width','0');
						$(this).removeClass('pause');
						$(this).text('재생');
					}else{
						$(this).addClass('pause');
						$(this).text('정지');
						nextH();
					}
				});

				inButton.on('keydown',function( evt )
				{
					if( !evt.shiftKey ){
						nextH();
					}
					
				});
				inButton.on('keyup',function( evt )
				{
					if( evt.shiftKey ){
						transitionVisible();
						transitionHidden();
					}
				});

				target.find('.prev').off().on('keyup',function( evt ){
					if( evt.shiftKey ){
						nextH();
					}else{
						transitionVisible();
						transitionHidden();
					}
				})
			}
		}
	}
</script>
