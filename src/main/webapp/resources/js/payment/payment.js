/*
 *   payment.js 
 */
$(document).ready(function() {
	$('#cashbill').click(function() {
		if ($('input:checkbox[id="cashbill"]').is(":checked") == true) {
			$("#cashbillphone").removeAttr("disabled")
			$("#cashbillphone").css("background-color", "white")
		} else {
			$("#cashbillphone").attr("disabled", "disabled")
			$("#cashbillphone").css("background-color", "#e2e2e2")
		}
	})

	$('#cash').click(function() {
		var content = "&nbsp;<label>금액을 선택해주세요." +
			"</label>&nbsp;&nbsp;&nbsp;<select id='exactCash' name='exactCash'>" +
			"<option value='1만원권'>1만원권</option>" +
			"<option value='5만원권'>5만원권</option>" +
			"<option value='금액에맞게'>금액에 맞게</option></select>";

		if ($('input:radio[id="cash"]').is(":checked") == true) {
			$('#selectedCash').html(content);

		}
		$('#confirmBtn').removeAttr('onclick');
		$('#confirmBtn').attr('onclick', 'onsitePayment()');
	})

	$('#card_meeting').click(function() {
		$('#selectedCash').html("");
		$('#confirmBtn').removeAttr('onclick');
		$('#confirmBtn').attr('onclick', 'onsitePayment()');
	})

	$('#credit').click(function() {
		$('#selectedCash').html("");
		$('#confirmBtn').removeAttr('onclick');
		$('#confirmBtn').attr('onclick', 'submitCashless()');
	})

})
//회원  선결제 , 비회원 카드결제
function submitCashless() {
	
	var IMP = window.IMP; // 생략가능
	var total_price = $('#total_price').val();
	var user_address = $('#user_address').val()==null||$('#user_address').val()==""?"":$('#user_address').val();
	var user_email = $('#user_email').val();
	var delivery_cost = $('#delivery_cost').val();
	/*var discount = $('#discount').val()==''||*/
	var discount = $('#discount').val();
	var store_code = $("#store_code").val();
	var coupon_no = "i don't care'";
	var order_comment= "상냥하게 주세요";
	var user_seq = $('#user_seq').val()==null||$('#user_seq').val()=="nm"?"":$('#user_seq').val();
	var final_price = total_price - discount;
	if(user_email.indexOf('kakao#')!=-1||user_email.indexOf('naver#')!=-1){
		user_email = user_email.substring(6);
	}
	
	var user_name = $('#user_name').val();
	var user_phone = $('#user_phone').val()==null||$('#user_phone').val()==""?"010-0000-0000":$('#user_phone').val();
	IMP.init('imp43424363');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
		pg: 'html5_inicis', // version 1.1.0부터 지원.
		/*
		'kakao':카카오페이,
		html5_inicis':이니시스(웹표준결제)
		'nice':나이스페이
		'jtnet':제이티넷
		'uplus':LG유플러스
		'danal':다날
		'payco':페이코
		'syrup':시럽페이
		'paypal':페이팔
		*/
		pay_method: 'card',
		/*
		'samsung':삼성페이,
		'card':신용카드,
		'trans':실시간계좌이체,
		'vbank':가상계좌,
		'phone':휴대폰소액결제
		*/
		merchant_uid: 'md'+user_seq + new Date().getTime(),
		/*
		merchant_uid에 경우
		https://docs.iamport.kr/implementation/payment
		위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		참고하세요.
		나중에 포스팅 해볼게요.
		*/
		name: 'WDonald Delivery '+total_price + '원 결제 요청',
		//결제창에서 보여질 이름
		amount: total_price,
		//가격
		buyer_email: user_email,
		buyer_name: user_name,
		buyer_tel: user_phone,
		buyer_addr: user_address,
		buyer_postcode: '',
/*		m_redirect_url: 'https://localhost:8080/controller/main.do'*/		
/*
		모바일 결제시,
		결제가 끝나고 랜딩되는 URL을 지정
		(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		*/
	}, function(rsp) {
		console.log(rsp);
		$.ajax({
			type:"POST",
			url: "payment/verifyIamport.do?imp_uid="+rsp.imp_uid
		}).done(function(data){
			console.log(data);
			if(rsp.paid_amount==data.response.amount){
				alert("결제 및 결제검증완료");
				$.ajax({
					type:"POST",
					url : "paywinCredit.do",
					asnyc: false,
					data: JSON.stringify({
						"user_name": user_name,
						"user_address": user_address,
						"user_phone" : user_phone,
						"user_email" : $('#user_email').val(),
						"total_price" : (total_price-delivery_cost),
						"final_price" : final_price,
						"discount" : discount,
						"order_comment": order_comment,
						"payment_type" : data.response.payMethod,
						"store_code" : store_code,
						"coupon_no" : coupon_no,
						"merchantuid" : data.response.merchantUid,
						"pay_status" : data.response.status,
						"order_comment" : order_comment
					}),
					contentType:"application/json"
				}).done(function(){
					window.location.href = "http://localhost:8080/controller/main.do";
				})
			}else{
					alert("결제 및 결제검증 실패");
			}
			//위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행(import 서버검증)
		})
		
	});
}
//만나서 결제 , 회원만 가능
function onsitePayment() {
	var user_seq = $('#user_seq').val();
	var total_price = $('#total_price').val();
	var user_address = $('#user_address').val()==null||$('#user_address').val()==""?"":$('#user_address').val();
	var user_email = $('#user_email').val();
	var delivery_cost = $('#delivery_cost').val();
	/*var discount = $('#discount').val()==''||*/
	var discount = $('#discount').val();
	var order_comment = "";
	var store_code = $("#store_code").val();
	var coupon_no = "";
	var order_comment=  $('#order_comment').val()==null||$('#order_comment').val()==""?"":$('#order_comment').val();
	var final_price = total_price - discount;
	
	if(user_email.indexOf('kakao#')!=-1||user_email.indexOf('naver#')!=-1){
		user_email = user_email.substring(6);
	}
	
	var payment_value = $(':radio[name="payment_type"]:checked').val();
	var payment_type;
	if(payment_value==2){
		payment_type="현금";
	}else{
		payment_type="현장에서 카드 결제";
	}
	var exactCash =  $('#exactCash').val();
	
	var user_name = $('#user_name').val();
	var user_phone = $('#user_phone').val()==null||$('#user_phone').val()==""?"010-0000-0000":$('#user_phone').val();
	
	var codeWdonald = new Date();
	
				$.ajax({
					type:"POST",
					url :  "paywinCredit.do",
					asnyc: false,
					data: JSON.stringify({
						"user_name": user_name,
						"user_address": user_address,
						"user_phone" : user_phone,
						"user_email" : $('#user_email').val(),
						"total_price" : total_price,
						"final_price" : final_price,
						"discount" : discount,
						"order_comment": order_comment,
						"payment_type" : '현장결제' ,
						"store_code" : store_code,
						"coupon_no" : coupon_no,
						"pay_status" : payment_type,
						"merchantuid" : 'osp'+codeWdonald.getDay()+codeWdonald.getMonth()
									+codeWdonald.getFullYear()+codeWdonald.getHours()
									+codeWdonald.getMinutes()+codeWdonald.getSeconds()+user_seq,
						"order_comment" : order_comment,
						"exactCash" : exactCash,
						
					}),
					contentType:"application/json"
				})
	window.location.href = "http://localhost:8080/controller/main.do";
}