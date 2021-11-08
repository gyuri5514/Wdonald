<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="resources/css/menu/menu.css">

<h1 class="container" style="padding-top: 40px">ORDER</h1>
<div class="configurator-body" role="main">
	<div class="configurator-scroller scroller">
		<div class="container">
			<div class="configurator-step step-choose-meals">
				<h3 class="step-title">메뉴를 선택하세요</h3>
				<div class="step-content">
					<div id="available-sets"></div>
					<div>
						<form id="orderForm">
							<table id="table-select-meal" class="table table-select-meal">
								<c:if test="${burgerVO != null}">
								<input type="hidden" id="b_code" value="${burgerVO.b_code}">	
								<thead>
									<tr>
										<th class="controls-colum">&nbsp;</th>
										<th class="picture-column">&nbsp;</th>
										<th colspan="2" class="description-column">&nbsp;</th>
										<th class="cost-column">가격</th>
										<th class="calories-column">kcal</th>
										<th colspan="2" class="side-column">사이드</th>
										<th colspan="2"class="drink-column">음료</th>
										<th class="change-column">변경</th>
									</tr>
								</thead>
								<tbody>
									<tr id="row" class="rowCheck">
										<td class="controls-column">
											<div class="input-group item-quantity item-quantity-picker">
												<input type="checkbox" name="checkbox" value="라지세트" class="form-controla"/> 
											</div>
										</td>
										<td class="picture-column">
											<img src= "${burgerSetVO.b_set_img_path}" alt="" class="img-block1">
										</td>
										<td colspan="2" class="description-column">
											<h4 class="item1-title">${burgerSetVO.b_set_name}</h4>
											<p class="item-description"></p>
										</td>
										<td class="cost-column">${burgerSetVO.b_set_price}</td>
										<td class="calories-column">${burgerSetVO.b_set_kcal}kcal</td>
										<td colspan="2" class="side-column">선택안함</td>
										<td colspan="2" class="drink-column">선택안함</td>
										<td class="change-column"><a href="#" onclick="sideOpen(0)">변경</a></td>
									</tr>
									<tr id="row" class="rowCheck">
										<td class="controls-column">
											<div class="input-group item-quantity item-quantity-picker">
												<input type="checkbox" name="checkbox" value="세트" class="form-controla"/> 
											</div>
										</td>
										<td class="picture-column">
											<img src="${burgerSetVO.b_set_img_path}" alt="" class="img-block2">
										</td>
										<td colspan="2" class="description-column">
											<h4 class="item2-title">${burgerSetVO.b_set_name}</h4>
											<p class="item-description"></p>
										</td>
										<td class="cost-column">${burgerSetVO.b_set_price}</td>
										<td class="calories-column">${burgerSetVO.b_set_kcal}kcal</td>
										<td colspan="2" class="side-column">선택안함</td>
										<td colspan="2" class="drink-column">선택안함</td>
										<td class="change-column"><a href="#" onclick="sideOpen(1)">변경</a></td>
									</tr>
									<tr id="row" class="rowCheck">
										<td class="controls-column">
											<div class="input-group item-quantity item-quantity-picker">
												<input type="checkbox" name="checkbox" value="단품" class="form-controla"/> 
											</div>
										</td>
										<td class="picture-column">
											<img src="${burgerVO.b_img_path}" alt="" class="img-block3">
										</td>
										<td colspan="2" class="description-column">
											<h4 class="item3-title">${burgerVO.b_name}</h4>
											<p class="item-description"></p>
										</td>
										<td class="cost-column">${burgerVO.b_price}</td>
										<td class="calories-column">${burgerVO.b_kcal}kcal</td>
										<td colspan="2" class="side-column"></td>
										<td colspan="2" class="drink-column"></td>
										<td class="change-column"></td>
									</tr>
									</c:if>
									<c:if test="${sideVO != null}">
										<input type="hidden" id="s_code" value="${sideVO.s_code}">
										<input type="hidden" id="s_name" value="${sideVO.s_name}">
										<thead>
											<tr>
												<th class="controls-colum">&nbsp;</th>
												<th class="picture-column">&nbsp;</th>
												<th colspan="2" class="description-column">&nbsp;</th>
												<th class="cost-column">가격</th>
												<th class="calories-column">kcal</th>
												<th colspan="2" class="side-column">사이드</th>
												<th class="change-column">변경</th>
											</tr>
										</thead>
										<tbody>
										<tr id="row" class="rowCheck">
											<td class="controls-column">
												<div class="input-group item-quantity item-quantity-picker">
													<input type="checkbox" name="checkbox" value="사이드" class="form-controla"/> 
												</div>
											</td>
											<td class="picture-column">
												<img src= "${sideVO.s_img_path}" alt="" class="img-block1">
											</td>
											<td colspan="2" class="description-column">
												<h4 class="item1-title">${sideVO.s_name}</h4>
												<p class="item-description"></p>
											</td>
											<td class="cost-column">${sideVO.s_price}</td>
											<td class="calories-column">${sideVO.s_kcal}kcal</td>
											<td colspan="2" class="side-column">선택안함</td>
											<td class="change-column"><a href="#" onclick="sideOpen(0)">변경</a></td>
										</tr>
									</c:if>
									<c:if test="${drinkVO != null}">
									<input type="hidden" id="d_code" value="${drinkVO.d_code}">
									<input type="hidden" id="d_name" value="${drinkVO.d_name}">
									<thead>
										<tr>
											<th class="controls-colum">&nbsp;</th>
											<th class="picture-column">&nbsp;</th>
											<th colspan="2" class="description-column">&nbsp;</th>
											<th class="cost-column">가격</th>
											<th class="calories-column">kcal</th>
											<th colspan="2"class="drink-column">음료</th>
											<th class="change-column">변경</th>
										</tr>
									</thead>
									<tbody>
										<tr id="row" class="rowCheck">
											<td class="controls-column">
												<div class="input-group item-quantity item-quantity-picker">
													<input type="checkbox" name="checkbox" value="음료" class="form-controla"/> 
												</div>
											</td>
											<td class="picture-column">
												<img src= "${drinkVO.b_img_path}" alt="" class="img-block1">
											</td>
											<td colspan="2" class="description-column">
												<h4 class="item1-title">${drinkVO.d_name}</h4>
												<p class="item-description"></p>
											</td>
											<td class="cost-column">${drinkVO.d_price}</td>
											<td class="calories-column">${drinkVO.d_kcal}kcal</td>
											<td colspan="2" class="drink-column">선택안함</td>
											<td class="change-column"><a href="#" onclick="sideOpen(0);">변경</a></td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="configurator-step step-upsell-items" id="upsell-section"></div>
		</div>
	</div>
</div>
<div class="configurator-footer">
	<div class="container">
		<div class="media">
			<div class="media-left">
				<a href="list.do" class="h5 text-default text-ucase btn-back action-cancel">
				<i class="fa fa-caret-left text-primary"></i> 메뉴로 돌아가기</a>
			</div>
			<div class="media-body">
				<div id="cost-section" class="clearfix"></div>
			</div>
			<div class="media-right text-center">
				<button class="btn btn-primary btn-red btn-lg btn-block btn-submit btn-saveorder action-saveorder" id="addBtn">
					<i class="fas fa-shopping-cart"></i>&nbsp;카트에 추가하기
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 사이드 변경 폼 -->
<div class="modal fade in" id="sideModal" aria-hidden="false" style="display: none;">
	<form action="" accept-charset="utf-8">
		<div class="modal-dialog columns-{{columnsToDisplay}}">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title text-ucase">항목을 선택하세요</h2>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<i class="fas fa-times"></i> 	
					</button>
				</div>
				<div class="modal-body">
					<div class="media">
						<div class="pull-left">
							<img src="https://www.mcdelivery.co.kr/kr//static/1635300416887/assets/82/products/1403.png"
								alt="" class="img-block choice-image" />
						</div>
						<div class="media-body">
							<div class="available-choices-list row">
								<div class="choices-column col-xs-12 column-0">
									<div>
										<div class="radio" data-categoryid="">
											<div class="iradio1 checked">
												<input type="radio" name="select-choice" id="side-label1" class="form-radio1"
													data-cartname="후렌치 후라이 - 라지" style="position: absolute; opacity: 0;"
													aria-invalid="false" checked>
											</div>
											<label for="side1" class="side-label1"></label>
										</div>
									</div>
									<div>
										<div class="radio " data-categoryid="">
											<div class="iradio1">
												<input type="radio" name="select-choice" id="side-label2" class="form-radio1"
													data-cartname="골든 모짜렐라 치즈스틱 2조각" style="position: absolute; opacity: 0;"
													aria-invalid="false">
											</div>
											<label for="side2" class="side-label2"></label>
										</div>
									</div>
								</div>
							</div>
							<div class="available-choices-list row"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer text-center">
					<button type="button" id="sideOkbtn" class="btn btn-red btn-lg btn-submit">확인</button>
				</div>
			</div>
		</div>
	</form>
</div>
<!--  라디오버튼 클릭시 음료 이름, 음료 이미지를 ajax로 불러와야하며 불러온 이미지를 .pull-left의 img에 넣어줘야됨 .. -->
<!-- 음료 변경 폼 -->
<div class="modal fade in" id="drinkModal" aria-hidden="false" style="display: none;">
	<form action="" accept-charset="utf-8" novalidate="novalidate">
		<div class="modal-dialog columns-2">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title text-ucase">항목을 선택하세요</h2>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<i class="fas fa-times"></i> 
					</button>
				</div>
				<div class="modal-body">
					<div class="media">
						<div class="pull-left">
							<img src="https://www.mcdelivery.co.kr/kr//static/1635901928321/assets/82/products/1507.png"
								alt="" class="img-block choice-image">
						</div>
						<div class="media-body">
							<div class="available-choices-list row">
								<c:forEach var="drinkList" items="${drinkList}" varStatus="status">
								<div class="choices-column col-xs-4 column-0">
									<c:if test="${status.count eq 1}">
										<div>
											<div class="radio " data-categoryid="">
												<div class="iradio2 checked">
													<input type="radio" name="select-choice" id="${drinkList.d_code}" class="form-radio"
														value="${drinkList.d_name}" data-cartname="${drinkList.d_name}"
														aria-invalid="false" 
														style="position: absolute; opacity: 0;" checked>
												</div>
												<label for="choice-1507" class="radio-label">${drinkList.d_name} </label>
											</div>
										</div>
									</c:if>
									<c:if test="${status.count ne 1}">
										<div>
											<div class="radio " data-categoryid="">
												<div class="iradio2">
													<input type="radio" name="select-choice" id="${drinkList.d_code}" class="form-radio"
														value="${drinkList.d_name}" data-cartname="${drinkList.d_name}"
														aria-invalid="false" 
														style="position: absolute; opacity: 0;">
												</div>
												<label for="choice-1507" class="radio-label">${drinkList.d_name}</label>
											</div>
										</div>
									</c:if>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer text-center">
					<button type="button" class="btn btn-red btn-lg btn-submit" id="drinkOkbtn">확인</button>
				</div>	
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
var side = "";
var drink = "";
var va = "";

//변경 폼
$(function(){
	var b_code = $('#b_code').val();
	var s_code = $('#s_code').val();
	var d_code = $('#d_code').val();
	console.log(b_code);
	console.log(s_code);
	console.log(d_code);
	
 	if(b_code == null && s_code == null && d_code == null) {
		alert("메뉴를 골라라");
		location.href="main.do";
	} 
	
	$("#sideOkbtn").click(function() {
		$("#sideModal").attr("style", "display:none");
		
		if(b_code != null){
			$('.form-radio1').each(function(){
				if($(this).is(":checked")) {
					side = $(this).val();
					console.log(side);
				} 
			});
			$("#drinkModal").slideDown(200);
		} else if(s_code != null) {
			$('.form-radio1').each(function(){
				if($(this).is(":checked")) {
					side = $(this).val();
					console.log(side);
					
					$('.rowCheck').find('.side-column').html(side);
				} 
			});
		} else if(d_code != null) {
			$('.form-radio1').each(function(){
				if($(this).is(":checked")) {
					drink = $(this).val();
					console.log(side);
					
					$('.rowCheck').find('.drink-column').html(drink);
				} 
			});
		}
	});
	
	$("#drinkOkbtn").click(function() {
		$("#drinkModal").attr("style", "display:none");
		
		$('.form-radio').each(function(){
			if($(this).is(":checked")) {
				drink = $(this).val();
				console.log(drink);
			} 
		});
		$('.rowCheck').each(function(){
			if($(this).hasClass('selected')) {
				$(this).find('.side-column').html(side);
				$(this).find('.drink-column').html(drink);
			} 
		});
	});
	
	$(".fas").click(function() {
		$(".modal").attr("style", "display:none");
	});
	
	$('#addBtn').click(function(){
		var va = "";
		$('.form-controla').each(function(){
			if($(this).is(":checked")) {
				va = $(this).val();
				if(va == "라지세트"){
					location.href="cart.do?burger="+b_code+"&va="+va+"&side="+side+"&drink="+drink+"";
				} else if(va == "세트"){ 
					location.href="cart.do?burger="+b_code+"&va="+va+"&side="+side+"&drink="+drink+"";
				} else if(va == "단품"){ 
					location.href="cart.do?burger="+b_code+"&va="+va+"&side="+side+"&drink="+drink+"";
				} else if(va == "사이드"){ 
					location.href="cart.do?&va="+va+"&side="+s_code+"";
				} else if(va == "음료"){ 
					location.href="cart.do?&va="+va+"&drink="+d_code+"";
				} 
			} 
		});
		if(va == "") {
			alert("메뉴를 선택해주세요");
			return;
		}
	});
	
	//체크박스 설정
	$('.form-controla').click(function() {
		if($(this).prop('checked')) {
			$('.form-controla').prop('checked', false);
			$('.form-controla').closest('tr').removeClass("selected");
			$(this).prop('checked', true); 
			$(this).closest('tr').addClass("selected");
		} else { 
			$(this).closest('tr').removeClass("selected");
			return;
		}
	});

	//사이드변경 라디오버튼 설정
	$('.iradio1').click(function() {
		$(this).find('.form-radio1').prop('checked', true);
		if($(this).find('.form-radio1').prop('checked')) {
			$('.form-radio1').prop('checked', false);
			$('.form-radio1').closest('.iradio1').removeClass("checked");
			$(this).find('.form-radio1').prop('checked', true); 
			$(this).addClass("checked");
		} else { 
			$(this).removeClass("checked");
		} 
	});
	
	$('.iradio2').click(function() {
		$(this).find('.form-radio').prop('checked', true);
		if($(this).find('.form-radio').prop('checked')) {
			$('.form-radio').prop('checked', false);
			$('.form-radio').closest('.iradio2').removeClass("checked");
			$(this).find('.form-radio').prop('checked', true); 
			$(this).addClass("checked");
		} else { 
			$(this).removeClass("checked");
		} 
	});
});
function sideOpen(index) {
	var val = "";
	$('.rowCheck').each(function(i){
		console.log(i);
		console.log(index);
		if($(this).find('.form-controla').prop('checked') && i == index){
			val = $(this).find('.form-controla').val();
			if(val == "라지세트"){ 
				$('label[for="side1"]').text("후렌치 후라이 - 라지");
				$('#side-label1').val("후렌치 후라이 - 라지");
				$('label[for="side2"]').text("골든 모짜렐라 치즈스틱 2조각");
				$('#side-label2').val("골든 모짜렐라 치즈스틱 2조각");
				console.log($('label[for="side1"]').text());
				console.log($('#side-label1').val());
				console.log($('label[for="side2"]').text());
				console.log($('#side-label2').val());
			} else if(val == "세트"){ 
				$('label[for="side1"]').text("후렌치 후라이 - 미디움");
				$('#side-label1').val("후렌치 후라이 - 미디움");
				$('label[for="side2"]').text("골든 모짜렐라 치즈스틱 2조각");
				$('#side-label2').val("골든 모짜렐라 치즈스틱 2조각");
				console.log($('label[for="side1"]').text());
				console.log($('#side-label1').val());
				console.log($('label[for="side2"]').text());
				console.log($('#side-label2').val());
			} else if(val == "사이드"){ 
				$('label[for="side1"]').text($('#s_name').val() + " - 라지");
				$('#side-label1').val($('#s_name').val());
				$('label[for="side2"]').text($('#s_name').val() + " - 미디움");
				$('#side-label2').val($('#s_name').val());
				console.log($('label[for="side1"]').text());
				console.log($('#side-label1').val());
				console.log($('label[for="side2"]').text());
				console.log($('#side-label2').val());
			} else if(val == "음료"){ 
				$('label[for="side1"]').text($('#d_name').val() + " - 라지");
				$('#side-label1').val($('#d_name').val());
				$('label[for="side2"]').text($('#d_name').val() + " - 미디움");
				$('#side-label2').val($('#d_name').val());
				console.log($('label[for="side1"]').text());
				console.log($('#side-label1').val());
				console.log($('label[for="side2"]').text());
				console.log($('#side-label2').val());
			} else
				return false;
		}  
	});	
	if(val == "") 
		alert("메뉴를 선택해주세요");
	 else
		$("#sideModal").slideDown(200);
}

function drinkOpen(index) {
	$('.rowCheck').each(function(){
		if($(this).find('a').hasClass('drinkCol'+index)){
			$('.rowCheck').find('.form-controla').prop('checked', false);
			$(this).find('.form-controla').prop('checked', true); 
			
			$('.rowCheck').removeClass("selected");
			
			$(this).addClass("selected");
			
			$("#drinkModal").slideDown(200);
		}
	});		 
}
</script>