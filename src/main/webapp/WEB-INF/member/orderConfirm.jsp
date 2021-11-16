<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/order/orderMain.css" />
<link rel="stylesheet" href="resources/css/order/orderLocal.css" />

<script type="text/javascript">
	$(function(){
		window.onkeydown = function() {	//새로고침시
			var kcode = event.keyCode;
			if(kcode == 116) {
				history.replaceState({}, null, 'orderConfirm.do?va=새로고침&price='+${price}+"&delivery_price=" +${delivery_price}+"");
			}
		}
	});
	function order() {
		var address = $('#m_zipcode').val() + $('#m_zipcode2').val();
		if(address == "") {
			alert("주소를 입력하세요");
			return;
		} else if($('#delivery_price').val() == 0 || $('#price').val() == 0) {
			alert("입력이 안된 사항이있습니다.");
			return;
		}
		$('#address').val(address);
		document.getElementById("orderForm").action = "paymentWin.do";
		document.getElementById("orderForm").submit();
	}
	function couponOpen() {
		if($(".collapse").hasClass("checked")) {
			$(".collapse").removeClass("checked");
			$(".collapse").attr("style", "display:none; visibility:hidden;");
		} else {
			$(".collapse").addClass("checked");
			$(".collapse").attr("style", "display:block; visibility:visible;");
		}
	};
	
	function couponBtn() {
		var couponCode = $('#couponCode').val();
		$('.control-hint').text("");
		$('.control-hint').attr("style", "display:none");
		
		if(couponCode == "") {
			alert('쿠폰코드를 입력해라');
			return;
		}
		
		$.ajax({
			type : 'get',
			data : {couponCode : couponCode},
			url : 'couponSearch.do',
			dataType : 'json',
			success : function(data) {
				if(data == 0) {
					$('.control-hint').text("쿠폰코드가 존재하지않습니다.");
					$('.control-hint').attr("style", "display:block");
				} else if(data == -1) {
					$('.control-hint').text("쿠폰함에 쿠폰이 존재하지않습니다.");
					$('.control-hint').attr("style", "display:block");
				} else {
					$('.control-hint').text("사용가능한 쿠폰입니다.");
					$('.control-hint').attr("style", "display:block");
					$('#userCouponVO').val(couponCode); 
					console.log($('#userCouponVO').val());
				}
			},
			error : function(message) {
				alert("상태 : " +message.status+ "\n\n메세지 : " +message.responseText+ "\n\nerror : " +message.error);
			}
		});
	}
	
	//dddd?
	function openDaumPostcode() {
		 var themeObj = {
				 bgColor: "#F8B01B"
				};
		new daum.Postcode({
			
			oncomplete : function(data) {
				document.querySelector("#m_zipcode").value = data.address;
				
				var m_zipcode = $('#m_zipcode').val();
				$("#m_zipcode").text(data.address);
				var geocoder = new kakao.maps.services.Geocoder();

				geocoder.addressSearch(m_zipcode, function(result, status) {
				
					//success
					if (status === kakao.maps.services.Status.OK) {
					    var lat = result[0].y;
					    var lon = result[0].x;
					    $('#userAddress_lat').val(lat);
					    $('#userAddress_lon').val(lon);
					    console.log($('#userAddress_lat').val());
					    console.log($('#userAddress_lon').val());
					}
				});
				
			},
			theme: themeObj 
		}).open();
	}
	
</script>
<div class="main" role="main">
	<div class="clearfix">
		<div class="page-title pull-left">
			<h1>
				<span>주문 세부사항</span>
			</h1>
		</div>
	</div>
	<div class="page-content">
		<div class="row row-narrow">
			<div class="col-xs-8" id="col-xs-8">
				<form name="orderForm" id="orderForm" role="form"  method="get"  >
					<div class="panel panel-lg panel-default">
						<div class="panel-heading">
							<h3>	
								<span>내 주문 정보</span>
							</h3>
						</div>
						<div class="panel-body">
							<section class="panel-section my-orders">
								<table class="table-default table-order-details">
									<c:if test="${cartList != null}">
									<tbody>
										<c:forEach var="cartList" items="${cartList}" varStatus="status">
											<c:if test="${cartList.cart_b_Lgset_code != null}">
												<tr id="${status.count}">
													<td class="quantity">${status.count}</td>
													<td class="picture-img">
														<img src="${cartList.cart_b_Lgset_img_path}" alt="">
														<div class="controls">
															<a class="text-gray-light btn-action action-edit" href="order.do?b_code=${cartList.cart_b_code}&va=변경&num=${status.index}" title="변경">
																<i class="fas fa-pen"></i></a>
															<a class="text-gray-light btn-action action-delete" href="orderConfirm.do?va=삭제&num=${status.index}" title="삭제" onclick="onProductRemoveClick({ 'name':'단품 - 스파이시 맥앤치즈 버거','id':'2085','price':'6900.000','brand':'McDonalds','variant':'','quantity':'1'})">
																<i class="far fa-trash-alt"></i></a>
														</div>
													</td>
													<td class="product-name">
														<div>${cartList.cart_b_Lgset_name}</div>
														<ul style="padding-left:3px; padding-top:10px;">
															<li>단품 - ${cartList.cart_b_name}</li>
															<li>${cartList.cart_d_name}</li>
															<li>${cartList.cart_s_name}</li>
														</ul>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${cartList.cart_b_Lgset_price}"/>
													<td class="cost">₩${formatPrice}</td>
													<td class="many">${cartList.cart_quantity}개</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_b_set_code != null}">
												<tr id="${status.count}">
													<td class="quantity">${status.count}</td>
													<td class="picture-img">
														<img src="${cartList.cart_b_set_img_path}" class="img-block" alt="">
														<div class="controls">
															<a class="text-gray-light btn-action action-edit" href="order.do?b_code=${cartList.cart_b_code}&va=변경&num=${status.index}" title="변경">
																<i class="fas fa-pen"></i></a>
															<a class="text-gray-light btn-action action-delete" href="orderConfirm.do?va=삭제&num=${status.index}" title="삭제" onclick="onProductRemoveClick({ 'name':'단품 - 스파이시 맥앤치즈 버거','id':'2085','price':'6900.000','brand':'McDonalds','variant':'','quantity':'1'})">
																<i class="far fa-trash-alt"></i></a>
														</div>
													</td>
													<td class="product-name">
														<div>${cartList.cart_b_set_name}</div>
														<ul style="padding-left:3px; padding-top:10px;">
															<li>단품 - ${cartList.cart_b_name}</li>
															<li>${cartList.cart_d_name}</li>
															<li>${cartList.cart_s_name}</li>
														</ul>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${cartList.cart_b_set_price}"/>
													<td class="cost">₩${formatPrice}</td>
													<td class="many">${cartList.cart_quantity}개</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_b_code != null && cartList.cart_b_set_code == null && cartList.cart_b_Lgset_code == null}">
												<tr id="${status.count}">
													<td class="quantity">${status.count}</td>
													<td class="picture-img">
														<img src="${cartList.cart_b_img_path}" class="img-block" alt="">
														<div class="controls">
															<a class="text-gray-light btn-action action-edit" href="order.do?b_code=${cartList.cart_b_code}&va=변경&num=${status.index}" title="변경">
																<i class="fas fa-pen"></i></a>
															<a class="text-gray-light btn-action action-delete" href="orderConfirm.do?va=삭제&num=${status.index}" title="삭제" onclick="onProductRemoveClick({ 'name':'단품 - 스파이시 맥앤치즈 버거','id':'2085','price':'6900.000','brand':'McDonalds','variant':'','quantity':'1'})">
																<i class="far fa-trash-alt"></i></a>
														</div>
													</td>
													<td class="product-name">
														<div>${cartList.cart_b_name}</div>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${cartList.cart_b_price}"/>
													<td class="cost">₩${formatPrice}</td>
													<td class="many">${cartList.cart_quantity}개</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_s_code != null && cartList.cart_b_code == null && cartList.cart_w_code == null && cartList.cart_h_code == null}">
												<tr id="${status.count}">
													<td class="quantity">${status.count}</td>
													<td class="picture-img">
														<img src="${cartList.cart_s_img_path}" class="img-block" alt="">
														<div class="controls">
															<a class="text-gray-light btn-action action-edit" href="order.do?s_code=${cartList.cart_s_code}&va=변경&num=${status.index}" title="변경">
																<i class="fas fa-pen"></i></a>
															<a class="text-gray-light btn-action action-delete" href="orderConfirm.do?va=삭제&num=${status.index}" title="삭제" onclick="onProductRemoveClick({ 'name':'단품 - 스파이시 맥앤치즈 버거','id':'2085','price':'6900.000','brand':'McDonalds','variant':'','quantity':'1'})">
																<i class="far fa-trash-alt"></i></a>
														</div>
													</td>
													<td class="product-name">
														<div>${cartList.cart_s_name}</div>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${cartList.cart_s_price}"/>
													<td class="cost">₩${formatPrice}</td>
													<td class="many">${cartList.cart_quantity}개</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_d_code != null && cartList.cart_b_code == null && cartList.cart_w_code == null && cartList.cart_h_code == null }">
												<tr id="${status.count}">
													<td class="quantity">${status.count}</td>
													<td class="picture-img">
														<img src="${cartList.cart_d_img_path}" class="img-block" alt="">
														<div class="controls">
															<a class="text-gray-light btn-action action-edit" href="order.do?d_code=${cartList.cart_d_code}&va=변경&num=${status.index}" title="변경">
																<i class="fas fa-pen"></i></a>
															<a class="text-gray-light btn-action action-delete" href="orderConfirm.do?va=삭제&num=${status.index}" title="삭제" onclick="onProductRemoveClick({ 'name':'단품 - 스파이시 맥앤치즈 버거','id':'2085','price':'6900.000','brand':'McDonalds','variant':'','quantity':'1'})">
																<i class="far fa-trash-alt"></i></a>
														</div>
													</td>
													<td class="product-name">
														<div>${cartList.cart_d_name}</div>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${cartList.cart_d_price}"/>
													<td class="cost">₩${formatPrice}</td>
													<td class="many">${cartList.cart_quantity}개</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_w_set_code != null}">
												<tr id="${status.count}">
													<td class="quantity">${status.count}</td>
													<td class="picture-img">
														<img src="${cartList.cart_w_set_img_path}" class="img-block" alt="">
														<div class="controls">
															<a class="text-gray-light btn-action action-edit" href="order.do?b_code=${cartList.cart_w_set_code}&va=변경&num=${status.index}" title="변경">
																<i class="fas fa-pen"></i></a>
															<a class="text-gray-light btn-action action-delete" href="orderConfirm.do?va=삭제&num=${status.index}" title="삭제" onclick="onProductRemoveClick({ 'name':'단품 - 스파이시 맥앤치즈 버거','id':'2085','price':'6900.000','brand':'McDonalds','variant':'','quantity':'1'})">
																<i class="far fa-trash-alt"></i></a>
														</div>
													</td>
													<td class="product-name">
														<div>${cartList.cart_w_set_name}</div>
														<ul style="padding-left:3px; padding-top:10px;">
															<li>단품 - ${cartList.cart_w_name}</li>
															<li>${cartList.cart_d_name}</li>
															<li>${cartList.cart_s_name}</li>
														</ul>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${cartList.cart_w_set_price}"/>
													<td class="cost">₩${formatPrice}</td>
													<td class="many">${cartList.cart_quantity}개</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_w_code != null && cartList.cart_w_set_code == null}">
												<tr id="${status.count}">
													<td class="quantity">${status.count}</td>
													<td class="picture-img">
														<img src="${cartList.cart_w_img_path}" class="img-block" alt="">
														<div class="controls">
															<a class="text-gray-light btn-action action-edit" href="order.do?b_code=${cartList.cart_w_code}&va=변경&num=${status.index}" title="변경">
																<i class="fas fa-pen"></i></a>
															<a class="text-gray-light btn-action action-delete" href="orderConfirm.do?va=삭제&num=${status.index}" title="삭제" onclick="onProductRemoveClick({ 'name':'단품 - 스파이시 맥앤치즈 버거','id':'2085','price':'6900.000','brand':'McDonalds','variant':'','quantity':'1'})">
																<i class="far fa-trash-alt"></i></a>
														</div>
													</td>
													<td class="product-name">
														<div>${cartList.cart_w_name}</div>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${cartList.cart_w_price}"/>
													<td class="cost">₩${formatPrice}</td>
													<td class="many">${cartList.cart_quantity}개</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_h_code != null}">
												<tr id="${status.count}">
													<td class="quantity">${status.count}</td>
													<td class="picture-img">
														<img src="${cartList.cart_h_img_path}" class="img-block" alt="">
														<div class="controls">
															<a class="text-gray-light btn-action action-edit" href="order.do?b_code=${cartList.cart_h_code}&va=변경&num=${status.index}" title="변경">
																<i class="fas fa-pen"></i></a>
															<a class="text-gray-light btn-action action-delete" href="orderConfirm.do?va=삭제&num=${status.index}" title="삭제" onclick="onProductRemoveClick({ 'name':'단품 - 스파이시 맥앤치즈 버거','id':'2085','price':'6900.000','brand':'McDonalds','variant':'','quantity':'1'})">
																<i class="far fa-trash-alt"></i></a>
														</div>
													</td>
													<td class="product-name">
														<div>${cartList.cart_h_name}</div>
														<ul style="padding-left:3px; padding-top:10px;">
															<li>${cartList.cart_d_name}</li>
															<li>${cartList.cart_s_name}</li>
														</ul>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${cartList.cart_h_price}"/>
													<td class="cost">₩${formatPrice}</td>
													<td class="many">${cartList.cart_quantity}개</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_dessert_code != null}">
												<tr id="${status.count}">
													<td class="quantity">${status.count}</td>
													<td class="picture-img">
														<img src="${cartList.cart_dessert_img_path}" class="img-block" alt="">
														<div class="controls">
															<a class="text-gray-light btn-action action-edit" href="order.do?dessert_code=${cartList.cart_dessert_code}&va=변경&num=${status.index}" title="변경">
																<i class="fas fa-pen"></i></a>
															<a class="text-gray-light btn-action action-delete" href="orderConfirm.do?va=삭제&num=${status.index}" title="삭제" onclick="onProductRemoveClick({ 'name':'단품 - 스파이시 맥앤치즈 버거','id':'2085','price':'6900.000','brand':'McDonalds','variant':'','quantity':'1'})">
																<i class="far fa-trash-alt"></i></a>
														</div>
													</td>
													<td class="product-name">
														<div>${cartList.cart_dessert_name}</div>
													</td>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${cartList.cart_dessert_price}"/>
													<td class="cost">₩${formatPrice}</td>
													<td class="many">${cartList.cart_quantity}개</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
									</c:if>
								</table>
							</section>
<!-- 										<section class="panel-section order-remarks">
											<div class="form-group">
												<label for="form_review_order_remarks" class="field-label"><h3>배달시 요청 사항:</h3></label> <input type="text" class="form-control input-lg" name="form_review_order_remarks" id="form_review_order_remarks" data-rule-verifyspecialcharacters="true" data-msg-verifyspecialcharacters="form.reviewconfirm.orderverification.orderremark.error.invalid" value="">
											</div>
											<label class="control-hint" for="form_review_order_remarks">"&gt;", "", ";"와 같은 특정 특수문자는 사용 불가합니다.</label>											
										</section>
-->						</div>
					</div>
						<input type="hidden" id="price" name="price" value="${price}">
						<input type="hidden" id="delivery_price" name="delivery_price" value="${delivery_price}">
						<input type="hidden" id="userCouponVO" name="coupon">
						<input type="hidden" id="userAddress_lat" name="lat">
						<input type="hidden" id="userAddress_lon" name="lon">
						<input type="hidden" id="address" name="address">
					</form>
				</div>
				<div class="col-xs-4" id="col-xs-4">
					<!-- <form name="form_order_summary" id="form_order_summary" th:action="@{/applyCoupon.html}" method="post" role="form" data-required-symbol="*" accept-charset="utf-8">  -->
					<div class="panel panel-basic panel-narrow order-summary">
						<div class="panel-heading">
							<h3 class="text-center">주문 요약</h3>
						</div>
						<div class="panel-section-group">
							<section class="panel-section section-delivery-address">
								<table class="table-default table-delivery-address">
									<tbody>
										<c:if test="${address != null }">
											<tr>
												<th scope="row"><span>배달 주소:</span></th>
												<td><div id="m_zipcode" style="text-align:left; font-size:15px;">${address1}</div></td>
						 						<td style="width:40px;">
													<span class="input-group-btn"> 
													<a href="javascript:openDaumPostcode()" class="btn btn-md btn-default" id="zip_find" zip="m_zipcode" address1="m_address" focus="address2">
													<i class="fa fa-search"></i></a></span>
												</td>
											</tr>
											<tr>
												<th colspan="4"><input id="m_zipcode2" placeholder="상세주소입력" type="text" class="form-control" style="height : 30px; color: #999"/>${address2}</th>
											</tr>
										</c:if>
										<c:if test="${address == null }">
											<tr>
												<th scope="row" ><span>배달 주소:</span></th>
												<td colspan="2" ><div id="m_zipcode" style="text-align:left; font-size:15px;"></div></td>
												<td style="width:40px;">
													<span class="input-group-btn"> 
													<a href="javascript:openDaumPostcode()" class="btn btn-md btn-default" id="zip_find" zip="m_zipcode" address1="m_address" focus="address2">
													<i class="fa fa-search"></i></a></span>
												</td>
											</tr>
											<!-- <tr id="d" style="display: none"></tr> -->
											<tr>
												<th colspan="4"><input id="m_zipcode2" placeholder="상세주소입력" type="text" class="form-control" style="height : 30px; color: #999"/></th>
											</tr>
										</c:if>
									</tbody>
								</table>
							</section>
							<section class="panel-section section-promocode">
								<div>
									<a href="#" onclick="couponOpen()" class="action-link action-edit action-edit-promocode collapsed" data-toggle="collapse"> <span>쿠폰 코드 입력</span> <i class="fa"></i></a>
									<div id="enter-promocode" class="collapse">
										<form class="form-promocode" role="form" id="form_promocode" name="form_promocode" method="post" accept-charset="UTF-8" action="#">
											<div class="form-group">
												<div class="input-group">
													<c:if test="${userInfo == null}">
														<input type="text" name="couponCode" id="couponCode" class="form-control" style="height : 35px;" readonly>
														<div class="input-group-btn">
														<button type="button" class="btn btn-red" onclick="couponBtn()" disabled>
															적용
														</button>
													</div>
													</c:if>
													<c:if test="${userInfo != null}">
														<input type="text" name="couponCode" id="couponCode" class="form-control" style="height : 35px;">
														<div class="input-group-btn">
														<button type="button" onclick="couponBtn()" class="btn btn-red">
															적용
														</button>
													</div>
													</c:if>
												</div>
												<label for="enter-promocode" class="control-hint" style="display:none; font-size:15px; color:red;"></label>
											</div>
										</form>
									</div>
								</div>
							</section>	
							<section class="panel-section section-cost-breakdown">
								<table class="table-default table-cost">
									<tfoot class="total">
										<tr>
											<c:choose>
												<c:when test="${cartList == null}">
													<th scope="row"><span>총 주문합계:</span></th>
													<td><span>₩ 0</span></td>
												</c:when>
												<c:when test="${cartList != null}">
													<th scope="row"><span>총 주문합계:</span></th>
													<fmt:formatNumber type="number" maxFractionDigits="3" var="formatPrice" value="${price}"/>
													<td><span>₩${formatPrice} </span></td>
												</c:when>
											</c:choose>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<th scope="row"><span>배달료:</span></th>
											<td>₩ ${delivery_price}</td>
										</tr>
										<!-- MDSAP-11635-v1 -->
										
										<!-- MDSAP-11635-v1 -->
									</tbody>
								</table>
								<fieldset class="form-actions text-center">
									<div class="form-group">
										<button type="button" class="btn btn-red btn-block btn-xl" onclick="order();">
											<span>주문 확인</span>
										</button>
									</div>
									<div class="form-group">
										<a class="action-secondary action-link " href="main.do"><i class="fa fa-caret-right"></i> &nbsp; <span>항목 추가</span></a>
									</div>
								</fieldset>
							</section>
							<!-- section class="panel-section">
					<img src="http://placehold.it/300x100" alt="" class="img-block promotional-banner" />
				</section-->
						</div>
					</div>
					<!-- </form>  -->
				</div>
			</div>
		</div>
		<div id="loading-view" class="loading-view hidden">
			<div class="loading">
				<span class="loading-icon"></span>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp"%>