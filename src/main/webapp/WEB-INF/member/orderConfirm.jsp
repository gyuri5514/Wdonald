<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/order/orderMain.css" />
<link rel="stylesheet" href="resources/css/order/orderLocal.css" />
<c:if test="${notAvailable eq 'noStoreNear' }">
<script>
	alert('배달 가능한 매장이 없습니다.');
	history.go(-1);
</script>
</c:if>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
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
		var address = $('#m_zipcode').val() +" "+ $('#m_zipcode2').val();
		if($('#m_zipcode').val() == "" || $('#m_zipcode2').val() == "") {
			alert("주소를 입력하세요");
			return;
		} else if($('#delivery_price').val() == 0 || $('#price').val() == 0) {
			alert("입력이 안된 사항이있습니다.");
			return;
		}
		$('#address').val(address);
		var order_comment = $('#order_comment_out').val();
		$('#order_comment').val(order_comment);
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
	
	//주소 검색
	function openDaumPostcode() {
		 var themeObj = {
				 bgColor: "#F8B01B"
				};
		new daum.Postcode({
			
			oncomplete : function(data) {
				document.querySelector("#m_zipcode").value = data.address;
				document.querySelector("#dm_zipcode").value = data.address;
				console.log(data);
				var m_zipcode = $('#m_zipcode').val();
				$("#dm_zipcode").text(data.address);
				$("#dm_zipcode").val(data.address);
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
					<div class="panel panel-lg panel-default" style="width:580px">
						<div class="panel-heading">
							<h3>	
								<span>주문 정보</span>
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
														<ul style="padding-left:3px; padding-top:10px;">
															<li>단품 - ${cartList.cart_b_name}</li>
														</ul>
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
						</div>
					</div>
						<input type="hidden" id="price" name="price" value="${price}">
						<input type="hidden" id="delivery_price" name="delivery_price" value="${delivery_price}">
						<input type="hidden" id="userCouponVO" name="coupon">
						<c:if test="${addressList ne null  }">
										<input type="hidden" id="userAddress_lat" name="lat" value="${addressList[0].address_lat}">
										<input type="hidden" id="userAddress_lon" name="lon" value="${addressList[0].address_lon}">
										<input type="hidden" id="address" name="address" value="${addressList[0].address1} ${addressList[0].address2}">
										<input type="hidden" id="m_zipcode" name="" value="${addressList[0].address1}">
										<input type="hidden" id="order_comment" name="order_comment" value="">
										<input type="hidden" id="coupon_code" name="coupon_code" value="">
										<input type="hidden" id="coupon_title" name="coupon_title" value="">
										<input type="hidden" id="discount" name="discount" value="0">
										
						</c:if>
						<c:if test="${addressList eq null}">
										<input type="hidden" id="userAddress_lat" name="lat">
										<input type="hidden" id="userAddress_lon" name="lon">					
										<input type="hidden" id="address" name="address">
										<input type="hidden" id="m_zipcode" name="" value="">
										<input type="hidden" id="order_comment" name="order_comment" value="">
										<input type="hidden" id="discount" name="discount" value="0">
						</c:if>
					</form>
				</div>
				<div class="col-xs-4" id="col-xs-4">
					<div class="panel panel-basic panel-narrow order-summary" style="width:580px;">
						<div class="panel-heading">
							<h3 class="text-center">주문 요약</h3>
						</div>
						<script type="text/javascript">
						var popupX = (document.body.offsetWidth / 2) - (200 / 2);
						var popupY= (window.screen.height / 2) - (300 / 2)-150;
						function openAddressPopup(){
							window.open('popupAddress.do','_blank','status=no,width=450,height=350,left='+popupX+',top='+popupY+',scrollbars=yes');
						}
						function myCouponBook(price){
							window.open('myCouponBook.do?price='+price,'_blank','status=no,width=450,height=350,left='+popupX+',top='+popupY+',scrollbars=yes');
						}
						</script>
						<div class="panel-section-group">
							<section class="panel-section section-delivery-address">
								<table class="table-default table-delivery-address">
									<tbody>
										<c:if test="${addressList ne null  }">
											<tr>
												<th scope="row" style="width: 80px;"><span>배달 주소:</span></th>
												<td><div id="dm_zipcode" style="text-align:left; font-size:15px;">
													<a id="addressLink" href="javascript:void(0);" onclick="openAddressPopup();">${addressList[0].address1}</a> 
												</div></td>
						 						<td style="width:40px;">
													<span class="input-group-btn"> 
													<a href="javascript:openDaumPostcode()" class="btn btn-md btn-default" id="zip_find" zip="m_zipcode" address1="m_address" focus="address2">
													<i class="fa fa-search"></i></a></span>
												</td>
											</tr>
											<tr>
												<th colspan="4"><input id="m_zipcode2" placeholder="상세주소입력" type="text" class="form-control" value="${addressList[0].address2}" style="height : 30px; color: #999"/></th>
											</tr>
											<tr>
											<th colspan="4" style="padding:2px 0;">주문시 요청사항</th>
											</tr>
											<tr>
												<th colspan="4"><input id="order_comment_out" placeholder="요청사항을 적어주세요" type="text" class="form-control" name="order_comment" value="${addressList[0].order_comment}" style="height : 30px; color: #999"/></th>
											</tr>
										</c:if>
										<c:if test="${addressList eq null}">
											<tr>
												<th scope="row" style="width: 80px;"><span>배달 주소:</span></th>
												<td colspan="2" ><div id="dm_zipcode" style="text-align:left; font-size:15px;"></div></td>
												<td style="width:40px;">
													<span class="input-group-btn"> 
													<a href="javascript:openDaumPostcode()" class="btn btn-md btn-default" id="zip_find" zip="m_zipcode" address1="m_address" focus="address2">
													<i class="fa fa-search"></i></a></span>
												</td>
												
											</tr>
											<tr>
												<th colspan="4"><input id="m_zipcode2" placeholder="상세주소입력" type="text" class="form-control" style="height : 30px; color: #999"/></th>
											</tr>
											<tr>
											<th colspan="4" style="padding:2px 0;">주문시 요청사항</th>
											</tr>
											<tr>
												<th colspan="4"><input id="order_comment_out" placeholder="요청사항을 적어주세요" type="text" class="form-control" name="order_comment"value="" style="height : 30px; color: #999"/></th>
											</tr>
										</c:if>
									</tbody>
								</table>
							</section>
							<section class="panel-section">
								<table class="table-default table-delivery-datetime">
									<tbody>
										<tr>
											<th scope="row"><input type="hidden" id="delivery_time" name="delivery_time" value="40">예상 배달시간: 40분</th>
											<td>
												<div class="when-to-deliver"></div>
												<div class="how-long-to-deliver">

													<span><%= sf.format(nowTime) %></span>

												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</section>
							<section class="panel-section section-promocode">
								<div>
									<a href="#" onclick="couponOpen()" class="action-link action-edit action-edit-promocode collapsed" data-toggle="collapse"> <span style="font-familyl: SpeedeeK">할인 쿠폰</span> <i class="fa"></i></a>
									<div id="enter-promocode" class="collapse">
										<form class="form-promocode" role="form" id="form_promocode" name="form_promocode" method="post" accept-charset="UTF-8" action="#">
											<div class="form-group">
												<div class="input-group">
													<c:if test="${!empty sessionScope.userInfo || !empty sessionScope.kakaoSession || !empty sessionScope.naverSession}">
														<input type="text" name="couponCode" id="couponCode" readonly="readonly" class="form-control"  style="height : 35px;">
														<div class="input-group-btn">
														<button type="button" onclick="myCouponBook('${price}');" class="btn btn-red">
															내쿠폰함
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
													<td>₩<span id="spanPrice">${formatPrice} </span></td>
												</c:when>
											</c:choose>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<th scope="row"><span>배달료:</span></th>
											<fmt:formatNumber type="number" maxFractionDigits="3" var="delivery_price" value="${delivery_price}"/>
											<td><span>+₩${delivery_price}</span></td>
										</tr>
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