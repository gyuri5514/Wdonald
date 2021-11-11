<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/bam.css">

<c:if test="${detailBurger.b_code ne null}">
	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu01">
				<div class="inner">
					<h1 class="titDep1">버거</h1>
					<p class="subCopy">빅맥<sub class="reg">®</sub>에서 맥스파이시<sub class="reg">®</sub> 상하이버거까지, <br>주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.</p>
					<ul class="navPath">
						<li><a href="/">Home</a>
						<li><a href="burger.do">Menu</a></li>
						<li><a href="burger.do">버거</a></li>
					</ul>
				</div>
			</div>
			<div class="contArea">
				<div class="inner">
					<div class="menuView">
						<div class="viewTop">
							<div class="name">
								<h2 class="ko">${detailBurger.b_name}</h2>
								<em class="en">${detailBurger.b_e_name}</em>
							</div>
							<div class="info" data-title="${detailBurger.b_name}" data-desc="버거 메뉴">
								<div class="visual"><img src="${detailBurger.b_detail_img_path}" alt="${detailBurger.b_name}"></div>
								<div class="desc">
									<p>${detailBurger.b_detail_comment}</p>
								</div>
								<div class="other">
								<c:if test="${detailBurger.b_code ne 101}">
									<a href="#" class="arrow prev" onclick="location.href='detail.do?b_code=${detailBurger.b_code - 1}';"><span class="arr">이전 메뉴</span></a>
								</c:if>
								<c:if test="${detailBurger.b_code ne 121}">
									<a href="#" class="arrow next" onclick="location.href='detail.do?b_code=${detailBurger.b_code + 1}';"><span class="arr">다음 메뉴</span></a>
								</c:if>
								</div>
							</div>
						</div>
						<div class="viewCon">
							<div class="toggle">
								<h4 class="tit">영양정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle02" aria-expanded="false">영양정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle02" class="toggleCon">
									<img src="${detailBurger.b_n_img_path}" id="nutrition_img">
								</div>
							</div>
							<div class="toggle">
								<h4 class="tit">알레르기 정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle03" aria-expanded="false">알레르기 정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle03" class="toggleCon">
									<div class="allerDesc">
										<p><b>알레르기 유발 가능 식재료</b>${detailBurger.b_allergy}<br><b>* 일부 튀김류 제품은 새우 패티와 같은 조리기구를 사용하고 있습니다.</b></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${detailMorning.w_code ne null}">
	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu02">
				<div class="inner">
					<h1 class="titDep1">윈모닝</h1>
					<p class="subCopy">새벽 4시부터 오전 10시 30분까지<br>
					갓 구워내 신선한 맥모닝으로 따뜻한 아침 식사를 챙겨 드세요!</p>
					<ul class="navPath">
						<li><a href="/">Home</a></li>
						<li><a href="burger.do">Menu</a></li>
						<li><a href="morning.do">윈모닝</a></li>
					</ul>
				</div>
			</div>
			<div class="contArea">
				<div class="inner">
					<div class="menuView">
						<div class="viewTop">
							<div class="name">
								<h2 class="ko">${detailMorning.w_name}</h2>
								<em class="en">${detailMorning.w_e_name}</em>
							</div>
							<div class="info" data-title="${detailMorning.w_name}" data-desc="윈모닝 메뉴">
								<div class="visual"><img src="${detailMorning.w_detail_img_path}" alt="${detailMorning.w_name}"></div>
								<div class="desc">
									<p>${detailMorning.w_detail_comment}</p>
								</div>
								<div class="other">
								<c:if test="${detailMorning.w_code ne 401}">
									<a href="#" class="arrow prev" onclick="location.href='detail.do?w_code=${detailMorning.w_code - 1}';"><span class="arr">이전 메뉴</span></a>
								</c:if>
								<c:if test="${detailMorning.w_code ne 409}">
									<a href="#" class="arrow next" onclick="location.href='detail.do?w_code=${detailMorning.w_code + 1}';"><span class="arr">다음 메뉴</span></a>
								</c:if>
								</div>
							</div>
						</div>
						<div class="viewCon">
							<div class="toggle">
								<h4 class="tit">영양정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle02" aria-expanded="false">영양정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle02" class="toggleCon">
									<img src="${detailMorning.w_n_img_path}" id="nutrition_img">
								</div>
							</div>
							<div class="toggle">
								<h4 class="tit">알레르기 정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle03" aria-expanded="false">알레르기 정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle03" class="toggleCon">
									<div class="allerDesc">
										<p><b>알레르기 유발 가능 식재료</b>${detailMorning.w_allergy}<br><b>* 일부 튀김류 제품은 새우 패티와 같은 조리기구를 사용하고 있습니다.</b></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${detailHappyMeal.h_code ne null}">
	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu03">
				<div class="inner">
					<h1 class="titDep1">해피밀</h1>
					<p class="subCopy">맛과 즐거움 모두 해피밀을 통해 느껴보세요!</p>
					<ul class="navPath">
						<li><a href="/">Home</a></li>
						<li><a href="burger.do">Menu</a></li>
						<li><a href="happymeal.co">해피밀</a></li>
					</ul>
				</div>
			</div>
			<div class="contArea">
				<div class="inner">
					<div class="menuView">
						<div class="viewTop">
							<div class="name">
								<h2 class="ko">${detailHappyMeal.h_name}</h2>
								<em class="en">${detailHappyMeal.h_e_name}</em>
							</div>
							<div class="info" data-title="${detailHappyMeal.h_name}" data-desc="해피밀 메뉴">
								<div class="visual"><img src="${detailHappyMeal.h_detail_img_path}" alt="${detailHappyMeal.h_name}"></div>
								<div class="desc">
									<p>${detailHappyMeal.h_detail_comment}</p>
								</div>
								<div class="other">
								<c:if test="${detailHappyMeal.h_code ne 901}">
									<a href="#" class="arrow prev" onclick="location.href='detail.do?h_code=${detailHappyMeal.h_code - 1}';"><span class="arr">이전 메뉴</span></a>
								</c:if>
								<c:if test="${detailHappyMeal.h_code ne 908}">
									<a href="#" class="arrow next" onclick="location.href='detail.do?h_code=${detailHappyMeal.h_code + 1}';"><span class="arr">다음 메뉴</span></a>
								</c:if>
								</div>
							</div>
						</div>
						<div class="viewCon">
							<div class="toggle">
								<h4 class="tit">영양정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle02" aria-expanded="false">영양정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle02" class="toggleCon">
									<img src="${detailHappyMeal.h_n_img_path}" id="nutrition_img">
								</div>
							</div>
							<div class="toggle">
								<h4 class="tit">알레르기 정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle03" aria-expanded="false">알레르기 정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle03" class="toggleCon">
									<div class="allerDesc">
										<p><b>알레르기 유발 가능 식재료</b>${detailHappyMeal.h_allergy}<br><b>* 일부 튀김류 제품은 새우 패티와 같은 조리기구를 사용하고 있습니다.</b></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${detailSide.s_code ne null}">
	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu04">
				<div class="inner">
					<h1 class="titDep1">사이드 &amp; 디저트</h1>
					<p class="subCopy">가볍게 즐겨도, 버거와 함께 푸짐하게 즐겨도,<br>
					언제나 맛있는 사이드와 디저트 메뉴!</p>
					<ul class="navPath">
						<li><a href="/">Home</a></li>
						<li><a href="burger.do">Menu</a></li>
						<li><a href="side.do">사이드 &amp; 디저트</a></li>
					</ul>
				</div>
			</div>
			<div class="contArea">
				<div class="inner">
					<div class="menuView">
						<div class="viewTop">
							<div class="name">
								<h2 class="ko">${detailSide.s_name}</h2>
								<em class="en">${detailSide.s_e_name}</em>
							</div>
							<div class="info" data-title="${detailSide.s_name}" data-desc="사이드 메뉴">
								<div class="visual"><img src="${detailSide.s_detail_img_path}" alt="${detailSide.s_name}"></div>
								<div class="desc">
									<p>${detailSide.s_detail_comment}</p>
								</div>
								<div class="other">
								<c:if test="${detailSide.s_code ne 701}">
									<a href="#" class="arrow prev" onclick="location.href='detail.do?s_code=${detailSide.s_code - 1}';"><span class="arr">이전 메뉴</span></a>
								</c:if>
								<c:if test="${detailSide.s_code ne 708}">
									<a href="#" class="arrow next" onclick="location.href='detail.do?s_code=${detailSide.s_code + 1}';"><span class="arr">다음 메뉴</span></a>
								</c:if>
								</div>
							</div>
						</div>
						<div class="viewCon">
							<div class="toggle">
								<h4 class="tit">영양정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle02" aria-expanded="false">영양정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle02" class="toggleCon">
									<img src="${detailSide.s_n_img_path}" id="nutrition_img">
								</div>
							</div>
							<div class="toggle">
								<h4 class="tit">알레르기 정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle03" aria-expanded="false">알레르기 정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle03" class="toggleCon">
									<div class="allerDesc">
										<p><b>알레르기 유발 가능 식재료</b>${detailSide.s_allergy}<br><b>* 일부 튀김류 제품은 새우 패티와 같은 조리기구를 사용하고 있습니다.</b></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${detailDrink.d_code ne null}">
	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu05">
				<div class="inner">
					<h1 class="titDep1">맥카페 &amp; 음료</h1>
					<p class="subCopy">언제나 즐겁게, 맥카페와 다양한 음료를 부담없이 즐기세요!</p>
					<ul class="navPath">
						<li><a href="/">Home</a></li>
						<li><a href="burger.do">Menu</a></li>
						<li><a href="drink.co">맥카페 &amp; 음료</a></li>
					</ul>
				</div>
			</div>
			<div class="contArea">
				<div class="inner">
					<div class="menuView">
						<div class="viewTop">
							<div class="name">
								<h2 class="ko">${detailDrink.d_name}</h2>
								<em class="en">${detailDrink.d_e_name}</em>
							</div>
							<div class="info" data-title="${detailDrink.d_name}" data-desc="음료 메뉴">
								<div class="visual"><img src="${detailDrink.d_detail_img_path}" alt="${detailDrink.d_name}"></div>
								<div class="desc">
									<p>${detailDrink.d_detail_comment}</p>
								</div>
								<div class="other">
								<c:if test="${detailDrink.d_code ne 301}">
									<a href="#" class="arrow prev" onclick="location.href='detail.do?d_code=${detailDrink.d_code - 1}';"><span class="arr">이전 메뉴</span></a>
								</c:if>
								<c:if test="${detailDrink.d_code ne 328}">
									<a href="#" class="arrow next" onclick="location.href='detail.do?d_code=${detailDrink.d_code + 1}';"><span class="arr">다음 메뉴</span></a>
								</c:if>
								</div>
							</div>
						</div>
						<div class="viewCon">
							<div class="toggle">
								<h4 class="tit">영양정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle02" aria-expanded="false">영양정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle02" class="toggleCon">
									<img src="${detailDrink.d_n_img_path}" id="nutrition_img">
								</div>
							</div>
							<div class="toggle">
								<h4 class="tit">알레르기 정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle03" aria-expanded="false">알레르기 정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle03" class="toggleCon">
									<div class="allerDesc">
										<p><b>알레르기 유발 가능 식재료</b>${detailDrink.d_allergy}<br><b>* 일부 튀김류 제품은 새우 패티와 같은 조리기구를 사용하고 있습니다.</b></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
<!-- //contArea -->
<form id="searchForm" method="get">
	<input type="hidden" name="page" id="page" value="1">
	<input type="hidden" name="seq" id="seq">
	<input type="hidden" name="sub_category_seq" id="sub_category_seq" value="1">
</form>
<script>
$(function() {
	toggleButton();
});
function toggleButton() {
	$('.toggle').find('>button').each(function() {
			var t = $(this);
			var b = t.closest('.toggle');
			var con = $(document).find('#' + t.attr('aria-controls'));
			var arr = [];
			if (t.attr('text')) {
				arr = t.attr('text').split('|');
			}

			$(this).on('click', function(evt) {
				var s, n;
				evt.preventDefault();
				if (t.attr('aria-selected') == 'true') {
					t.attr({
						'aria-selected' : false,
						'aria-expanded' : false
					});
					b.removeClass('open');
					con.stop().show();
					n = con.outerHeight();
					s = 200 * (n / 400)
					con.slideUp(s);
					if (arr.length) {
						t.text(arr[0]);
					}
				} else {
					t.attr({
						'aria-selected' : true,
						'aria-expanded' : true
					});
					b.addClass('open');
					n = con.outerHeight();
					s = 100 * (n / 400)
					// console.log( s )
					con.stop().hide().slideDown(s);
					if (arr.length) {
						t.text(arr[1]);
					}
				}

			});
		});
	}
	function goDetail(seq) {
		$("#seq").val(seq);
		$("#searchForm").attr("action", "detail.do");
		$("#searchForm").submit();
	}
	function showSize(seq) {
		$("#seq").val(seq);
		$("#searchForm").attr("action", "size.do");
		$("#searchForm").submit();
	}
	function openMaterial(seq) {
		$.post("materialPop.do", {
			seq : seq,
		}, function(data) {
			if (data.is_ok == "ok") {
				$("#materialPopCon").html(getMaterial(data.material));
				altEscapeTag();
				commonJs.popup.basic.show($('#materialPop'));
			} else {
				alert("재료정보 가져오기에 실패하였습니다\관리자에게 문의하세요");
			}
		}

		);
	}
	function getMaterial(data) {
		return makeHtml("materialPopText", data);
	}
</script>
<div class="aside">
	<a href="https://www.mcdelivery.co.kr/kr/" class="goDelivery" target="_blank" title="새창 열림">CART</a>
</div>
<button type="button" class="btnTop">맨 위로 가기</button>
<%@ include file="footer.jsp"%>