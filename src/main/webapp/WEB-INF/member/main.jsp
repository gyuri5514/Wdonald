<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ include file="header.jsp"%>

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
					<li>
						<a href="#" onclick="goDetail(this)" data-seq="118" data="118,N,/kor/promotion/detail.do?page=1&amp;seq=339&amp;utm_medium=Corp_site&amp;utm_source=Main_cardblock&amp;utm_campaign=1007_1955Smoky">
							<div class="tmb">
								<img src="https://www.mcdonalds.co.kr/upload/main/card/1633520217218.png" alt="1955 버거와 함께 할로윈을 더 특별하게! 1955 스모키 더블 베이컨 컴백!">
							</div>
							<div class="con">
								<strong class="tit">1955 버거와 함께 할로윈을 더 특별하게! <br>1955 스모키 더블 베이컨 컴백!</strong>
							</div>
						</a>
					</li>
					<li>
						<a href="#" onclick="goDetail(this)" data-seq="89" data="89,N,/kor/promotion/detail.do?page=1&amp;seq=306&amp;utm_medium=Corp_site&amp;utm_source=Main_cardblock&amp;utm_campaign=0118_Mccafe">
							<div class="tmb">
								<img src="https://www.mcdonalds.co.kr/upload/main/card/1611036026703.png" alt="0.1초에 1잔!   매일 마시는 커피를 더 맛있게"></div>
							<div class="con">
								<strong class="tit">0.1초에 1잔! <br>  매일 마시는 커피를 더 맛있게</strong>
							</div>
						</a>
					</li>
					<li>
						<a href="#" onclick="goDetail(this)" data-seq="117" data="117,N,/kor/promotion/detail.do?page=1&amp;seq=338&amp;utm_medium=Corp_site&amp;utm_source=Main_cardblock&amp;utm_campaign=0923_BA2H">
							<div class="tmb">
								<img src="https://www.mcdonalds.co.kr/upload/main/card/1631843671425.png" alt="달콤! 바삭! 쫄깃! 츄러스 출시 새로운 해피 스낵 가을/겨울 시즌 오픈!"></div>
							<div class="con">
								<strong class="tit">달콤! 바삭! 쫄깃! 츄러스 출시 <br>새로운 해피 스낵 가을/겨울 시즌 오픈!</strong>
							</div>
						</a>
					</li>
					<li>
						<a href="#" onclick="goDetail(this)" data-seq="115" data="115,N,/kor/promotion/detail.do?page=1&amp;seq=336&amp;utm_medium=Corp_site&amp;utm_source=Main_cardblock&amp;utm_campaign=0902_PlumChiller">
							<div class="tmb">
								<img src="https://www.mcdonalds.co.kr/upload/main/card/1630302197958.png" alt="자두 칠러가 돌아왔다!"></div>
							<div class="con">
								<strong class="tit">자두 칠러가 돌아왔다!</strong>
							</div>
						</a>
					</li>
					<li>
						<a href="#" onclick="goDetail(this)" data-seq="104" data="104,N,/kor/promotion/detail.do?page=1&amp;seq=325&amp;utm_medium=Corp_site&amp;utm_source=Main_cardblock&amp;utm_campaign=0527_TripleCheeseburger">
							<div class="tmb">
								<img src="https://www.mcdonalds.co.kr/upload/main/card/1621833597484.png" alt="육즙도 3배! 진한 풍미도 3배! 트리플 치즈버거 출시!"></div>
							<div class="con">
								<strong class="tit">육즙도 3배! 진한 풍미도 3배!<br> 트리플 치즈버거 출시!</strong>
							</div>
						</a>
					</li>
					<li>
						<a href="#" onclick="goDetail(this)" data-seq="97" data="97,N,/kor/promotion/detail.do?page=1&amp;seq=317&amp;utm_medium=Corp_site&amp;utm_source=Main_cardblock&amp;utm_campaign=0401_FOF">
							<div class="tmb">
								<img src="https://www.mcdonalds.co.kr/upload/main/card/1617177291038.png" alt="신선한 맛 가득 담아 알래스카에서 왔다!필레 오 피쉬 출시!"></div>
							<div class="con">
								<strong class="tit">신선한 맛 가득 담아 알래스카에서 왔다!<br>필레 오 피쉬 출시!</strong>
							</div>
						</a>
					</li>
				</ul>
				<div class="btnMore" id="btnMore">
					<a href="javascript:more();" class="more" title="더보기">더보기</a>
				</div>
			</div>
		</div>
		<form id="searchForm" name="searchForm" method="get">
			<input type="hidden" name="seq" id="seq"> <input
				type="hidden" name="urlCode" id="urlCode"> <input
				type="hidden" name="linkurl" id="linkurl">
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
