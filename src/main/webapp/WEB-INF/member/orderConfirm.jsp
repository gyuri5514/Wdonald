<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="resources/css/order/orderMain.css" />
<link rel="stylesheet" href="resources/css/order/orderLocal.css" />
<script type="text/javascript">
	$(function(){
		window.onkeydown = function() {	//새로고침시 파라미터값 제거
			var kcode = event.keyCode;
			if(kcode == 116) {
				history.replaceState({}, null, location.pathname);
			}
		}
	});
	function order() {
		document.getElementById("orderForm").action = "paymentWin.do";
		document.getElementById("orderForm").submit();
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
													<td class="cost">₩${cartList.cart_b_Lgset_price}</td>
													<td class="many">${cartList.cart_many}</td>
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
													<td class="cost">₩${cartList.cart_b_set_price}</td>
													<td class="many">${cartList.cart_many}</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_b_code != null && cartList.cart_b_set_code == null}">
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
													<td class="cost">₩${cartList.cart_b_price}</td>
													<td class="many">${cartList.cart_many}</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_s_code != null}">
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
													<td class="cost">₩${cartList.cart_s_price}</td>
													<td class="many">${cartList.cart_many}</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_d_code != null}">
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
													<td class="cost">₩${cartList.cart_d_price}</td>
													<td class="many">${cartList.cart_many}</td>
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
													<td class="cost">₩${cartList.cart_w_set_price}</td>
													<td class="many">${cartList.cart_many}</td>
												</tr>
											</c:if>
											<c:if test="${cartList.cart_w_code != null}">
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
													<td class="cost">₩${cartList.cart_w_price}</td>
													<td class="many">${cartList.cart_many}</td>
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
													<td class="cost">₩${cartList.cart_dessert_price}</td>
													<td class="many">${cartList.cart_many}</td>
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
										<tr>
											<th scope="row"><span>배달 주소:</span></th>
											<td><div>서울특별시 금천구 시흥동 1026-0 남서울힐스테이트 ㅇㄹ</div></td>
										</tr>
									</tbody>
								</table>
							</section>
							<section class="panel-section section-delivery-datetime">
								<table class="table-default table-delivery-datetime">
									<tbody>
										<tr>
											<th scope="row">예상 배달 시간:</th>
											<td>
												<div class="when-to-deliver"></div>
												<div class="how-long-to-deliver">
													<span>2021/10/30 02:05</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</section>
							<section class="panel-section section-promocode">
								<div>
									<a href="#enter-promocode" class="action-link action-edit action-edit-promocode collapsed" data-toggle="collapse"> <span>쿠폰 코드 입력</span> <i class="fa"></i></a>
									<div id="enter-promocode" class="collapse">
										<form class="form-promocode" role="form" id="form_promocode" name="form_promocode" method="post" accept-charset="UTF-8" action="/kr/applyCoupon.html">
											<div class="form-group">
												<div class="input-group">
													<input type="text" name="couponCode" id="couponCode" class="form-control">
													<div class="input-group-btn">
														<button type="submit" class="btn btn-red">
															적용
														</button>
													</div>
												</div>
												<label for="enter-promocode" class="control-hint"></label>
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
													<td><span>₩${price} </span></td>
												</c:when>
											</c:choose>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<th scope="row"><span>배달료:</span></th>
											<td>₩ 7,000</td>
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