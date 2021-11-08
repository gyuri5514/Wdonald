<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<body>
	<div class="content">
		<div class="visualArea bgStory03" data-title="맥도날드 경쟁력"
			data-desc="농장에서 레스토랑까지">
			<div class="inner">
				<h1 class="titDep1">윈딜리버리 경쟁력</h1>
				<p class="subCopy">
					윈딜리버리는 어떤 곳 보다 햄버거 비즈니스를 진지하게 생각합니다.<br> 엄격한 품질 관리 시스템을 통해
					고품질의 음식을 제공하며,조리 과정에서 고객이 궁금한 모든 것을 알려드립니다.
				</p>
				<ul class="navPath">
					<li><a href="main.do">Home</a></li>
					<li><a href="brandintro.do">Story</a></li>
					<li><a href="competition.do">윈딜리버리 경쟁력</a></li>
				</ul>
			</div>
		</div>
		<!-- //visualArea -->
		<div class="contArea">
			<div class="inner">
				<ul class="tabType01">
					<li><a href="/kor/story/competition/farmToRestaurant.do" role="button" aria-selected="true">농장에서 레스토랑까지</a></li>
					<li><a href="/kor/story/competition/faq.do" role="button">궁금한 모든 것을 알려드립니다</a></li>
				</ul>
				<h2 class="hide">농장에서 레스토랑까지</h2>
				<div class="img">
					<img src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_01.jpg" alt="">
				</div>
				<div class="competitive">
					<div class="leftArea">
						<ol class="farmTab tabMn totaltabMn">
							<li><a href="#tab01" role="button" aria-selected="true">원재료
									준비와 가공</a></li>
							<li><a href="#tab02">재료 보관부터 배송까지</a></li>
							<li><a href="#tab03">레스토랑에서의 노력</a></li>
						</ol>
					</div>
					<div class="rightArea">
						<div id="tab01" class="tabCont" style="display: block">
							<h3 class="hide">원재료 준비와 가공</h3>
							<h4 class="titDep3">건강한 식재료가 만들어지는 원재료부터 알아볼까요?</h4>
							<p class="txtInfo">
								원재료 공급사에서는 좋은 재료를 준비하기 위해 엄격한 기준으로<br>원재료 수급 및 가공 과정을 관리하고
								있습니다.
							</p>
							<ul class="foodTab subtabMn">
								<li class="food01"><a href="#subTab01" role="button" aria-selected="true">쇠고기</a></li>
								<li class="food02"><a href="#subTab02">치킨, 돼지고기</a></li>
								<li class="food03"><a href="#subTab03">계란</a></li>
								<li class="food04"><a href="#subTab04">양상추</a></li>
								<li class="food05"><a href="#subTab05">빵</a></li>
							</ul>
							<div id="subTab01" class="subtabCont" style="display: block">
								<h5 class="hide">쇠고기</h5>
								<div class="foodCont">
									<div class="img">
										<img
											src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_steak.jpg"
											alt="">
									</div>
									<div class="txt">
										<h6 class="titDep4">
											쇠고기 이력번호로 꼼꼼하게 관리되는<br>호주, 뉴질랜드산 쇠고기
										</h6>
										<p class="txtInfo">맥도날드 버거 패티는 방부제를 사용하지 않으며, 식약처 등 정부에서
											인증한 안전한 재료를 사용합니다.</p>
										<p class="txtInfo">
											맥도날드 쇠고기 패티는 100% 호주 및 뉴질랜드의 순 쇠고기로 만듭니다.<br> ‘쇠고기
											이력번호’를 통해 쇠고기가 어느 농장에서 생산이 되고,<br>어떠한 경로를 통하여 유통이 되는지를
											철저하게 확인하고 있으며,<br>식품 안전 기준에 맞는 쇠고기만을 사용하기 위하여 만전을 가하고
											있습니다.
										</p>
										<p class="notiTxt fBlack">수입쇠고기유통이력관리시스템 사이트에서 이력번호를 조회하면
											쇠고기의 세부 정보 (수출국 도축장, 가공장, 수출업체 및 도축, 수입일자 등)를 확인할 수 있습니다.</p>
									</div>
								</div>
							</div>
							<div id="subTab02" class="subtabCont">
								<h5 class="hide">치킨, 돼지고기</h5>
								<div class="foodCont">
									<div class="img">
										<img
											src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_chicken_patty.jpg"
											alt="">
									</div>
									<div class="txt">
										<h6 class="titDep4">
											신선하고 안전한 재료로<br>엄선하여 만든 치킨 패티
										</h6>
										<p class="txtInfo">
											맥도날드 버거 패티는 방부제를 사용하지 않으며,<br>식약처 등 정부에서 인증한 안전한 재료를
											사용합니다.
										</p>
										<p class="txtInfo">맥스파이시 상하이 버거에는 국내산 통 닭가슴살을 사용합니다.</p>
									</div>
								</div>
							</div>
							<div id="subTab03" class="subtabCont">
								<h5 class="hide">계란</h5>
								<div class="foodCont">
									<div class="img">
										<img
											src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_egg.jpg"
											alt="">
									</div>
									<div class="txt">
										<h6 class="titDep4">
											우수한 품질로 7년 연속 축산물품평가원의 상을 수상한<br>1+등급 계란
										</h6>
										<p class="txtInfo">축산물품질평가원에서 7년 연속 최우수상 및 우수상을 수상한 업체로부터
											공급받은 1+등급 국내산 계란을 사용합니다.</p>
										<p class="txtInfo">표면 세척과 UV 살균 등 꼼꼼한 위생 처리를 거친 뒤, 레스토랑에서
											조리될 때까지 7̊C 이하로 냉장 보관되어 최상의 신선함을 자랑합니다.</p>
										<p class="notiTxt">
											2012, 2013, 2014, 2016년 최우수상, 2011. 2015, 2017년 우수상 수상<br>(자연
											재해 등 불가피한 경우가 발생될 경우, 수급 업체가 변동 될 수 있습니다.)
										</p>
									</div>
								</div>
							</div>
							<div id="subTab04" class="subtabCont">
								<h5 class="hide">양상추</h5>
								<div class="foodCont">
									<div class="img">
										<img
											src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_lettuce.jpg"
											alt="">
									</div>
									<div class="txt">
										<h6 class="titDep4">매일유업, 신세계 푸드, 한경 등 HACCP 인증 제조사*에서
											공급하는 신선한 양상추</h6>
										<p class="txtInfo">
											농지의 물은 깨끗한지, 토양의 영양분은 풍부한지 농지 주위에<br>오염 요소는 없는지, 양상추가
											자라는 농장부터 꼼꼼히 확인합니다.
										</p>
										<p class="txtInfo">
											수확된 양상추는 3번 이상 꼼꼼하게 세척하며,<br>신선함을 유지하기 위해 진공으로 포장하여,<br>가공한
											지 2일 이내 배송센터로 배송됩니다.
										</p>
										<p class="notiTxt">자연 재해 등 불가피한 경우가 발생될 경우, 수급 업체가 변동될 수
											있습니다.</p>
									</div>
								</div>
							</div>
							<div id="subTab05" class="subtabCont">
								<h5 class="hide">빵</h5>
								<div class="foodCont">
									<div class="img">
										<img
											src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_beon.png"
											alt="">
									</div>
									<div class="txt">
										<h6 class="titDep4">매일 구워 배송 받는 햄버거 빵</h6>
										<p class="txtInfo">맥도날드에서 사용하는 햄버거 빵은 국제식품안전협회(GFSI*)의
											식품안전시스템 규격 인증을 받은 공장에서, 60년 이상의 햄버거 빵 제조 기술을 바탕으로 생산된 우수한 품질의
											제품입니다.</p>
										<p class="txtInfo">신선한 햄버거 빵을 고객들께 제공하게 위해, 하루 수요량에 맞춰
											국내에서 직접 구운 햄버거 빵을 사용합니다. 레스토랑으로 배송을 받을 때는 외부 오염을 차단한 전용 탑차를
											이용하여 신선도를 유지합니다.</p>
										<ul class="notiTxt">
											<li>GFSI (Global Food Safety Initiative) : 소비자에게 안전한 식품의
												공급을 보장하기 위해, 식품 안전 관리 시스템의 지속적인 개선을 목표로 설립된 국제식품안전협회입니다.</li>
											<li>맥도날드에서 사용하는 햄버거 빵은 GFIS가 공인하는 식품안전경영시스템
												(FSSC-22000)을 인증 받은 공장에서 생산되고 있습니다.</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- //원재료 준비와 가공 -->
						<div id="tab02" class="tabCont">
							<h3 class="hide">재료 보관부터 배송까지</h3>
							<h4 class="titDep3">깐깐한 원재료 준비 및 가공 과정만큼 보관과 배송도 중요하겠죠?</h4>
							<p class="txtInfo">
								배송 업체에서는 재료의 신선도와 안전성을 유지하기 위해<br>철저하게 품질을 검사하여 보관하고 배송합니다.
							</p>
							<div class="socialList">
								<ul>
									<li><span class="thum"><img
											src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_02_01.jpg"
											alt=""></span> <strong>최적의 온도와 보안 상태를 확인하는<br>검수
											및 하역 단계
									</strong>
										<p>깐깐한 관리를 통해 선별되고 가공된 원재료는 최적화된 온도에서 보관된 상태로 원재료 컨테이너에
											봉인되어 물류 창고에 도착합니다. 물류업체에서 보안 확인을 마친 후, 트럭과 공장 사이의 공간이 한치의 틈도
											없이 맞물리도록 도킹 작업을 수행, 최적의 온도를 유지하도록 한 후 재료를 하역합니다. 하역과정에서 재료의
											온도를 확인하고 검수하는 과정을 거친 후에, 품질 검사증을 붙여 최적의 상태로 보관될 수 있도록 합니다.</p></li>
									<li><span class="thum"><img
											src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_02_02.jpg"
											alt=""></span> <strong>안전과 청결은 기본, 보관 및 배송 단계</strong>
										<p>검수가 완료된 재료들은 레스토랑으로 이동되기 전까지 재료의 종류, 레스토랑 배송 날짜 등에 따라
											분류하여 안전하고 깨끗하게 보관됩니다. 이 때, 재료들의 신선한 보관을 위해 최적의 온도 상태를 유지합니다.
											재료의 유효기간과 상태를 다시 한 번 점검 후, 배송 차량이 보관 창고에 한 치의 틈도 없이 도킹되면,
											재료들을 차량에 실어 목적지 레스토랑으로 출발하게 됩니다.</p></li>
								</ul>
							</div>
						</div>
						<!-- //재료 보관부터 배송까지 -->
						<div id="tab03" class="tabCont">
							<h3 class="hide">레스토랑에서의 노력</h3>
							<h4 class="titDep3">레스토랑에 도착한 식재료는 어떻게 관리될까요?</h4>
							<p class="txtInfo">
								레스토랑으로 배송된 식재료가 음식으로 조리되어 고객에게 전달되는 순간까지<br>맥도날드의 노력은 멈추지
								않습니다.
							</p>
							<div class="division">
								<h5 class="titDep4">철저한 재료관리</h5>
								<div class="yellowBox">
									철저한 식재료 관리는 농장에서부터 배송센터 뿐만 아니라 레스토랑에서도 계속 되어야겠죠?<br>재료가
									레스토랑으로 배송되면 매뉴얼을 준수, 신선한 상태로 유지하도록 최선을 다합니다.
								</div>
								<div class="socialList">
									<ul>
										<li><span class="thum"><img
												src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_03_01.jpg"
												alt=""></span> <strong>냉장/냉동고로 식재료를 입고할 때<br>적정
												온도 유지는 필수
										</strong>
											<p>배송된 재료가 바로 냉장/냉동실로 이동될 수 있도록 사전에 필요한 공간을 확보해 둡니다. 그리고
												항온 담요와 방수포를 덮어 식재료 온도를 유지하며, 바닥에 닿지 않도록 트레이를 사용하여 냉장/냉동고로
												입고시킵니다.</p></li>
										<li><span class="thum"><img
												src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_03_02.jpg"
												alt=""></span> <strong>샘플 검수를 통해 식재료의 신선한 상태를 점검</strong>
											<p>식재료가 배송되면 기준에 미달하는 식재료는 없는지 냉동/냉장 각 재료 중 일부 박스를 샘플로 뜯어
												확인하고, 문제가 있을 경우 폐기를 위해 반품 처리 합니다.</p></li>
										<li><span class="thum"><img
												src="https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/img/competition/competition_03_03.jpg"
												alt=""></span> <strong>먼저 들어온 제품을 먼저 사용하고<br>냉장/냉동고의
												온도를 철저히 유지
										</strong>
											<p>선입선출이라는 말을 아시나요? 먼저 들어온 식재료부터 들어온 순서에 맞게 사용될 수 있도록
												보관·관리하며, 재료 박스간의 적정 간격을 유지하여 온도가 잘 유지될 수 있도록 보관합니다.</p></li>
									</ul>
								</div>
							</div>
							<div class="division">
								<h5 class="titDep4">조리환경 관리</h5>
								<div class="yellowBox">본격적인 조리를 시작하기 전 조리를 준비하는 과정에서도 식품
									안전을 위한 점검은 계속됩니다.</div>
								<div class="socialList">
									<ul>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_02_01.jpg" alt=""></span>
											<strong>매일 첫 제품이 제공되지 전에<br>조리된 제품의 온도를 체크
										</strong>
											<p>매일 첫 제품이 제공되기 전 패티의 온도를 체크하여 식품 안전 온도를 유지하는지 확인합니다.</p></li>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_02_02.jpg" alt=""></span>
											<strong>식약처 기준보다 더 염격한 산가기준 적용</strong>
											<p>매일 레스토랑 기름의 산가를 측정하여 기준을 초과하는 경우 즉시 교체하고 있습니다. 국내 식품
												위생 법률에서 정한 3.0의 산가 기준보다 더 엄격한 2.5의 산가 기준을 적용합니다.</p></li>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_02_03.jpg" alt=""></span>
											<strong>매일 식품 안전사항을 체크하고 관리</strong>
											<p>모든 레스토랑에서는 매일 식품 안전사항을 체크하여 철저히 품질 관리를 합니다.</p></li>
									</ul>
								</div>
							</div>
							<div class="division">
								<h5 class="titDep4">조리과정 관리</h5>
								<div class="yellowBox">조리 과정에도 안전과 위생과 만전을 기하고 있습니다.</div>
								<div class="socialList">
									<ul>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_03_01.jpg" alt=""></span>
											<strong>패티의 종류에 따라 적정 온도로<br>조리되는 오토 쿠킹 모드
										</strong>
											<p>패티는 그릴이라는 장비를 통해 자동으로 구워집니다. 오토 쿠킹 모드를 누르면 정해진 조리 시간에
												따라 자동으로 조리되며, 정해진 시간이 종료되면 자동으로 상판이 올라가며 조리가 완료됩니다.</p></li>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_03_02.jpg" alt=""></span>
											<strong>교차 오염 방지를 위한 일회용 장갑 사용</strong>
											<p>교차 오염을 방자하기 위해 조리되지 않은 식품을 만질 때는 파란 장갑을, 조리된 식품이나 조리
												도구를 만질 때는 흰 장갑을 사용합니다. 한번 사용한 장갑은 바로 폐기하고, 새 장갑으로 교체하여
												사용합니다.</p></li>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_03_03.jpg" alt=""></span>
											<strong>깨끗하고 안전한 제품을<br>제공하기 위해 준비하는 크루
										</strong>
											<p>레스토랑 주방에서는 30분마다 한번씩 손 씻기 타이머가 울립니다. 주방에서 근무하는 모든 직원들은
												30분마다 한 번씩 손부터 아래팔까지 손을 씻습니다. 청결한 유니폼 착용 등 개인 위생에도 만전을 기합니다.</p>
										</li>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_03_04.jpg" alt=""></span>
											<strong>4시간 경마다 세척하여 사용하는 조리 도구</strong>
											<p>깨끗한 조리 환경을 위해, 레스토랑 직원들은 4시간 경마다 한 번씩 조리 도구를 세척하여 청결하게
												사용하고 있습니다.</p></li>
									</ul>
								</div>
							</div>
							<div class="division">
								<h5 class="titDep4">고객만족을 위한 노력</h5>
								<div class="yellowBox">정성을 다해 만든 제품을 제공하기 위해 보이지 않는 곳까지
									점검합니다.</div>
								<div class="socialList">
									<ul>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_04_01.jpg" alt=""></span>
											<strong>주문이 들어옴과 동시에 음식을<br>만드는 ‘메이드 포 유’ 시스템
										</strong>
											<p>맥도날드는 음식을 미리 만들어 놓지 않고, 고객 주문 접수와 동시에 음식을 만들어 갓 조리된
												신선한 음식만을 제공하는 ‘메이드 포 유(Made for You)’ 시스템을 적용하고 있습니다.</p></li>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_04_02.jpg" alt=""></span>
											<strong>고객의견을 반영한 재품 구성 및 함량 변경</strong>
											<p>위생을 위해 쉬레더로 변경한 양상추의 함량이 적게 느껴진다는 고객 의견을 반영하여 일부 메뉴의
												슈레더 양상추 함량이 30g씩 늘어났습니다.</p></li>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_04_03.jpg" alt=""></span>
											<strong>고객이 주문하는 공간도 언제나 깨끗하게 유지</strong>
											<p>고객이 주문을 하는 카운터와 디지털 키오스트 공간도 언제나 기분 좋게 사용하실 수 있도록 깨끗이
												유지합니다.</p></li>
										<li><span class="thum"><img
												src="/kor/images/story/img_competitive03_04_04.jpg" alt=""></span>
											<strong>고객이 레스토랑을 나가는 순간까지 깨끗하게</strong>
											<p>고객이 음식을 드시는 테이블은 물론, 휴지통과 화장실까지 청결하게 유지될 수 있도록 노력합니다.</p>
										</li>
									</ul>
								</div>
							</div>
							<div class="btnArea">
								<a href="/kor/story/competition/faq.do"
									class="btnMC btnL action">맥도날드의 음식과 재료에 대해 더 궁금한 점이 있다면?</a>
							</div>
						</div>
						<!-- //레스토랑에서의 노력 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="aside">
		<a href="https://www.mcdelivery.co.kr/kr/" class="goDelivery"
			target="_blank" title="새창 열림">Mcdelivery</a>
	</div>
	<button type="button" class="btnTop">맨 위로 가기</button>
	</div>
	<!-- //container -->
	<footer class="footer">

		<div class="footArea">
			<ul class="fUtil">
				<li class="privacy"><a href="/kor/etc/private.do">개인정보 처리방침</a></li>
				<li><a href="/kor/etc/location.do">위치정보 이용약관</a></li>
				<!-- 추가 -->
				<li><a href="/kor/etc/sitemap.do">사이트맵</a></li>
				<li><a href="/kor/store/rental.do">임차문의</a></li>
				<li><a href="https://voc.mcd.co.kr/MC/HOM/faqMain.jsp"
					target="_blank" title="새창 열림">고객문의</a></li>
				<!-- <li><a href="javascript:systemCheck('https://voc.mcd.co.kr/MC/HOM/faqMain.jsp')" title="새창 열림">고객문의</a></li> -->
				<li><a href="/kor/story/people/recruit.do">인재채용</a></li>
			</ul>
			<ul class="fSns">
				<li><a href="https://www.facebook.com/McDonaldsKorea"
					class="fb" target="_blank" title="새창 열림">맥도날드 페이스북</a></li>
				<li><a href="https://www.instagram.com/mcdonalds_kr/"
					class="ig" target="_blank" title="새창 열림">맥도날드 인스타그램</a></li>
				<li><a href="https://www.youtube.com/user/McDonaldsKor"
					class="yt" target="_blank" title="새창 열림">맥도날드 유투브</a></li>
				<li><a href="https://story.kakao.com/ch/mcdonalds/feed"
					class="ks" target="_blank" title="새창 열림">맥도날드 카카오스토리</a></li>
				<li class="web_accessibility"><a
					href="http://www.webwatch.or.kr/Situation/WA_Situation.html?MenuCD=110"
					class="web_accessibility" title="국가 공인 인증기관 : 웹와치" target="_blank">
						<img src="/kor/images/common/web_accessibility.png"
						alt="과학기술정보통신부 WEB ACCESSIBILITY 마크(웹 접근성 품질인증 마크)" />
				</a></li>
			</ul>
			<div class="fInfo">
				<ul class="info">
					<li>한국맥도날드(유)</li>
					<li>대표이사: 앤토니 마티네즈</li>
					<li>사업자등록번호: 101-81-26409</li>
					<li>전화주문: 1600-5252</li>
				</ul>
				<p class="copy">COPYRIGHT &copy; 2019 ALL RIGHTS RESERVED BY
					McDonald's.</p>
			</div>
		</div>
	</footer>
	<!-- //footer -->
	</div>
	<!-- //wrapper -->








	<div class="dimmed"></div>
	<div id="materialPop" class="popLayer layerS">
		<div class="layCont" id="materialPopCon"></div>
		<button type="button" class="layClose">닫기</button>
	</div>
	<script id="materialPopText" type="text/templet">
	<div class="scroll ingrInfo">
	<div class="ingrTop">
		<div class="img"><img src="{pc_image_url}" alt="{pc_kor_alt}"></div>
		<h2 class="tit">{pc_kor_desc}</h2>
	</div>
	<div class="ingrCon">
		{pc_kor_desc}
	</div>
	</div>
	</script>
	<div class="popLayer layerL layerType02" id="storeSearch">
		<div class="layCont">
			<div class="scroll storeSch">
				<div class="schTop">
					<h2 class="popTit">주방 공개의 날/쿠킹 클래스 운영매장</h2>
					<fieldset class="schArea">
						<legend>매장검색</legend>
						<div class="field01">
							<div class="formWrap">
								<label for="store01">시/도</label>
								<div class="selectWrap">
									<select title="시/도 선택" id="store01" style="width: 200px"
										onchange="getGugunJsonp()">
										<option value="">전체</option>
										<option value="서울">서울</option>
										<option value="경기도">경기도</option>
										<option value="강원도">강원도</option>
										<option value="광주">광주</option>
										<option value="경상남도">경상남도</option>
										<option value="경상북도">경상북도</option>
										<option value="대전">대전</option>
										<option value="대구">대구</option>
										<option value="부산">부산</option>
										<option value="인천">인천</option>
										<option value="울산">울산</option>
										<option value="제주">제주</option>
										<option value="전라남도">전라남도</option>
										<option value="전라북도">전라북도</option>
										<option value="충청남도">충청남도</option>
										<option value="충청북도">충청북도</option>
									</select>
								</div>
							</div>
							<div class="formWrap">
								<label for="store02">시/군/구</label>
								<div class="selectWrap">
									<select title="시/군/구 선택" id="store02" style="width: 200px">
										<option value="">전체</option>
									</select>
								</div>
							</div>
						</div>
						<div class="field02">
							<span class="formWrap"> <label for="store03">매장</label> <input
								type="text" id="store03" placeholder="ex)안양">
								<button type="button" class="btnMC btnM"
									onclick="getStoreList()">검색</button>
							</span>
						</div>
					</fieldset>
					<p class="notiTxt">검색이 되지 않는 매장은 다음 달에 행사 계획이 없는 매장입니다.</p>
				</div>
				<div class="schCon">
					<!-- 지도영역 -->
					<div id="storePopMap" class="map"></div>
					<!-- //지도영역 -->
					<!-- 검색결과 있음-->
					<div class="result" id="storeS">
						<ul id="storePopListUl">



						</ul>
					</div>
					<!-- //검색결과 있음-->
					<!-- 검색 결과 없음 -->
					<p class="noResult" id="storeN" style="display: none;">
						<b class="color01" id="searchWordShow"></b>에 대한 검색결과가 없습니다.
					</p>
					<!-- 검색 결과 없음 -->
				</div>
			</div>
		</div>
		<!-- //.layCont-->
		<div class="btnArea">
			<button type="button" class="btnMC btnM" onclick="selectStorePop()">선택완료</button>
		</div>
		<button type="button" class="layClose">닫기</button>
	</div>
	<script>
		if ($(location).attr('pathname') == "/kor/kitchen_step1.do") {//주방 공개의 날에서만 지도 호출 2019-12-18
			var mapPop;
			var marker;
			var mapContainerPop = document.getElementById('storePopMap'), mapOptionPop = {
				center : new daum.maps.LatLng(37.494879, 127.130762),
				level : 3
			};
			mapPop = new daum.maps.Map(mapContainerPop, mapOptionPop); // 지도를 생성합니다
			$(window).on("load", function() {
				$("#store01").select(function() {
					getGugunJsonp();
				});
			});
		}

		function showStorePopMaker(obj) {
			if (marker != undefined && marker != null)
				marker.setMap(null);

			var positions = {
				title : $(obj).data("a_company"),
				latlng : new daum.maps.LatLng($(obj).data("a_loc_x"), $(obj)
						.data("a_loc_y"))
			};
			var imageSize = new daum.maps.Size(54, 70);
			// 마커 이미지를 생성합니다    
			var markerImage = new daum.maps.MarkerImage(
					"/kor/images/whats/ico_marker.png", imageSize);

			// 마커를 생성합니다
			marker = new daum.maps.Marker({
				map : mapPop, // 마커를 표시할 지도
				position : positions.latlng, // 마커를 표시할 위치
				title : positions.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
			// 마커 이미지 
			});
			marker.setMap(mapPop);
			var mLabel = new kakao.maps.InfoWindow({
				position : positions.latlng, // 지도의 중심좌표에 올립니다.
				content : positions.title
			// 인포윈도우 내부에 들어갈 컨텐츠 입니다.
			});
			mLabel.open(mapPop, marker)
			mapPop.panTo(positions.latlng);
		}
		function getGugunJsonp() {
			if ($("#store01").val() == "") {
				$("#store02").html("<option value=\"\">전체</option>");
				commonJs.select.update($('#store02'));
			} else {
				$.support.cors = true;
				$.ajax({
					url : "/kor/kitchen_getGugun.do",
					data : {
						a_sido : $("#store01").val()
					},
					dataType : "json",
					success : function(data) {
						$("#store02").html("");
						var html = "";
						for (var i = 0; i < data.list.length; i++) {
							html += "<option value='"+data.list[i].gugun+"'>"
									+ data.list[i].gugun + "</option>";
						}
						$("#store02").append(html);
						commonJs.select.update($('#store02'));
					}
				});
			}
		}
		function getStoreList() {
			if ($.trim($("#store01").val()) == ""
					&& $.trim($("#store02").val()) == ""
					&& $.trim($("#store03").val()) == "") {
				alert("매장명을 입력해주세요");
				$("#store03").focus();
			} else {
				$.post("/kor/kitchen_getStoreList.do", {
					a_sido : $("#store01").val(),
					a_gugun : $("#store02").val(),
					a_company : $("#store03").val()
				}, function(data) {
					var html = "";
					if (data.list.length > 0) {
						$("#storePopListUl").html("");
						for (var i = 0; i < data.list.length; i++) {
							html += makeHtml("storeListPop", data.list[i]);
						}
						altEscapeTag();
						$("#storePopListUl").append(html);
						$("#storeS").show();
						$("#storePopMap").show();
						$("#storeN").hide();
					} else {
						$("#searchWordShow").html($("#store03").val());
						$("#storePopMap").hide();
						$("#storeS").hide();
						$("#storeN").show();
					}
					$(window).trigger('resize');
				}, "json");
			}
		}
		function selectStorePop() {
			if ($("input:radio[name='store_info']:checked").length > 0) {
				$("#scode").val(
						$("input:radio[name='store_info']:checked").val());
				$("#store_name").val(
						$("input:radio[name='store_info']:checked").data(
								"a_company"));
				commonJs.popup.basic.hide($('#storeSearch'));
				getEvent();
			} else {
				alert("매장을 선택하셔야 합니다");
			}
		}
	</script>
	<script id="storeListPop" type="text/templet">
					<li>
						<span class="formWrap labelR">
							<input type="radio" name="store_info" id="ck_{a_scode}" data-a_loc_x="{a_loc_x}" data-a_loc_y="{a_loc_y}" data-a_scode="{a_scode}" data-a_company="{a_company}"  value="{a_scode}" onclick="showStorePopMaker(this)">
							<label for="ck_{a_scode}">{a_company}</label>	
						</span>
						<div class="addrArea">
							<p class="addr"><em class="hide">주소</em>{a_address_2}</p>
							<p class="phone"><em class="hide">연락처</em><span>{a_tel_1}</span><span>{a_tel_2}</span></p>
						</div>
					</li>
	</script>

	<!-- 크루 이야기 (L) -->
	<div class="popLayer layerS layerType03" id="crew_1">
		<div class="layCont">
			<div class="scroll crewDetail">
				<div class="contHead">
					<div class="img">
						<img src="/kor/images/story/img_crew_pop01.jpg"
							alt="목포 남악 DT점 김지웅 매니저">
					</div>
				</div>
				<div class="contBtm crewCont">
					<h2 class="tit">변화는 나의 자부심</h2>
					<p class="txt">처음엔 ‘그냥 아르바이트 하는 곳’이라는 생각으로 시작 하였던 것이 어느 것 16년을
						함께 하고 있습니다. 맥도날드의 다양한 경험을 통해 항상 새로운 시도와 변화를 먼저 이끌어 나가는 기업이라는 것을
						자연스럽게 느낄 수 있었습니다.</p>
					<p class="txt">
						맥드라이브, 맥딜리버리, 최근의 미래형 매장까지&middot;&middot;&middot;<br>멈추지 않는
						다양한 시도들은 저에게 변화를 함께 만들어 가면서 최초라는 자부심을 갖고 일할 수 있게 해주었습니다.
					</p>
					<p class="txt">
						맥도날드의 변화는 곧 저의 즐거움이자 자부심이며,<br>이러한 새로운 변화를 계속해서 이끌어갈 것입니다.
					</p>
					<p class="crewInfo">목포 남악 DT점 김지웅 매니저</p>
				</div>
			</div>
		</div>
		<button type="button" class="layClose">닫기</button>
	</div>

	<div class="popLayer layerS layerType03" id="crew_2">
		<div class="layCont">
			<div class="scroll crewDetail">
				<div class="contHead">
					<div class="img">
						<img src="/kor/images/story/img_crew_pop02.jpg" alt="경희대점 권영미 크루">
					</div>
				</div>
				<div class="contBtm crewCont">
					<h2 class="tit">매일 열정적일 수 있는 나만의 비결</h2>
					<p class="txt">
						야간 근무를 하면서 밤낮이 바뀐 생활이 쉽진 않았습니다.<br>하지만 한 집안의
						&lsquo;엄마&rsquo;와 &lsquo;아내&rsquo;로서, 그리고 맥도날드에<br>찾아오는 모든 고객
						분들의 &lsquo;이웃&rsquo;과 &lsquo;친구&rsquo;로서 균형을<br>잃지 않기 위해 더
						열심히 일했습니다.
					</p>
					<p class="txt">
						누구보다 더 변화하는 시스템을 긍정적이고 빠르게 받아들이려<br>노력하여, 어느새 저는 매장의 맏언니로 자리할
						수 있었습니다.<br>함께 일하는 크루들도 언제나 열정적인 저의 모습을 통해<br>힘을 얻고 함께
						변화하며 성장하고 있습니다.
					</p>
					<p class="txt">
						오늘 밤에도 나, 그리고 맥도날드를 찾아 주시는<br>고객 분들을 위해 더 열정적으로 일하려 합니다.
					</p>
					<p class="crewInfo">경희대점 권영미 크루</p>
				</div>
			</div>
		</div>
		<button type="button" class="layClose">닫기</button>
	</div>

	<div class="popLayer layerS layerType03" id="crew_3">
		<div class="layCont">
			<div class="scroll crewDetail">
				<div class="contHead">
					<div class="img">
						<img src="/kor/images/story/img_crew_pop03.jpg" alt="미아역점 이지혁 라이더">
					</div>
				</div>
				<div class="contBtm crewCont">
					<h2 class="tit">행복을 배달하는 사람으로.</h2>
					<p class="txt">
						제가 어떤 마음으로 일하느냐에 따라 고객 분들이 느끼는 게<br>다를거라 생각했습니다. 돈을 벌기 위해서,
						어쩔 수 없이 해야하니까 하는 것 보단 스스로 가치 있고 &ldquo;행복을 전달하는 일이다.&rdquo;라고 생각하는
						태도를 갖기로 마음 먹었습니다.
					</p>
					<p class="txt">
						그러자 전보다 감사한 마음으로 일할 수 있었고, <br>그 마음이 어느 정도 고객 분들에게 전달 되어지고
						있다고 생각합니다.
					</p>
					<p class="txt">
						그렇게 감사하며 유쾌하게 일을 하고 있고,<br>더 많은 행복을 전달할 수 있도록 노력할 것 입니다
					</p>
					<p class="crewInfo">미아역점 이지혁 라이더</p>
				</div>
			</div>
		</div>
		<button type="button" class="layClose">닫기</button>
	</div>

	<div class="popLayer layerS layerType03" id="crew_4">
		<div class="layCont">
			<div class="scroll crewDetail">
				<div class="contHead">
					<div class="img">
						<img src="/kor/images/story/img_crew_pop04.jpg" alt="석촌역점 이나라 크루">
					</div>
				</div>
				<div class="contBtm crewCont">
					<h2 class="tit">맥도날드를 넘어, 나 자신의 변화까지</h2>
					<p class="txt">
						올 해, 고객 분들과 직접 접할 일이 더욱 많은 &lsquo;서비스 리더&rsquo;라는 직책을 맡게 되면서 저에게
						고객과의 소통은 중요한 일이 되었습니다. 처음엔 낯설고 힘들었습니다.<br>하지만 고객 분들에게 저희 매장의
						직원들이 친절하다는 칭찬을 듣고 싶은 욕심이 점점 생겼습니다.
					</p>
					<p class="txt">
						그렇게 마음 먹은 뒤로부터 웃는 얼굴로 일하여 노력하기 시작했고, 그러자 일이 즐겁게 느껴졌습니다. <br>
						그런 것을 고객 분들도 알아주시고, 함께 웃는 얼굴로 마주해주시니 제 삶까지 행복해졌습니다.
					</p>
					<p class="txt">
						처음에는 작은 욕심으로 시작한 일이<br>맥도날드의 변화를 넘어, 나 자신의 변화까지 가져왔습니다.
					</p>
					<p class="crewInfo">석촌역점 이나라 크루</p>
				</div>
			</div>
		</div>
		<button type="button" class="layClose">닫기</button>
	</div>

	<script type="text/javascript">
	$(function()
		{
		
		});
	</script>
</body>
</html>