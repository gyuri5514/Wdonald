<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

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
			<div class="contArea">
				<div class="inner">
					<div class="menuView">
						<div class="viewTop">
							<div class="name">
								<h2 class="ko">${detailBurger.b_name}</h2>
								<em class="en">${detailBurger.b_e_name}</em>
							</div>
							<div class="info" data-title="슈니언 버거(버거)" data-desc="버거 메뉴">
								<div class="visual"><img src="${detailBurger.b_detail_img_path}" alt="슈니언 버거"></div>
								<div class="desc">
									탱~글한 통새우살과 바삭한 어니언의 조화!<br>슈니언 버거<br>
									<br>
									*판매 시간: 10:30AM~4AM
								</div>
								<div class="other">
									<a href="javascript:goDetail(418);" class="arrow prev"><span class="arr">이전 메뉴</span>
									<div class="img">
										<img src="https://www.mcdonalds.co.kr/upload/product/pcthum/1635296178104.png" alt="스파이시 맥앤치즈 버거">
									</div>
									<strong class="tit">스파이시 맥앤치즈 버거</strong></a>
									<a href="javascript:goDetail(387);" class="arrow next"><span class="arr">다음 메뉴</span>
									<div class="img">
										<img src="https://www.mcdonalds.co.kr/upload/product/pcthum/1621834842041.png" alt="트리플 치즈버거">
									</div>
									<strong class="tit">트리플 치즈버거</strong></a>
								</div>
							</div>
						</div>
						<div class="viewCon">
							<div class="toggle">
								<h4 class="tit">영양정보</h4>
								<button type="button" aria-selected="false" aria-controls="toggle02" aria-expanded="false">영양정보 보기</button><!-- toggle버튼 선택시 aria-selected값 true로 변경 / aria-expanded 값 true로 변경 -->
								<div id="toggle02" class="toggleCon">
									<table class="tableType01 nutrDesc">
										<caption>영양정보 - 영양소별 함량, 영양소기준치 정보표</caption>
										<colgroup><col style="width:15%"><col></colgroup>
										<thead>
											<tr>
												<th scope="row">영양소</th>
												<th scope="col">중량(g)</th>
												<th scope="col">중량(ml)</th>
												<th scope="col">열량</th>
												<th scope="col">당</th>
												<th scope="col">단백질</th>
												<th scope="col">포화지방</th>
												<th scope="col">나트륨</th>
												<th scope="col">카페인</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">함량</th>
												<td>228g</td>
												<td>-</td>
												<td>576kcal</td>
												<td>15g</td>
												<td>14g</td>
												<td>3g</td>
												<td>1117mg</td>
												<td>-</td>
											</tr>
											<tr>
												<th scope="row">영양소기준치</th>
												<td>-</td>
												<td>-</td>
												<td>-</td>
												<td>15%</td>
												<td>26%</td>
												<td>20%</td>
												<td>56%</td>
												<td>-</td>
											</tr>
										</tbody>
									</table>
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
			<!-- //contArea -->
		 <form   id="searchForm" method="post">
			<input type="hidden" name="page" id="page" value="1">
			<input type="hidden" name="seq" id="seq" >
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