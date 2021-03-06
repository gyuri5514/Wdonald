<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>

<link rel="stylesheet" href="resources/css/payment/orderPay.css">
<link rel="stylesheet" href="resources/css/order/orderLocal.css">
<link rel="stylesheet" href="resources/css/payment/payment.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="resources/js/payment/payment.js"></script>

<script>
$(function() {
	var phone = "";
	var email = "";
	var name = "";
	
	var user_phone = $('#user_phone').val();
	var user_email = $('#user_email').val();
	var user_name = $('#user_name').val();
	
	$("#confirmBtn").click(function() {
	
		if (user_phone == null || user_email == null || user_name == null) {
			if (user_phone == null) {
				alert('휴대폰 번호를 적어주세요');
			} else if (user_email == null) {
				alert('이메일을 적어주세요');
			} else if (user_name == null) {
				alert('이름을 적어주세요');
			}
		}
	}
});
</script>

<div class="main" role="main">
	<div class="h1-area">
		<h3>
			<font>주문 확인</font>
		</h3>
		<hr>
	</div>
	<div class="row row-narrow">
		<div class="col-xs-8" id="col-xs-8">
		<form id="payform" name="payform" action="#" method="post" style="width: 580px;">
			<div class="panel panel-lg panel-default" id="pay-body">
				<div class="form-payment">
					<div class="panel-heading">
						<h3 style="font-size:20px; font-weight:500;">지불 유형을 선택하십시오</h3>
					</div>
					<div class="panel-body">
						<fieldset class="fieldset payment-types">
							<div class="form-group row" style="font-size: 14px; font-weight:500; color:#000">
							<c:choose>
								<c:when test="${not empty sessionScope.userInfo}">
									<input type="hidden" name="user_email" id="user_email" value="${sessionScope.userInfo.user_email}">
									<input type="hidden" name="user_name" id="user_name" value="${sessionScope.userInfo.user_name}">
									<input type="hidden" name="user_seq" id="user_seq" value="${sessionScope.userInfo.user_seq}">
									<c:if test="${not empty sessionScope.userInfo.user_phone }">
									휴대폰 : &nbsp;<input type="text" name="user_phone" id="user_phone" placeholder="'-'없이 작성해주세요." value="${sessionScope.userInfo.user_phone}">
									</c:if>
									<c:if test="${empty sessionScope.userInfo.user_phone  || sessionScope.userInfo.user_phone eq ''}">
									휴대폰 : &nbsp;<input type="text" name="user_phone" id="user_phone" placeholder="'-'없이 작성해주세요." value="">
									</c:if>
								</c:when>
								<c:when test="${not empty sessionScope.kakaoSession}">
									<input type="hidden" name="user_email" id="user_email" value="${sessionScope.kakaoSession.user_email}">
									<input type="hidden" name="user_name" id="user_name" value="${sessionScope.kakaoSession.user_name}">
									<input type="hidden" name="user_seq" id="user_seq" value="${sessionScope.kakaoSession.user_seq}">
									<c:if test="${not empty sessionScope.kakaoSession.user_phone }">
									휴대폰 : &nbsp;<input type="text" name="user_phone" id="user_phone" placeholder="'-'없이 작성해주세요." value="${sessionScope.kakaoSession.user_phone}">
									</c:if>
									<c:if test="${empty sessionScope.kakaoSession.user_phone  || sessionScope.kakaoSession.user_phone eq ''}">
									휴대폰 : &nbsp;<input type="text" name="user_phone" id="user_phone" placeholder="'-'없이 작성해주세요." value="">
									</c:if>
								</c:when>
								<c:when test="${not empty sessionScope.naverSession}">
									<input type="hidden" name="user_email" id="user_email" value="${sessionScope.naverSession.user_email}">
									<input type="hidden" name="user_name" id="user_name" value="${sessionScope.naverSession.user_name}">
									<input type="hidden" name="user_seq" id="user_seq" value="${sessionScope.naverSession.user_seq}">
									<c:if test="${not empty  sessionScope.naverSession.user_phone }">
									휴대폰 : &nbsp;<input type="text" name="user_phone" id="user_phone" placeholder="'-'없이 작성해주세요." value="${sessionScope.naverSession.user_phone}">
									</c:if>
									<c:if test="${empty sessionScope.naverSession.user_phone  || sessionScope.naverSession.user_phone eq ''}">
									휴대폰 : &nbsp;<input type="text" name="user_phone" id="user_phone" placeholder="'-'없이 작성해주세요." value="">
									</c:if>
								</c:when>
								<c:otherwise>
					            휴대폰 : &nbsp;<input type="text" name="user_phone" id="user_phone" placeholder="'-'없이 작성해주세요." value="">
								이메일 : &nbsp;&nbsp;<input type="text" name="user_email" id="user_email" placeholder="example@wdonald.com"><br>
								성함 : <input type="text" name="user_name" id="user_name" >
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${not empty sessionScope.userInfo ||not empty sessionScope.kakaoSession||not empty sessionScope.naverSession}">
										<div class="radio">
												&nbsp;&nbsp;<input type="radio" id="credit" name="payment_type"	value="1" checked="checked">
													<label class="payment" for="creditpayment">&nbsp;신용카드 / 카카오페이 / 기타 </label><br>
												<hr>
												<br> 현장 결제<br><br>
												&nbsp;&nbsp;<input type="radio" id="cash" name="payment_type" value="2">
													<label for="cash">&nbsp;현금</label><br>
													<div id="selectedCash"></div>
													<hr>
													<br>
												&nbsp;&nbsp;<input type="radio" id="card_meeting" name="payment_type" value="3">
													<label for="card_meeting">&nbsp;카드 (현장에서 카드 단말기로 결제)</label> <br>
												<hr>
												<br>
												&nbsp;&nbsp;<input type="checkbox" value="4" id="cashbill" name="cashbill">
													<label for="cashbill">&nbsp;&nbsp;현금 영수증 요청</label> <br> &nbsp; * 핸드폰 번호 &nbsp;&nbsp;&nbsp; +82
												&nbsp;&nbsp;<input type="text" disabled="disabled" placeholder=" 숫자만 입력" style="background-color: #e2e2e2"
													name="cashbillphone" id="cashbillphone"> <br> <br>&nbsp;
												* 결제를 완료하기 위해 외부 웹 사이트로 안전하게 이동합니다.
											</div>
								</c:when>
								<c:otherwise>
										<div class="radio">
												&nbsp;&nbsp;<input type="radio" id="credit" name="payment_type" value="1" checked="checked">
													<label for="creditpayment">&nbsp;신용카드 / 카카오페이 / 기타 </label> <br>
												<hr>
												<br> 현장 결제<br> <br> 
												&nbsp;&nbsp;<input type="radio" id="cash" name="payment_type" value="2" disabled="disabled">
													<label for="cash">&nbsp;현금</label><br>
													<div id="selectedCash"></div>
												<hr>
												<br> &nbsp;&nbsp;<input type="radio" id="card_meeting" name="payment_type" value="3" disabled="disabled">
													<label for="card_meeting">&nbsp;카드 (현장에서 카드 단말기로 결제)</label> <br>
												<hr>
												<br> &nbsp;&nbsp;<input type="checkbox" value="4" id="cashbill" name="cashbill">
													<label for="cashbill">&nbsp;&nbsp;현금 영수증 요청</label> <br> &nbsp; * 핸드폰 번호 &nbsp;&nbsp;&nbsp; +82
													&nbsp;&nbsp;<input type="text" disabled="disabled" placeholder=" 숫자만 입력" style="background-color: #e2e2e2"
													name="cashbillphone" id="cashbillphone"> <br> <br>&nbsp;
												* 결제를 완료하기 위해 외부 웹 사이트로 안전하게 이동합니다.
											</div>
								</c:otherwise>
							</c:choose>
							<br>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</form>
	</div>
	<div class="col-xs-4" id="pay-aside">
		<div class="panel panel-basic panel-narrow order-summary">
			<div class="panel-heading">
				<h3 class="text-center">주문 요약</h3>
			</div>
			<div class="panel-section-group">
				<section class="panel-section">
					<table class="table-default table-delivery-address">
						<tbody>
							<tr>
								<th scope="row">배달 주소:</th>
								<td>
									<div class="delivery_address">
										<input type="hidden" name="user_address" id="user_address" value="${address }">${address } 
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">요청 사항:</th>
									<td>
										<div>
											<input type="hidden" name="order_comment" id="order_comment" value="${order_comment }">${order_comment } 
										</div>
									</td>
								</tr>
						</tbody>
					</table>
				</section>
				<section class="panel-section">
					<table class="table-default table-delivery-datetime">
						<tbody>
							<tr>
								<th scope="row"><input type="hidden" id="delivery_time" name="delivery_time" value="40">예상 배달 시간: 40 분</th>
								<td>
									<div class="when-to-deliver"></div>
									<div class="how-long-to-deliver">
										<small><input id="store_code" type="hidden" value="${store.store_code }">${store.store_name}</small>
										<br>&nbsp;<span><%= sf.format(nowTime) %></span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</section>
				<section class="panel-section">
					<table class="table-default table-cost">
						<tfoot class="total">
							<tr>
								<th scope="row">총 주문합계:  </th>
								<td>
									<input type="hidden" id="total_price" name="total_price" value="${total_price}">
									<input type="hidden" value="${delivery_cost }" name="delivery_cost" id="delivery_cost">
									<input type="hidden" value="${discount }" name="discount" id ="discount">
									<div class="total_price">
										<fmt:formatNumber type="number" maxFractionDigits="3" var="total" value="${total_price}"/>
										<span> ₩ ${total}</span>
									</div>
								</td>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<th scope="row">주문합계:</th>
								<td>
									<fmt:formatNumber type="number" maxFractionDigits="3" var="price" value="${price}"/>
									<span>₩	${price }</span>
								</td>
							</tr>
							<tr>
								<th scope="row">배달료:</th>
								<td>
									<fmt:formatNumber type="number" maxFractionDigits="3" var="delivery_cost" value="${delivery_cost}"/>
									<span>+&nbsp; ₩	${delivery_cost }</span>
								</td>
							</tr>
							<tr>
								<th scope="row">쿠폰: <small>${coupon_title }</small></th>
								
								<td><span>-&nbsp; ₩
										${discount }</span>
								<input type="hidden" value="${coupon_code }" id="coupon_code">
								<input type="hidden" value="${coupon_title }"  id="coupon_title"></td>
							</tr>
							<!-- MDSAP-11635 -->
							<!-- MDSAP-11635 -->
						</tbody>
					</table>
				</section>
				<section class="panel-section section-promotions">
					<div class="promotional-banner">
						<div class="media">
							<div class="media-body">
								<p>매장 별 무료 배달 주문 금액 및 소액주문비는 다르게 운영될 수 있으며, 주문 시 결제 페이지에서 미리 확인 하실 수 있습니다.</p>
							</div>
						</div>
					</div>
				</section>
				<section class="panel-section">
					<fieldset class="form-actions text-center">
						<div class="form-group">
							<button type="button" id="confirmBtn" onclick="submitCashless()" class="btn btn-red btn-block btn-xl" style="margin-top: 0px;">
								<span>결제 진행하기</span>
							</button>
						</div>
						<div class="form-group">
							<a href="#" class="action-secondary action-link ">
								<i class="fa fa-caret-right"></i> &nbsp; <span>주문 재확인</span>
							</a>
						</div>
					</fieldset>
				</section>
			</div>
		</div>
	</div>
</div>
</div>
<%@include file="footer.jsp"%>