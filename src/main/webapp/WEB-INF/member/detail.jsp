<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/bam.css">

	<div id="container">
		<div class="content">
			<div class="visualArea bgMenu01">
				<div class="inner">
					<h1 class="titDep1">버거</h1>
					<p class="subCopy">빅맥<sub class="reg">®</sub>에서 맥스파이시<sub class="reg">®</sub> 상하이버거까지, <br>주문 즉시 바로 조리해 더욱 맛있는, 맥도날드의 다양한 버거를 소개합니다.</p>
					<ul class="navPath">
						<li><a href="/">Home</a></li>
						<li><a href="burger.do">Menu</a></li>
						<li><a href="burger.do">버거</a></li>
					</ul>
				</div>
			</div>
			<c:choose>
				<c:when test="${detailBurger.b_code ne 0}">
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
									<c:if test="${detailBurger.b_code ne 1 }">
										<a href="#" class="arrow prev"><span class="arr">이전 메뉴</span>
											<div class="img" onclick="location.href='detail.do?b_code=${detailBurger.b_code - 1}';">
												<img src="${prevBurger.b_btn_img_path}" alt="${prevBurger.b_name}">
											</div>
											<strong class="tit">${prevBurger.b_name}</strong>
										</a>
									</c:if>
										<a href="#" class="arrow next"><span class="arr">다음 메뉴</span>
											<div class="img" onclick="location.href='detail.do?b_code=${detailBurger.b_code + 1}';">
												<img src="${nextBurger.b_btn_img_path}" alt="${nextBurger.b_name}">
											</div>
											<strong class="tit">${nextBurger.b_name}</strong>
										</a>
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
											<p><b>알레르기 유발 가능 식재료</b> (난류,우유,대두,밀,토마토,새우,쇠고기,굴) <br><b>* 일부 튀김류 제품은 새우 패티와 같은 조리기구를 사용하고 있습니다.</b></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${detailDrink.d_code ne 0}">
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
									<c:if test="${detailDrink.d_code ne 1 }">
										<a href="#" class="arrow prev"><span class="arr">이전 메뉴</span>
											<div class="img" onclick="location.href='detail.do?d_code=${detailDrink.d_code - 1}';">
												<%-- <img src="${prevBurger.b_btn_img_path}" alt="${prevBurger.b_name}"> --%>
											</div>
											<%-- <strong class="tit">${prevBurger.b_name}</strong> --%>
										</a>
									</c:if>
										<a href="#" class="arrow next"><span class="arr">다음 메뉴</span>
											<div class="img" onclick="location.href='detail.do?d_code=${detailDrink.d_code + 1}';">
												<%-- <img src="${nextBurger.b_btn_img_path}" alt="${nextBurger.b_name}"> --%>
											</div>
											<%-- <strong class="tit">${nextBurger.b_name}</strong> --%>
										</a>
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
											<p><b>알레르기 유발 가능 식재료</b> (난류,우유,대두,밀,토마토,새우,쇠고기,굴) <br><b>* 일부 튀김류 제품은 새우 패티와 같은 조리기구를 사용하고 있습니다.</b></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
			<!-- //contArea -->
		 <form   id="searchForm" method="get">
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

			</div>
			<div class="aside">
				<a href="https://www.mcdelivery.co.kr/kr/" class="goDelivery" target="_blank" title="새창 열림">CART</a>
			</div>
			<button type="button" class="btnTop">맨 위로 가기</button>
		</div>
	
<%@ include file="footer.jsp"%>