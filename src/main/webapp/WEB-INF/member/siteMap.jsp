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
		<div class="titleArea" data-title="사이트맵" data-desc="사이트맵">
			<div class="inner">
				<h1 class="titDep1">사이트맵</h1>
				<ul class="navPath">
					<li><a href="/main.do">Home</a></li>
					<li><a href="/siteMap.do">사이트맵</a></li>
				</ul>
			</div>
		</div>
		<!-- //visualArea -->
		<div class="contArea">
			<div class="inner">
				<ul class="siteMap">
					<li><a href="burger.do">Menu</a>
						<ul class="depth">
							<li><a href="burger.do" class="dth2">버거</a></li>
							<li><a href="morning.do" class="dth2">윈모닝</a></li>
							<li><a href="side.do" class="dth2">사이드 &amp; 디저트</a></li>
							<li><a href="drink.do" class="dth2">윈카페 &amp; 음료</a></li>
							<li><a href="happymeal.do" class="dth2">해피밀</a></li>
						</ul></li>
					<li><a href="store.do">Store</a>
						<ul class="depth">
							<li><a href="store.do" class="dth2">매장찾기</a></li>
							<li><a href="delivery.do" class="dth2">윈딜리버리</a></li>
						</ul></li>
					<li><a href="promotion.do">What's New</a>
						<ul class="depth">
							<li><a href="promotion.do" class="dth2">프로모션</a></li>
							<li><a href="news.do" class="dth2">새로운 소식</a></li>
							<li><a href="happyPromotion.do" class="dth2">이 달의 해피밀</a></li>
						</ul></li>
					<li><a href="brandintro.do">Story</a>
						<ul class="depth">
							<li><a href="brandintro.do">브랜드 소개</a></li>
							<li><a href="crew.do">윈도날드 사람들</a></li>
						</ul></li>
					<li><a href="/faq.do" target="_blank" title="새창 열림">고객문의</a>
						<ul class="depth">
							<li><a href="/faq.do" target="_blank" title="새창 열림">FAQ</a></li>
							<li><a href="/qna.do" target="_blank" title="새창 열림">1:1 문의</a></li>
							<li><a href="/private.do">개인정보 처리방침</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>

	</div>
	<div class="aside">
		<a href="burger.do" class="goDelivery" target="_blank" title="새창 열림">Windelivery</a>
	</div>
	<button type="button" class="btnTop">맨 위로 가기</button>
</div>
<!-- //container -->
<script src="resources/js/main_banner.js"></script>
<script>
	var slider = {
		setup : function(target) {
			var sTarget = target.find('.swiper');
			sTarget.addClass('swiper-container');
			sTarget.find('>ul , >ol').addClass('swiper-wrapper');
			sTarget.find('>ul>li , >ol>li').addClass('swiper-slide');

			if (target.find('.swiper').data('swipe')) {
				target.find('.swiper').data('swipe').destroy();
				target.find('.indicator .bar').stop().css('width', '0');
				// target.find('.slide-invisible-blank').remove();
			}

			var opt = {};
			if (target.hasClass('basicSwiper')) {
				var transitionVisible = function() {
					bar.stop().css('width', '0');
					target.find('.swiper-slide').css('visibility', 'visible');
				}
				var transitionHidden = function() {
					target.find('.swiper-slide').css('visibility', 'hidden');
					if (target.hasClass('swiperType02')) {
						target.find('.swiper-slide-next').css('visibility',
								'visible');
					}
					target.find('.swiper-slide-active').css('visibility',
							'visible');
				}
				opt = {
					delay : 5000,
					loop : true,
					navigation : {
						nextEl : target.find('.next'),
						prevEl : target.find('.prev'),
					},
					on : {
						transitionEnd : function() {
							if (target.find('.indicator button').hasClass(
									'pause')) {
								nextH();
							}
							transitionHidden();
						},
						sliderMove : transitionVisible,
						// slideChange 	:	transitionVisible,
						transitionStart : transitionVisible,
					// touchStart		:	transitionVisible
					}
				}
				// 다른 타입
				if (target.hasClass('swiperType02')) {
					opt.slidesPerView = 2;
					opt.slidesPerGroup = 2;
					opt.spaceBetween = 50;
				}

				var bar = target.find('.indicator .bar');
				var inButton = target.find('.indicator button');
				inButton.off().addClass('pause')

				inButton.on('click', function(evt) {
					evt.preventDefault();
					if ($(this).hasClass('pause')) {
						bar.stop().css('width', '0');
						$(this).removeClass('pause');
						$(this).text('재생');
					} else {
						$(this).addClass('pause');
						$(this).text('정지');
						nextH();
					}
				});

				inButton.on('keydown', function(evt) {
					if (!evt.shiftKey) {
						nextH();
					}

				});
				inButton.on('keyup', function(evt) {
					if (evt.shiftKey) {
						transitionVisible();
						transitionHidden();
					}
				});

				target.find('.prev').off().on('keyup', function(evt) {
					if (evt.shiftKey) {
						nextH();
					} else {
						transitionVisible();
						transitionHidden();
					}
				})
			}
		}
	}
</script>
<%@ include file="footer.jsp"%>