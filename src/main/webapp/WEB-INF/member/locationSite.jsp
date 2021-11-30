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

		<div class="titleArea" data-title="위치기반서비스이용약관"
			data-desc="위치기반서비스이용약관">
			<div class="inner">
				<h1 class="titDep1">위치기반서비스이용약관</h1>
				<ul class="navPath">
					<li><a href="/main.do">Home</a></li>
					<li><a href="/locationSite.do">위치기반서비스이용약관</a></li>
				</ul>
			</div>
		</div>
		<!-- //visualArea -->
		<div class="contArea">
			<div class="inner">
				<div class="termsCont location_terms">
					<h2>제 1 조 (목적)</h2>
					<p>이 약관은 한국윈도날드(유)(이하 &apos;회사&apos;)가 제공하는 위치정보사업 또는
						위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로
						합니다.</p>
					<h2>제 2 조 (약관 외 준칙)</h2>
					<p>이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호
						등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보취급방침, 회사가 별도로 정한
						지침 등에 의합니다.</p>
					<h2>제 3 조 (개인위치정보 수집방법)</h2>
					<ol>
						<li>1.&apos;회사&apos;는 브라우저 제조사와 GPS칩이 내장된 전용단말기로 수집되는 정보로
							개인위치정보를 수집합니다.</li>
						<li>2. 전항의 개인위치정보의 수집방법이 변경되는 경우 회사는 인터넷 등에 공지하거나 고객에게 통지합니다.
							다만, 회사가 통제할 수 없는 사유가 발생하여 사전 통지가 불가능한 경우에는 사후에 통지합니다.</li>
					</ol>
					<h2>제 4 조 (서비스 내용 및 요금)</h2>
					<p>회사가 제공하는 위치기반 서비스는 아래와 같습니다.</p>
					<table class="tableType02">
						<caption>서비스 명칭 및 내용,요금 정보 내용</caption>
						<colgroup>
							<col style="width: 50%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="lineC">서비스 명칭 및 내용</th>
								<th scope="col">요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>* 주변 매장 찾기<br> - 현재의 위치를 기반으로 하여 주변 매장의 위치 등의 정보를
									제공하는 서비스
								</td>
								<td>- 서비스의 이용 : 무료<br> - 서비스의 이용을 위한 데이터 통신 비용 : 이동통신사
									및 회원이 가입 요금제에 따름
								</td>
							</tr>
						</tbody>
					</table>
					<h2>제 5 조 (개인위치정보주체의 권리)</h2>
					<ol>
						<li>1. 개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의
							이용ㆍ제공 목적, 제공받는 자의 범위 및 위치기반서비스의 일부에 대하여 동의를 유보할 수 있습니다.</li>
						<li>2. 개인위치정보주체는 회사에 대하여 언제든지 개인위치정보의 수집에 대한 동의 또는 개인위치정보를
							이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이
							경우 회사는 수집한 개인위치정보 및 위치정보 수집,이용, 제공사실 확인자료(동의의 일부를 철회한 경우에는 철회한
							부분의 개인위치정보 및 위치정보 이용,제공사실 확인자료에 한함)를 파기합니다.</li>
						<li>3. 개인위치정보주체는 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를
							요구할 수 있으며, 회사는 이를 거절할 수 없고 이를 위한 기술적 수단을 갖추고 있습니다.
							<ol class="roman">
								<li>개인위치정보주체에 대한 위치정보 수집&middot;이용&middot;제공사실 확인자료</li>
								<li>개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에
									의하여 제3자에게 제공된 이유 및 내용</li>
							</ol>
						</li>
						<li>4. 개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에
							오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.</li>
						<li>5. 개인위치정보주체는 제1항 내지 제4항의 권리행사를 고객센터를 통해 회사에 요구할 수 있습니다.</li>
					</ol>
					<h2>제 6 조 (위치정보의 보유기간 및 이용기간)</h2>
					<p>회사는 개인위치정보주체의 개인위치정보 수집, 이용 또는 제공 목적을 달성하거나, 본 약관에 따라
						개인위치정보주체가 개인위치정보의 수집, 이용 또는 제공에 대한 동의의 전부 또는 일부에 대하여 철회한 때에는,
						위치정보법 제16조 제2항의 규정에 의하여 기록&middot;보존하여야 하는 위치정보 이용ㆍ제공 사실 확인자료 외의
						당해 개인위치정보주체의 개인위치정보를 지체 없이 파기합니다.</p>
					<h2>제7조 (적용제외)</h2>
					<p>만 14세 미만인자는 회원 가입대상이 아니므로, 회사는 회원가입이 불가능한 만14세 미만 자의 위치정보를
						수집하지 않습니다. 따라서 만14세 미만의 이용자에 대해서는 위치기반서비스와 관련한 민원 발생 등에 대해서는 책임을
						지지 않습니다.</p>
					<h2>제 8 조 (개인위치정보 제3자 제공 및 제한)</h2>
					<ol>
						<li>1. 회사는 회원의 동의 없이 회원의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 서비스를
							제공하는 경우에는 제공 받는 자 및 제공목적을 사전에 회원에게 고지합니다.</li>
						<li>2. 회사는 개인위치정보를 회원이 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해
							통신단말장치로 매회 회원에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 단, 아래 각 호에 해당하는
							경우에는 회원이 미리 특정하여 지정한 통신단말장치 또는 전자우편주소로 통보합니다.
							<ol class="roman">
								<li>개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우</li>
								<li>회원이 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소로 통보할 것을
									미리 요청한 경우</li>
							</ol>
						</li>
						<li>3. 개인위치정보 등의 이용제공의 제한 회사는 회원의 동의가 있거나 아래 각 호에 해당하는 경우를
							제외하고는 개인위치정보 또는 위치정보 수집,이용, 제공사실 확인자료를 본 약관에 명시하거나 별도 고지한 범위를 넘어
							이용하거나 제3자에게 제공하지 않습니다.
							<p>가. 위치기반서비스 제공에 따른 요금정산 위하여 위치정보 수집, 이용, 제공사실 확인자료가 필요한 경우</p>
							<p>나. 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는
								경우</p>
						</li>
					</ol>
					<h2>제 9 조 (손해배상)</h2>
					<p>개인위치정보주체는 회사의 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 26조의 규정을 위반한
						행위로 손해를 입은 경우에 회사에 대하여 손해배상을 청구할 수 있습니다. 이 경우 회사는 고의 또는 과실이 없음을
						입증하지 아니하면 책임을 면할 수 없습니다.</p>
					<h2>제10조(면책)</h2>
					<p>회사는 다음 각 호의 경우로 서비스를 제공할 수 없는 경우 이로 인하여 회원에게 발생한 손해에 대해서는
						책임을 부담하지 않습니다.</p>
					<ol>
						<li>1. 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우</li>
						<li>2. 회원의 귀책사유로 서비스 이용에 장애가 있는 경우</li>
						<li>3. 제1호 내지 제2호를 제외한 기타 회사의 고의·과실이 없는 사유로 인한 경우</li>
					</ol>
					<h2>제 11 조 (분쟁의 조정)</h2>
					<ol>
						<li>1. 회사는 위치정보와 관련된 분쟁에 대하여 개인위치정보주체와 협의가 이루어지지 아니하거나 협의를 할
							수 없는 경우에는 방송통신위원회에 재정을 신청할 수 있습</li>
						<li>2. 회사 또는 회원은 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할
							수 없는 경우에는 개인정보보호법 제43조의 규정에 의한 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.</li>
					</ol>
					<h2>제 12 조 (회사의 연락처 및 위치정보관리 책임자)</h2>
					<ol>
						<li>1. 회사의 상호, 주소, 전화번호 그 밖의 연락처는 다음과 같습니다.
							</h4>
							<ul>
								<li>상호: 한국윈도날드 유한회사</li>
								<li>대표이사: 앤토니 마티네즈</li>
								<li>주소: 서울특별시 종로구 종로51 종로타워 14층</li>
								<li>전화번호: 080-208-1588</li>
							</ul>
						</li>
						<li>2. 회사는 다음과 같이 위치정보관리 책임자를 지정하여 위치정보를 적절히 관리ㆍ보호하고 서비스
							이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보주체의 권리 보호를 위해 힘쓰고 있습니다.
							</h4>
							<ul>
								<li>위치정보관리 책임자: 김철홍</li>
								<li>전화번호: 080-208-1588</li>
							</ul>
						</li>
					</ol>
					<h2>부칙</h2>
					<dl>
						<dt>제 1 조 시행일</dt>
						<dd>본 약관은 2019년 7월 25일부터 적용됩니다.</dd>
					</dl>
				</div>
				<!-- //termsCont -->
			</div>
		</div>
	</div>
	<div class="aside">
		<a href="burger.do" class="goDelivery" target="_blank" title="새창 열림">WDonald</a>
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